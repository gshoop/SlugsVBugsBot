/*
 * File: TemplateSubHSM.c
 * Author: J. Edward Carryer
 * Modified: Gabriel Elkaim and Soja-Marie Morgens
 *
 * Template file to set up a Heirarchical State Machine to work with the Events and
 * Services Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the names
 * will have to be changed to match your code.
 *
 * There is another template file for the SubHSM's that is slightly differet, and
 * should be used for all of the subordinate state machines (flat or heirarchical)
 *
 * This is provided as an example and a good place to start.
 *
 * History
 * When           Who     What/Why
 * -------------- ---     --------
 * 09/13/13 15:17 ghe      added tattletail functionality and recursive calls
 * 01/15/12 11:12 jec      revisions for Gen2 framework
 * 11/07/11 11:26 jec      made the queue static
 * 10/30/11 17:59 jec      fixed references to CurrentEvent in RunTemplateSM()
 * 10/23/11 18:20 jec      began conversion from SMTemplate.c (02/20/07 rev)
 */


/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/
#include <stdio.h>
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "TopLevelHSM.h"
#include "pwm.h"
#include "IO_Ports.h"

#include "LineFollowSubHSM.h" //#include all sub state machines called
#include "FaceFindingSubHSM.h"
#include "GoToBeaconSubHSM.h"
#include "AimingSubHSM.h"
#include "FaceFinding2ndSubHSM.h"
/*******************************************************************************
 * PRIVATE #DEFINES                                                            *
 ******************************************************************************/
//Include any defines you need to do

#define HOW_OFTEN_TO_SCAN 3000
#define HOW_LONG_TO_SCAN 1600
#define HOW_LONG_TO_REPEL_TAPE 2000
#define NINETY_DEGREE_TURN 400

#define ReverseTurnTime 300
#define VatCornerTurnTime 500
#define ALIGNMENT_JERK_TIME 100

#define SHOOT_TIME 100
#define RELOAD_TIME 1000

#define Drive_Pass_Corner_Time 500 //1000
#define RUN_AWAY_TIME 1500
/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/

int DetectNum;

typedef enum {
    InitPState,
    DriveStraightState,
    ScanState,
    LineRepelState,
    TravelToVatTowerState,
    FindFaceState,
            DrivePassCornerState,
            FindFace2ndState,
    AlignState,
    FindHoleState,
    ShootBallState,
    ReloadState,
    RunAwayState,
    EndState,
} TopLevelHSMState_t;

static const char *StateNames[] = {
	"InitPState",
	"DriveStraightState",
	"ScanState",
	"LineRepelState",
	"TravelToVatTowerState",
	"FindFaceState",
	"DrivePassCornerState",
	"FindFace2ndState",
	"AlignState",
	"FindHoleState",
	"ShootBallState",
	"ReloadState",
	"RunAwayState",
	"EndState",
};

static int ShootCounter;
static int ShootFlag = 0;
/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/

/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine
   Example: char RunAway(uint_8 seconds);*/

void DriveBot(unsigned int DutyCycle) {
    /*
    ENA (RED) - PORT Z, PIN 6
    IN1 (Orange) - PORT Z, PIN 3
    IN2 (Yellow) - PORT Z, PIN 5
    IN3 (Green) - PORT Y, PIN 9
    IN4 (Blue) - PORT Y, PIN 8
    ENB (Black) - PORT Y, PIN 10
     */
    PWM_SetFrequency(PWM_DEFAULT_FREQUENCY);
    int MotorOffsetDuty = DutyCycle * 0.9375;
    //printf("/r/n %d", MotorOffsetDuty);
    PWM_AddPins(PWM_PORTZ06);
    PWM_SetDutyCycle(PWM_PORTZ06, MotorOffsetDuty);

    PWM_AddPins(PWM_PORTY10);
    PWM_SetDutyCycle(PWM_PORTY10, DutyCycle);

    IO_PortsSetPortOutputs(PORTZ, (PIN3 | PIN5)); //Set Pin 3 & 5 in the Port to Output
    IO_PortsClearPortBits(PORTZ, (PIN3 | PIN5)); //Reset Pin 3 & 5
    IO_PortsSetPortBits(PORTZ, PIN5); //Turns On Pin 3

    IO_PortsSetPortOutputs(PORTY, (PIN8 | PIN9)); //Set Pin 8 & 9 in the Port to Output
    IO_PortsClearPortBits(PORTY, (PIN8 | PIN9)); //Reset Pin 8 & 9
    IO_PortsSetPortBits(PORTY, PIN8); //Turns On Pin 8

    //printf("\r\n ---Driving Forward");
}

