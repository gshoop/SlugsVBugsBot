/*
 * File:   TemplateEventChecker.c
 * Author: Gabriel Hugh Elkaim
 *
 * Template file to set up typical EventCheckers for the  Events and Services
 * Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the
 * names will have to be changed to match your code.
 *
 * This EventCheckers file will work with both FSM's and HSM's.
 *
 * Remember that EventCheckers should only return TRUE when an event has occured,
 * and that the event is a TRANSITION between two detectable differences. They
 * should also be atomic and run as fast as possible for good results.
 *
 * This file includes a test harness that will run the event detectors listed in the
 * ES_Configure file in the project, and will conditionally compile main if the macro
 * EVENTCHECKER_TEST is defined (either in the project or in the file). This will allow
 * you to check you event detectors in their own project, and then leave them untouched
 * for your project unless you need to alter their post functions.
 *
 * Created on September 27, 2013, 8:37 AM
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "EventCheckers.h"
#include "ES_Events.h"
#include "serial.h"
#include "AD.h"
#include "TopLevelHSM.h"
#include "IO_Ports.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define BATTERY_DISCONNECT_THRESHOLD 175

/*******************************************************************************
 * EVENTCHECKER_TEST SPECIFIC CODE                                                             *
 ******************************************************************************/

//#define EVENTCHECKER_TEST
#ifdef EVENTCHECKER_TEST
#include <stdio.h>
#define SaveEvent(x) do {eventName=__func__; storedEvent=x;} while (0)

static const char *eventName;
static ES_Event storedEvent;
#endif

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this EventChecker. They should be functions
   relevant to the behavior of this particular event checker */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/

