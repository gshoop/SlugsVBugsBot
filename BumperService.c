/*
 * File: TemplateService.h
 * Author: J. Edward Carryer
 * Modified: Gabriel H Elkaim
 *
 * Template file to set up a simple service to work with the Events and Services
 * Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that this file
 * will need to be modified to fit your exact needs, and most of the names will have
 * to be changed to match your code.
 *
 * This is provided as an example and a good place to start.
 *
 * Created on 23/Oct/2011
 * Updated on 13/Nov/2013
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "BOARD.h"
#include "AD.h"
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BumperService.h"
#include <stdio.h>

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define TIMER_200HZ_TICKS 5


/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/
/* You will need MyPriority and maybe a state variable; you may need others
 * as well. */

static uint8_t MyPriority;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitTemplateService(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateService function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitBumperService(uint8_t Priority) {
    ES_Event FLBumperEvent;
    ES_Event FRBumperEvent;
    ES_Event BLBumperEvent;
    ES_Event BRBumperEvent;

    MyPriority = Priority;


    // in here you write your initialization code
    // this includes all hardware and software initialization
    // that needs to occur.
    IO_PortsSetPortInputs(PORTW, (PIN8 | PIN6 | PIN7 | PIN5)); //Sets Pins As Inputs
    // post the initial transition event
    FLBumperEvent.EventType = ES_INIT;
    FRBumperEvent.EventType = ES_INIT;
    BLBumperEvent.EventType = ES_INIT;
    BRBumperEvent.EventType = ES_INIT;
    ES_Timer_InitTimer(BUMPER_SERVICE_TIMER, TIMER_200HZ_TICKS);
    if (ES_PostToService(MyPriority, FLBumperEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
    if (ES_PostToService(MyPriority, FRBumperEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
    if (ES_PostToService(MyPriority, BLBumperEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
    if (ES_PostToService(MyPriority, BRBumperEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @Function PostTemplateService(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostBumperService(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunTemplateService(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the service,
 *        as this is called any time a new event is passed to the event queue. 
 * @note Remember to rename to something appropriate.
 *       Returns ES_NO_EVENT if the event have been "consumed." 
 * @author J. Edward Carryer, 2011.10.23 19:25 */
ES_Event RunBumperService(ES_Event ThisEvent) {
    ES_Event ReturnEvent;
    ReturnEvent.EventType = ES_NO_EVENT; // assume no errors

    /********************************************
     in here you write your service code
     *******************************************/
    static ES_EventTyp_t FLlastEvent = FLUNPRESSED;
    ES_EventTyp_t FLcurEvent;

    static ES_EventTyp_t FRlastEvent = FRUNPRESSED;
    ES_EventTyp_t FRcurEvent;

    static ES_EventTyp_t BLlastEvent = BLUNPRESSED;
    ES_EventTyp_t BLcurEvent;

    static ES_EventTyp_t BRlastEvent = BRUNPRESSED;
    ES_EventTyp_t BRcurEvent;
    
    uint16_t LimitSwitches = IO_PortsReadPort(PORTW);

    switch (ThisEvent.EventType) {
        case ES_INIT:
            // No hardware initialization or single time setups, those
            // go in the init function above.
            //
            // This section is used to reset service for some reason
            break;
        case ES_TIMERACTIVE:
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:
             if ((LimitSwitches & PIN8) == PIN8) { // Is Front Left Limit Switch High
                FLcurEvent = FLUNPRESSED;
            } else {
                FLcurEvent = FLPRESSED;
            }

            if ((LimitSwitches & PIN6) == PIN6) { // is Front Right Limit Switch High
                FRcurEvent = FRUNPRESSED;
            } else {
                FRcurEvent = FRPRESSED;
            }

            if ((LimitSwitches & PIN7) == PIN7) { // is battery connected?
                BLcurEvent = BLUNPRESSED;
            } else {
                BLcurEvent = BLPRESSED;
            }

            if ((LimitSwitches & PIN5) == PIN5) { // is battery connected?
                BRcurEvent = BRUNPRESSED;
            } else {
                BRcurEvent = BRPRESSED;
            }

            ES_Timer_InitTimer(BUMPER_SERVICE_TIMER, TIMER_200HZ_TICKS);

            if (FLcurEvent != FLlastEvent) { // check for change from last time
                ReturnEvent.EventType = FLcurEvent;
                ReturnEvent.EventParam = (LimitSwitches & PIN8);
                FLlastEvent = FLcurEvent; // update history

#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
                PostTopLevelHSM(ReturnEvent);
#else
                PostBumperService(ReturnEvent);
#endif      
            }

            if (FRcurEvent != FRlastEvent) { // check for change from last time
                ReturnEvent.EventType = FRcurEvent;
                ReturnEvent.EventParam = (LimitSwitches & PIN6);
                FRlastEvent = FRcurEvent; // update history

#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
            PostTopLevelHSM(ReturnEvent);
#else
            PostBumperService(ReturnEvent);
#endif      
        }



            if (BLcurEvent != BLlastEvent) { // check for change from last time
                ReturnEvent.EventType = BLcurEvent;
                ReturnEvent.EventParam = (LimitSwitches & PIN7);
                BLlastEvent = BLcurEvent; // update history
#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
            PostTopLevelHSM(ReturnEvent);
#else
            PostBumperService(ReturnEvent);
#endif      
        }


            if (BRcurEvent != BRlastEvent) { // check for change from last time
                ReturnEvent.EventType = BRcurEvent;
                ReturnEvent.EventParam = (LimitSwitches & PIN5);
                BRlastEvent = BRcurEvent; // update history


#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
            PostTopLevelHSM(ReturnEvent);
#else
            PostBumperService(ReturnEvent);
#endif      
        }
        
        
        
#ifdef SIMPLESERVICE_TEST     // keep this as is for test harness      
    default:
        printf("\r\nEvent: %s\tParam: 0x%X",
                EventNames[FLBumperEvent.EventType], FLBumperEvent.EventParam);
        printf("\r\nEvent: %s\tParam: 0x%X",
                EventNames[FRBumperEvent.EventType], FRBumperEvent.EventParam);
        printf("\r\nEvent: %s\tParam: 0x%X",
                EventNames[BLBumperEvent.EventType], BLBumperEvent.EventParam);
        printf("\r\nEvent: %s\tParam: 0x%X",
                EventNames[BRBumperEvent.EventType], BRBumperEvent.EventParam);
        
        break;
#endif
    }
    return ReturnEvent;

}

/*******************************************************************************
 * PRIVATE FUNCTIONs                                                           *
 ******************************************************************************/