void ReverseBot(unsigned int LeftDC, unsigned int RightDC) {

    PWM_SetFrequency(PWM_DEFAULT_FREQUENCY);

    PWM_AddPins(PWM_PORTZ06);
    PWM_SetDutyCycle(PWM_PORTZ06, LeftDC);

    PWM_AddPins(PWM_PORTY10);
    PWM_SetDutyCycle(PWM_PORTY10, RightDC);

    IO_PortsSetPortOutputs(PORTZ, (PIN3 | PIN5)); //Set Pin 3 & 5 in the Port to Output
    IO_PortsClearPortBits(PORTZ, (PIN3 | PIN5)); //Reset Pin 3 & 5
    IO_PortsSetPortBits(PORTZ, PIN3); //Turns On Pin 3

    IO_PortsSetPortOutputs(PORTY, (PIN8 | PIN9)); //Set Pin 8 & 9 in the Port to Output
    IO_PortsClearPortBits(PORTY, (PIN8 | PIN9)); //Reset Pin 8 & 9
    IO_PortsSetPortBits(PORTY, PIN9); //Turns On Pin 9

    //printf("\r\n ---Driving In Reverse");
}

void TurnBot(unsigned int LeftDC, unsigned int RightDC) {

    PWM_SetFrequency(PWM_DEFAULT_FREQUENCY);

    PWM_AddPins(PWM_PORTZ06);
    PWM_SetDutyCycle(PWM_PORTZ06, LeftDC);

    PWM_AddPins(PWM_PORTY10);
    PWM_SetDutyCycle(PWM_PORTY10, RightDC);

    IO_PortsSetPortOutputs(PORTZ, (PIN3 | PIN5)); //Set Pin 3 & 5 in the Port to Output
    IO_PortsClearPortBits(PORTZ, (PIN3 | PIN5)); //Reset Pin 3 & 5
    IO_PortsSetPortBits(PORTZ, PIN5); //Turns On Pin 3

    IO_PortsSetPortOutputs(PORTY, (PIN8 | PIN9)); //Set Pin 8 & 9 in the Port to Output
    IO_PortsClearPortBits(PORTY, (PIN8 | PIN9)); //Reset Pin 8 & 9
    IO_PortsSetPortBits(PORTY, PIN8); //Turns On Pin 8

    //printf("\r\n ---Turning)");
}

void TankTurnBot(unsigned int LeftDC, unsigned int RightDC) { //Right Turn

    PWM_SetFrequency(PWM_DEFAULT_FREQUENCY);

    PWM_AddPins(PWM_PORTZ06);
    PWM_SetDutyCycle(PWM_PORTZ06, LeftDC);

    PWM_AddPins(PWM_PORTY10);
    PWM_SetDutyCycle(PWM_PORTY10, RightDC);

    IO_PortsSetPortOutputs(PORTZ, (PIN3 | PIN5)); //Set Pin 3 & 5 in the Port to Output
    IO_PortsClearPortBits(PORTZ, (PIN3 | PIN5)); //Reset Pin 3 & 5
    IO_PortsSetPortBits(PORTZ, PIN3); //Turns On Pin 3

    IO_PortsSetPortOutputs(PORTY, (PIN8 | PIN9)); //Set Pin 8 & 9 in the Port to Output
    IO_PortsClearPortBits(PORTY, (PIN8 | PIN9)); //Reset Pin 8 & 9
    IO_PortsSetPortBits(PORTY, PIN8); //Turns On Pin 8
}