/* Any private module level variable that you might need for keeping track of
   events would be placed here. Private variables should be STATIC so that they
   are limited in scope to this module. */

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function TemplateCheckBattery(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function is a prototype event checker that checks the battery voltage
 *        against a fixed threshold (#defined in the .c file). Note that you need to
 *        keep track of previous history, and that the actual battery voltage is checked
 *        only once at the beginning of the function. The function will post an event
 *        of either BATTERY_CONNECTED or BATTERY_DISCONNECTED if the power switch is turned
 *        on or off with the USB cord plugged into the Uno32. Returns TRUE if there was an 
 *        event, FALSE otherwise.
 * @note Use this code as a template for your other event checkers, and modify as necessary.
 * @author Gabriel H Elkaim, 2013.09.27 09:18
 * @modified Gabriel H Elkaim/Max Dunne, 2016.09.12 20:08 */
uint8_t CheckBattery(void) {
    static ES_EventTyp_t lastEvent = BATTERY_DISCONNECTED;
    ES_EventTyp_t curEvent;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;
    uint16_t batVoltage = AD_ReadADPin(BAT_VOLTAGE); // read the battery voltage

    if (batVoltage > BATTERY_DISCONNECT_THRESHOLD) { // is battery connected?
        curEvent = BATTERY_CONNECTED;
    } else {
        curEvent = BATTERY_DISCONNECTED;
    }
    if (curEvent != lastEvent) { // check for change from last time
        thisEvent.EventType = curEvent;
        thisEvent.EventParam = batVoltage;
        returnVal = TRUE;
        lastEvent = curEvent; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostTopLevelHSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    }
    return (returnVal);
}

uint8_t CheckBeacon(void) {
    IO_PortsSetPortInputs(PORTY, PIN6);
    static ES_EventTyp_t lastEvent = BEACON_UNDETECTED;
    ES_EventTyp_t curEvent;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;
    uint16_t Ports = IO_PortsReadPort(PORTY); // read the battery voltage
      if ((Ports & PIN6) == PIN6) {
            //printf("\r\nOff");
            curEvent = BEACON_DETECTED;
        } 
        else{
           //printf("\r\nOn");
           curEvent = BEACON_UNDETECTED;
        }

    if (curEvent != lastEvent) { // check for change from last time
        thisEvent.EventType = curEvent;
        thisEvent.EventParam = (Ports & PIN6);
        returnVal = TRUE;
        lastEvent = curEvent; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostTopLevelHSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    }
    return (returnVal);
}

uint8_t CheckTrackWire(void) {
    static int CounterOnDebouncerTW = 0;
    static int CounterOffDebouncerTW = 0;
    
    IO_PortsSetPortOutputs(PORTW, PIN4); //Selector Port
    //IO_PortsClearPortBits(PORTW, PIN4); //Clears the Output - Low = Yellow Wire
    //IO_PortsSetPortBits(PORTW, PIN4); // High - White Wire        
    
    AD_AddPins(AD_PORTW3); //Input - From Sensors
    //AD_ReadADPin(AD_PORTW3) - Reads Pin
    
    static ES_EventTyp_t lastEvent = TRACKWIRE_UNDETECTED;
    ES_EventTyp_t curEvent;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;
    
    
    IO_PortsClearPortBits(PORTW, PIN4); //Low = Yellow Wire
    uint16_t YellowSensorValue = AD_ReadADPin(AD_PORTW3); // Reads Pin
    IO_PortsSetPortBits(PORTW, PIN4); // High - White Wire   
    uint16_t WhiteSensorValue = AD_ReadADPin(AD_PORTW3); // Reads Pin
      
    
      if ((YellowSensorValue >= 700)&&(WhiteSensorValue >= 700)) {
            //printf("\r\nOff");
            curEvent = TRACKWIRE_DETECTED;
            CounterOnDebouncerTW = CounterOnDebouncerTW + 1;
            CounterOffDebouncerTW = 0;
        } 
        else{
           //printf("\r\nOn");
           curEvent = TRACKWIRE_UNDETECTED;
           CounterOffDebouncerTW = CounterOffDebouncerTW + 1;
           CounterOnDebouncerTW = 0;
    }
    if ((CounterOnDebouncerTW >= 10) || (CounterOffDebouncerTW >= 10)) {
        if (curEvent != lastEvent) { // check for change from last time
            thisEvent.EventType = curEvent;
            thisEvent.EventParam = (YellowSensorValue * WhiteSensorValue * 0.5);
            returnVal = TRUE;
            lastEvent = curEvent; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
            PostTopLevelHSM(thisEvent);
#else
            SaveEvent(thisEvent);
#endif   
        }
    }
    return (returnVal);
}


uint8_t CheckAimTapeSensor(void) {
    static int CounterOnDebouncer = 0;
    static int CounterOffDebouncer = 0;
    
    IO_PortsSetPortInputs(PORTY, PIN12); //Purple Wire
    IO_PortsSetPortInputs(PORTY, PIN11); //Blue Wire  
    
    static ES_EventTyp_t lastEvent = HOLE_UNDETECTED;
    ES_EventTyp_t curEvent;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;
    
    
    int16_t FrontHoleSensorValue = (IO_PortsReadPort(PORTY) & PIN12);//Read Pin and Mask it
    int16_t BackHoleSensorValue = (IO_PortsReadPort(PORTY) & PIN11);//Read Pin and Mask it
    
      if ((FrontHoleSensorValue == PIN12) && (BackHoleSensorValue == PIN11)){
            //printf("\r\nOff");
            curEvent = HOLE_DETECTED;
            CounterOnDebouncer = CounterOnDebouncer + 1;
            CounterOffDebouncer = 0;
    }
    else {
        //printf("\r\nOn");
        curEvent = HOLE_UNDETECTED;
        CounterOffDebouncer = CounterOffDebouncer + 1;
        CounterOnDebouncer = 0;
    }
    if ((CounterOnDebouncer >= 10) || (CounterOffDebouncer >= 10)) {
        if (curEvent != lastEvent) { // check for change from last time
            thisEvent.EventType = curEvent;
            thisEvent.EventParam = (IO_PortsReadPort(PORTY) & PIN12);
            returnVal = TRUE;
            lastEvent = curEvent; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
            PostTopLevelHSM(thisEvent);
#else
            SaveEvent(thisEvent);
#endif   
        }
    }
    return (returnVal);

}

/* 
 * The Test Harness for the event checkers is conditionally compiled using
 * the EVENTCHECKER_TEST macro (defined either in the file or at the project level).
 * No other main() can exist within the project.
 * 
 * It requires a valid ES_Configure.h file in the project with the correct events in 
 * the enum, and the correct list of event checkers in the EVENT_CHECK_LIST.
 * 
 * The test harness will run each of your event detectors identically to the way the
 * ES_Framework will call them, and if an event is detected it will print out the function
 * name, event, and event parameter. Use this to test your event checking code and
 * ensure that it is fully functional.
 * 
 * If you are locking up the output, most likely you are generating too many events.
 * Remember that events are detectable changes, not a state in itself.
 * 
 * Once you have fully tested your event checking code, you can leave it in its own
 * project and point to it from your other projects. If the EVENTCHECKER_TEST marco is
 * defined in the project, no changes are necessary for your event checkers to work
 * with your other projects.
 */
#ifdef EVENTCHECKER_TEST
#include <stdio.h>
static uint8_t(*EventList[])(void) = {EVENT_CHECK_LIST};

void PrintEvent(void);

void main(void) {
    BOARD_Init();
    /* user initialization code goes here */

    // Do not alter anything below this line
    int i;

    printf("\r\nEvent checking test harness for %s", __FILE__);

    while (1) {
        if (IsTransmitEmpty()) {
            for (i = 0; i< sizeof (EventList) >> 2; i++) {
                if (EventList[i]() == TRUE) {
                    PrintEvent();
                    break;
                }

            }
        }
    }
}

void PrintEvent(void) {
    printf("\r\nFunc: %s\tEvent: %s\tParam: 0x%X", eventName,
            EventNames[storedEvent.EventType], storedEvent.EventParam);
}
#endif