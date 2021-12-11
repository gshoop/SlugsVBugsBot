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
#include "TapeSensorService.h"
#include <stdio.h>

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define TIMER_TICKS 1


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
uint8_t InitTapeSensorService(uint8_t Priority)
{
    ES_Event FrontTSEvent;
    ES_Event MidTSEvent;
    ES_Event BackTSEvent;
    ES_Event LeftTSEvent;
    ES_Event RightTSEvent;
    ES_Event CornerTSEvent;

    MyPriority = Priority;

    // in here you write your initialization code
    // this includes all hardware and software initialization
    // that needs to occur.
    IO_PortsSetPortInputs(PORTV, (PIN3 | PIN4 | PIN6 | PIN5 | PIN7)); // L | R | F | M | B
    
    // post the initial transition event
    
    FrontTSEvent.EventType = ES_INIT;
    MidTSEvent.EventType = ES_INIT;
    BackTSEvent.EventType = ES_INIT;
    LeftTSEvent.EventType = ES_INIT;
    RightTSEvent.EventType = ES_INIT;
    CornerTSEvent.EventType - ES_INIT;
    
    ES_Timer_InitTimer(TAPESENSOR_SERVICE_TIMER, TIMER_TICKS);
    
    if ((ES_PostToService(MyPriority, FrontTSEvent) == TRUE) || 
        (ES_PostToService(MyPriority, MidTSEvent) == TRUE) || 
        (ES_PostToService(MyPriority, BackTSEvent) == TRUE) || 
        (ES_PostToService(MyPriority, LeftTSEvent) == TRUE) ||
        (ES_PostToService(MyPriority, RightTSEvent) == TRUE)||
        (ES_PostToService(MyPriority, CornerTSEvent) == TRUE)){
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
uint8_t PostTapeSensorService(ES_Event ThisEvent)
{
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
ES_Event RunTapeSensorService(ES_Event ThisEvent)
{
    ES_Event ReturnEvent;
    ReturnEvent.EventType = ES_NO_EVENT; // assume no errors

    /********************************************
     in here you write your service code
     *******************************************/
    static ES_EventTyp_t FrontlastEvent = FrontOffTS;
    ES_EventTyp_t FrontcurEvent;
    
    static ES_EventTyp_t MidlastEvent = MidOffTS;
    ES_EventTyp_t MidcurEvent;
    
    static ES_EventTyp_t BacklastEvent = BackOffTS;
    ES_EventTyp_t BackcurEvent;
    
    static ES_EventTyp_t LeftlastEvent = LeftOffTS;
    ES_EventTyp_t LeftcurEvent;
    
    static ES_EventTyp_t RightlastEvent = RightOffTS;
    ES_EventTyp_t RightcurEvent;
    
    static ES_EventTyp_t CornerlastEvent = CornerOffTS;
    ES_EventTyp_t CornercurEvent;
    
    uint16_t TapeSensors = IO_PortsReadPort(PORTV); // read the TapeSensor

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
            //CornerEvent
            if (((TapeSensors & PIN6) == PIN6) && 
                ((TapeSensors & PIN5) == PIN5) && 
                ((TapeSensors & PIN7) == PIN7) && 
                ( ((TapeSensors & PIN3) == PIN3) || ((TapeSensors & PIN4) == PIN4))){ //Read Pin and Select Event
                CornercurEvent = CornerOnTS;
            } else {
                CornercurEvent =  CornerOffTS;
            }

            if (CornercurEvent != CornerlastEvent) { // check for change from last time
                ReturnEvent.EventType = CornercurEvent;
                ReturnEvent.EventParam = (TapeSensors & PIN4);
                CornerlastEvent = CornercurEvent; // update history
#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
                PostTopLevelHSM(ReturnEvent); //Post To State Machine
#else
                PostTemplateService(ReturnEvent); //If Test Harness Enabled - Post to Bottom Print State Machine
#endif   
            }
            
            //Front Tape Sensor Code
            if ((TapeSensors & PIN6) == PIN6) { //Read Pin and Select Event
                FrontcurEvent = FrontOnTS;
            } else {
                FrontcurEvent = FrontOffTS;
            }

            if (FrontcurEvent != FrontlastEvent) { // check for change from last time
                ReturnEvent.EventType = FrontcurEvent;
                ReturnEvent.EventParam = (TapeSensors & PIN6);
                FrontlastEvent = FrontcurEvent; // update history
#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
                PostTopLevelHSM(ReturnEvent); //Post To State Machine
#else
                PostTemplateService(ReturnEvent); //If Test Harness Enabled - Post to Bottom Print State Machine
#endif   
            }
            
            //Mid Tape Sensor Code
            if ((TapeSensors & PIN5) == PIN5) { //Read Pin and Select Event
                MidcurEvent = MidOnTS;
            } else {
                MidcurEvent = MidOffTS;
            }

            if (MidcurEvent != MidlastEvent) { // check for change from last time
                ReturnEvent.EventType = MidcurEvent;
                ReturnEvent.EventParam = (TapeSensors & PIN5);
                MidlastEvent = MidcurEvent; // update history
#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
                PostTopLevelHSM(ReturnEvent); //Post To State Machine
#else
                PostTemplateService(ReturnEvent); //If Test Harness Enabled - Post to Bottom Print State Machine
#endif   
            }
            
            //Back Tape Sensor Code
            if ((TapeSensors & PIN7) == PIN7) { //Read Pin and Select Event
                BackcurEvent = BackOnTS;
            } else {
                BackcurEvent = BackOffTS;
            }

            if (BackcurEvent != BacklastEvent) { // check for change from last time
                ReturnEvent.EventType = BackcurEvent;
                ReturnEvent.EventParam = (TapeSensors & PIN7);
                BacklastEvent = BackcurEvent; // update history
#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
                PostTopLevelHSM(ReturnEvent); //Post To State Machine
#else
                PostTemplateService(ReturnEvent); //If Test Harness Enabled - Post to Bottom Print State Machine
#endif   
            }
            
            //Left Tape Sensor Code
            if ((TapeSensors & PIN4) == PIN4) { //Read Pin and Select Event
                LeftcurEvent = LeftOnTS;
            } else {
                LeftcurEvent = LeftOffTS;
            }

            if (LeftcurEvent != LeftlastEvent) { // check for change from last time
                ReturnEvent.EventType = LeftcurEvent;
                ReturnEvent.EventParam = (TapeSensors & PIN4);
                LeftlastEvent = LeftcurEvent; // update history
#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
                PostTopLevelHSM(ReturnEvent); //Post To State Machine
#else
                PostTemplateService(ReturnEvent); //If Test Harness Enabled - Post to Bottom Print State Machine
#endif   
            }
            
            //Right Tape Sensor Code
            if ((TapeSensors & PIN3) == PIN3) { //Read Pin and Select Event
                RightcurEvent = RightOnTS;
            } else {
                RightcurEvent = RightOffTS;
            }

            if (RightcurEvent != RightlastEvent) { // check for change from last time
                ReturnEvent.EventType = RightcurEvent;
                ReturnEvent.EventParam = (TapeSensors & PIN3);
                RightlastEvent = RightcurEvent; // update history
#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
                PostTopLevelHSM(ReturnEvent); //Post To State Machine
#else
                PostTemplateService(ReturnEvent); //If Test Harness Enabled - Post to Bottom Print State Machine
#endif   
            }
            ES_Timer_InitTimer(TAPESENSOR_SERVICE_TIMER, TIMER_TICKS);
            break;

#ifdef SIMPLESERVICE_TEST     // keep this as is for test harness      
        default:
            printf("\r\nEvent: %s\tParam: 0x%X",
                    EventNames[FrontTSEvent.EventType], FrontTSEvent.EventParam);
            printf("\r\nEvent: %s\tParam: 0x%X",
                    EventNames[MidTSEvent.EventType], MidTSEvent.EventParam);
            printf("\r\nEvent: %s\tParam: 0x%X",
                    EventNames[BackTSEvent.EventType], BackTSEvent.EventParam);
            printf("\r\nEvent: %s\tParam: 0x%X",
                    EventNames[LeftTSEvent.EventType], LeftTSEvent.EventParam);
            printf("\r\nEvent: %s\tParam: 0x%X",
                    EventNames[RighTSEvent.EventType], RighTSEvent.EventParam);
            break;
#endif
    }

    return ReturnEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONs                                                           *
 ******************************************************************************/