void ReverseTankTurnBot(unsigned int LeftDC, unsigned int RightDC) { //Left Turn

    PWM_SetFrequency(PWM_DEFAULT_FREQUENCY);

    PWM_AddPins(PWM_PORTZ06);
    PWM_SetDutyCycle(PWM_PORTZ06, LeftDC);

    PWM_AddPins(PWM_PORTY10);
    PWM_SetDutyCycle(PWM_PORTY10, RightDC);

    IO_PortsSetPortOutputs(PORTZ, (PIN3 | PIN5)); //Set Pin 3 & 5 in the Port to Output
    IO_PortsClearPortBits(PORTZ, (PIN3 | PIN5)); //Reset Pin 3 & 5
    IO_PortsSetPortBits(PORTZ, PIN5); //Turns On Pin 3

    IO_PortsSetPortOutputs(PORTY, (PIN8 | PIN9)); //Set Pin 8 & 9 in the Port to Output
    IO_PortsClearPortBits(PORTY, (PIN8 | PIN9)); //Reset Pin 8 & 9
    IO_PortsSetPortBits(PORTY, PIN9); //Turns On Pin 8
}

void StopBot(void) {

    PWM_SetFrequency(PWM_DEFAULT_FREQUENCY);

    PWM_AddPins(PWM_PORTZ06);
    PWM_SetDutyCycle(PWM_PORTZ06, 0);

    PWM_AddPins(PWM_PORTY10);
    PWM_SetDutyCycle(PWM_PORTY10, 0);

    IO_PortsSetPortOutputs(PORTZ, (PIN3 | PIN5)); //Set Pin 3 & 5 in the Port to Output
    IO_PortsClearPortBits(PORTZ, (PIN3 | PIN5)); //Reset Pin 3 & 5
    IO_PortsSetPortBits(PORTZ, PIN3); //Turns On Pin 3

    IO_PortsSetPortOutputs(PORTY, (PIN8 | PIN9)); //Set Pin 8 & 9 in the Port to Output
    IO_PortsClearPortBits(PORTY, (PIN8 | PIN9)); //Reset Pin 8 & 9
    IO_PortsSetPortBits(PORTY, PIN8); //Turns On Pin 8

    //printf("\r\n ---Stop Driving");
}
/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static TopLevelHSMState_t CurrentState = InitPState; // <- change enum name to match ENUM
static uint8_t MyPriority;


/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitTemplateHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitTopLevelHSM(uint8_t Priority) {
    IO_PortsSetPortOutputs(PORTY, PIN7);
    IO_PortsClearPortBits(PORTY, PIN7);

    MyPriority = Priority;
    // put us into the Initial PseudoState
    CurrentState = InitPState;
    // post the initial transition event
    if (ES_PostToService(MyPriority, INIT_EVENT) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @Function PostTemplateHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostTopLevelHSM(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunTemplateHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the heirarchical state
 *        machine, as this is called any time a new event is passed to the event
 *        queue. This function will be called recursively to implement the correct
 *        order for a state transition to be: exit current state -> enter next state
 *        using the ES_EXIT and ES_ENTRY events.
 * @note Remember to rename to something appropriate.
 *       The lower level state machines are run first, to see if the event is dealt
 *       with there rather than at the current level. ES_EXIT and ES_ENTRY events are
 *       not consumed as these need to pass pack to the higher level state machine.
 * @author J. Edward Carryer, 2011.10.23 19:25
 * @author Gabriel H Elkaim, 2011.10.23 19:25 */
ES_Event RunTopLevelHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    TopLevelHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPState: // If current state is initial Pseudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state
                // Initialize all sub-state machines
                InitLineFollowSubHSM();
                InitFaceFindingSubHSM();
                InitFaceFinding2ndSubHSM();
                InitGoToBeaconSubHSM();
                InitAimingSubHSM();
                DetectNum = 0;
                ShootCounter = 0;

                //Test At Searching around tower
                /*
                nextState = FindFaceState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                 */
                /*
                //Start At Find Hole
                nextState = FindHoleState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                 */

                /*
                //Start At Tank Turn
                nextState = TravelToVatTowerState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                ES_Timer_InitTimer(TANK_TURN_TIMER, NINETY_DEGREE_TURN);
                */

                //For Real Run
                // now put the machine into the actual initial state
                nextState = DriveStraightState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                ES_Timer_InitTimer(SCAN_TIMER, HOW_OFTEN_TO_SCAN);
                
            }
            break;
        case DriveStraightState: // in the first state, replace this with correct names
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            DriveBot(500);
            switch (ThisEvent.EventType) {
                case BEACON_DETECTED:
                    if (DetectNum >= 2) {
                        StopBot();
                        nextState = TravelToVatTowerState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_InitTimer(TANK_TURN_TIMER, NINETY_DEGREE_TURN);
                        break;
                    } else {
                        DetectNum = DetectNum + 1;
                        break;
                    }
                case FrontOnTS:
                case LeftOnTS:
                case RightOnTS:
                case BackOnTS:
                    StopBot();
                    nextState = LineRepelState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    ES_Timer_InitTimer(LINE_REPEL_TIMER, HOW_LONG_TO_REPEL_TAPE);
                    break;


                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == SCAN_TIMER) { //checks for backup timer event
                        StopBot();
                        nextState = ScanState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_InitTimer(SCANNING_TIMER, HOW_LONG_TO_SCAN);
                        break;
                    }
                case ES_TIMERACTIVE:
                case ES_TIMERSTOPPED:
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case ScanState: // in the first state, replace this with correct names
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            TankTurnBot(600, 600);
            ThisEvent = RunLineFollowSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case BEACON_DETECTED:
                    if (DetectNum >= 2) {
                        StopBot();
                        nextState = TravelToVatTowerState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_InitTimer(TANK_TURN_TIMER, NINETY_DEGREE_TURN);
                        break;
                    } else {
                        DetectNum = DetectNum + 1;
                        break;
                    }

                case FrontOnTS:
                case LeftOnTS:
                case RightOnTS:
                case BackOnTS:
                    StopBot();
                    nextState = LineRepelState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    ES_Timer_InitTimer(LINE_REPEL_TIMER, HOW_LONG_TO_REPEL_TAPE);
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == SCANNING_TIMER) { //checks for backup timer event
                        StopBot();
                        nextState = DriveStraightState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_InitTimer(SCAN_TIMER, HOW_OFTEN_TO_SCAN);
                        break;
                    }
                case ES_TIMERACTIVE:
                case ES_TIMERSTOPPED:
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case LineRepelState: // in the first state, replace this with correct names
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            ThisEvent = RunLineFollowSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case BEACON_DETECTED:
                    if (DetectNum >= 2) {
                        StopBot();
                        nextState = TravelToVatTowerState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_InitTimer(TANK_TURN_TIMER, NINETY_DEGREE_TURN);
                        break;
                    } else {
                        DetectNum = DetectNum + 1;
                        break;
                    }
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == LINE_REPEL_TIMER) { //checks for backup timer event
                        StopBot();
                        nextState = DriveStraightState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_InitTimer(SCAN_TIMER, HOW_OFTEN_TO_SCAN);
                        break;
                    }
                case ES_TIMERACTIVE:
                case ES_TIMERSTOPPED:
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case TravelToVatTowerState:
            ThisEvent = RunGoToBeaconSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == REVERSE_TURN_TIMER) { //checks for backup timer event

                        nextState = FindFaceState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    }
                case ES_TIMERACTIVE:
                case ES_TIMERSTOPPED:
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case FindFaceState:
            ThisEvent = RunFaceFindingSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case TRACKWIRE_DETECTED:
                    nextState = DrivePassCornerState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    ES_Timer_InitTimer(AIMING_TIMER, Drive_Pass_Corner_Time);
                    ES_Timer_StopTimer(VAT_CORNER_TURN_TIMER);
                    InitFaceFinding2ndSubHSM();
                    break;

                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
            
        case DrivePassCornerState:
            ThisEvent = RunFaceFinding2ndSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == AIMING_TIMER) {
                        nextState = FindFace2ndState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        InitFaceFindingSubHSM();
                        break;
                    }
                    break;
                case ES_TIMERACTIVE:
                case ES_TIMERSTOPPED:
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case FindFace2ndState:
            ThisEvent = RunFaceFindingSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case TRACKWIRE_DETECTED:
                    nextState = AlignState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    ES_Timer_InitTimer(AIMING_TIMER, ALIGNMENT_JERK_TIME);
                    ES_Timer_StopTimer(VAT_CORNER_TURN_TIMER);
                    break;

                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case AlignState:
            DriveBot(500);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == AIMING_TIMER) { //checks for backup timer event
                        nextState = FindHoleState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_InitTimer(AIMING_TIMER, 100);
                        StopBot();
                        break;
                    }
                case ES_TIMERACTIVE:
                case ES_TIMERSTOPPED:
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;

        case FindHoleState:
            ThisEvent = RunAimingSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case HOLE_DETECTED:
                    nextState = ShootBallState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    ES_Timer_InitTimer(SHOOT_TIMER, SHOOT_TIME);
                    ShootFlag += 1;
                    break;

                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case ShootBallState:
            StopBot();
            IO_PortsSetPortBits(PORTY, PIN7);
            //printf("\r\n______________________________________Shoot Flag: %d_________________________________\r\n", ShootFlag);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == SHOOT_TIMER) {
                        nextState = ReloadState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ShootCounter = ShootCounter + 1;
                        ES_Timer_InitTimer(SHOOT_TIMER, RELOAD_TIME);
                        break;
                    }
                    break;
                case ES_TIMERACTIVE:
                case ES_TIMERSTOPPED:
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case ReloadState:
            StopBot();
            IO_PortsClearPortBits(PORTY, PIN7);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == SHOOT_TIMER) {
                        if (ShootCounter >= 2) {
                            nextState = RunAwayState;
                            makeTransition = TRUE;
                            ThisEvent.EventType = ES_NO_EVENT;
                            ShootCounter = 0;
                            ES_Timer_InitTimer(RUN_AWAY_TIMER, RUN_AWAY_TIME);
                            break;
                            /*
                            if (ShootFlag > 1) {
                                nextState = EndState;
                                makeTransition = TRUE;
                                ThisEvent.EventType = ES_NO_EVENT;
                                ShootCounter = 0;
                                ShootFlag = 0;
                                break;
                            } else {
                                nextState = TravelToVatTowerState; // why does it reverse after this?
                                makeTransition = TRUE;
                                ThisEvent.EventType = ES_NO_EVENT;
                                ShootCounter = 0;
                                break;
                            }
                            */
                        } else {
                            nextState = ShootBallState;
                            makeTransition = TRUE;
                            ThisEvent.EventType = ES_NO_EVENT;
                            ES_Timer_InitTimer(SHOOT_TIMER, SHOOT_TIME);
                            break;
                        }
                    }
                    break;
                case ES_TIMERACTIVE:
                case ES_TIMERSTOPPED:
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
            
        case RunAwayState:
            TurnBot(525,500);
            //TurnBot(550,500);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == RUN_AWAY_TIMER) {
                        InitLineFollowSubHSM();
                        InitFaceFindingSubHSM();
                        InitFaceFinding2ndSubHSM();
                        InitGoToBeaconSubHSM();
                        InitAimingSubHSM();
                        DetectNum = 0;
                        ShootCounter = 0;
                        nextState = DriveStraightState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_InitTimer(SCAN_TIMER, HOW_OFTEN_TO_SCAN);
                        break;
                    }
                    break;
                case ES_TIMERACTIVE:
                case ES_TIMERSTOPPED:
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
            
        case EndState:
            StopBot();
            break;

        default: // all unhandled states fall into here
            break;
    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunTopLevelHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunTopLevelHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}


/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
