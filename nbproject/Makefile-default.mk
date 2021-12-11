#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Project_-_HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Project_-_HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED="C:/Users/lcarvaja/Desktop/Project - HSM.X/AD.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/BOARD.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_CheckEvents.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Framework.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_KeyboardInput.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_PostList.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Queue.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_TattleTale.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Timers.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/IO_Ports.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/LED.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/pwm.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/serial.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/Project_ES_Main.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/EventCheckers.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/LineFollowSubHSM.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/TopLevelHSM.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/TapeSensorService.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/BumperService.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/FaceFindingSubHSM.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/GoToBeaconSubHSM.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/AimingSubHSM.c" "C:/Users/lcarvaja/Desktop/Project - HSM.X/FaceFinding2ndSubHSM.c"

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1464381779/AD.o ${OBJECTDIR}/_ext/1464381779/BOARD.o ${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o ${OBJECTDIR}/_ext/1464381779/ES_Framework.o ${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1464381779/ES_PostList.o ${OBJECTDIR}/_ext/1464381779/ES_Queue.o ${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o ${OBJECTDIR}/_ext/1464381779/ES_Timers.o ${OBJECTDIR}/_ext/1464381779/IO_Ports.o ${OBJECTDIR}/_ext/1464381779/LED.o ${OBJECTDIR}/_ext/1464381779/pwm.o ${OBJECTDIR}/_ext/1464381779/serial.o ${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o ${OBJECTDIR}/_ext/1464381779/EventCheckers.o ${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o ${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o ${OBJECTDIR}/_ext/1464381779/TapeSensorService.o ${OBJECTDIR}/_ext/1464381779/BumperService.o ${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o ${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o ${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o ${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1464381779/AD.o.d ${OBJECTDIR}/_ext/1464381779/BOARD.o.d ${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/1464381779/ES_Framework.o.d ${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/1464381779/ES_PostList.o.d ${OBJECTDIR}/_ext/1464381779/ES_Queue.o.d ${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o.d ${OBJECTDIR}/_ext/1464381779/ES_Timers.o.d ${OBJECTDIR}/_ext/1464381779/IO_Ports.o.d ${OBJECTDIR}/_ext/1464381779/LED.o.d ${OBJECTDIR}/_ext/1464381779/pwm.o.d ${OBJECTDIR}/_ext/1464381779/serial.o.d ${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o.d ${OBJECTDIR}/_ext/1464381779/EventCheckers.o.d ${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o.d ${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o.d ${OBJECTDIR}/_ext/1464381779/TapeSensorService.o.d ${OBJECTDIR}/_ext/1464381779/BumperService.o.d ${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o.d ${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o.d ${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o.d ${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1464381779/AD.o ${OBJECTDIR}/_ext/1464381779/BOARD.o ${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o ${OBJECTDIR}/_ext/1464381779/ES_Framework.o ${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1464381779/ES_PostList.o ${OBJECTDIR}/_ext/1464381779/ES_Queue.o ${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o ${OBJECTDIR}/_ext/1464381779/ES_Timers.o ${OBJECTDIR}/_ext/1464381779/IO_Ports.o ${OBJECTDIR}/_ext/1464381779/LED.o ${OBJECTDIR}/_ext/1464381779/pwm.o ${OBJECTDIR}/_ext/1464381779/serial.o ${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o ${OBJECTDIR}/_ext/1464381779/EventCheckers.o ${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o ${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o ${OBJECTDIR}/_ext/1464381779/TapeSensorService.o ${OBJECTDIR}/_ext/1464381779/BumperService.o ${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o ${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o ${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o ${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o

# Source Files
SOURCEFILES=C:/Users/lcarvaja/Desktop/Project - HSM.X/AD.c C:/Users/lcarvaja/Desktop/Project - HSM.X/BOARD.c C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_CheckEvents.c C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Framework.c C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_KeyboardInput.c C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_PostList.c C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Queue.c C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_TattleTale.c C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Timers.c C:/Users/lcarvaja/Desktop/Project - HSM.X/IO_Ports.c C:/Users/lcarvaja/Desktop/Project - HSM.X/LED.c C:/Users/lcarvaja/Desktop/Project - HSM.X/pwm.c C:/Users/lcarvaja/Desktop/Project - HSM.X/serial.c C:/Users/lcarvaja/Desktop/Project - HSM.X/Project_ES_Main.c C:/Users/lcarvaja/Desktop/Project - HSM.X/EventCheckers.c C:/Users/lcarvaja/Desktop/Project - HSM.X/LineFollowSubHSM.c C:/Users/lcarvaja/Desktop/Project - HSM.X/TopLevelHSM.c C:/Users/lcarvaja/Desktop/Project - HSM.X/TapeSensorService.c C:/Users/lcarvaja/Desktop/Project - HSM.X/BumperService.c C:/Users/lcarvaja/Desktop/Project - HSM.X/FaceFindingSubHSM.c C:/Users/lcarvaja/Desktop/Project - HSM.X/GoToBeaconSubHSM.c C:/Users/lcarvaja/Desktop/Project - HSM.X/AimingSubHSM.c C:/Users/lcarvaja/Desktop/Project - HSM.X/FaceFinding2ndSubHSM.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=PIC32MX320F128H
ProjectDir="C:\Users\lcarvaja\Desktop\Project - HSM.X"
ProjectName=Project_-_HSM
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\Project_-_HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="Project_-_HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Project_-_HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="C:\ECE118\bootloader320.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1464381779/AD.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/AD.c  .generated_files/flags/default/c137a15eee743d9fc76673d2b1748806fafe0f3b .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/AD.o.d" -o ${OBJECTDIR}/_ext/1464381779/AD.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/AD.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/BOARD.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/BOARD.c  .generated_files/flags/default/fdf6a3ed8cff1b921f2a0397eea2db06c934a41b .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/BOARD.o.d" -o ${OBJECTDIR}/_ext/1464381779/BOARD.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/BOARD.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_CheckEvents.c  .generated_files/flags/default/b2a346bc9c4400ec93b4ef70e049ad5975158981 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_CheckEvents.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_Framework.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_Framework.c  .generated_files/flags/default/199454ecf42a6e6692f132760a8542c8b9901cb7 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_Framework.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Framework.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_KeyboardInput.c  .generated_files/flags/default/630210c7f31e5ee459aafda2b94581cb3d7f72d8 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_KeyboardInput.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_PostList.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_PostList.c  .generated_files/flags/default/5020c382dde82716e1d4acce1a563a80e65be94d .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_PostList.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_PostList.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_Queue.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_Queue.c  .generated_files/flags/default/95d4ef22d2bfed1acbfc0ae06ee52e0a1e67b88 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_Queue.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Queue.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_TattleTale.c  .generated_files/flags/default/b03f66250de2e4e007412483ff58c1e7fbcf6f1e .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_TattleTale.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_Timers.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_Timers.c  .generated_files/flags/default/14ef6ca0cf2f42232df64a0b83c81814a233ca63 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_Timers.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Timers.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/IO_Ports.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/IO_Ports.c  .generated_files/flags/default/9107700c882c9bc8243a7f41b49fc2f9a435df1a .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1464381779/IO_Ports.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/LED.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/LED.c  .generated_files/flags/default/dcc7afd7a4fc811358312be6fe72798a4aac25d .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/LED.o.d" -o ${OBJECTDIR}/_ext/1464381779/LED.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/LED.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/pwm.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/pwm.c  .generated_files/flags/default/425adb505eba846acd28b1510f8a45d561c0b15a .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/pwm.o.d" -o ${OBJECTDIR}/_ext/1464381779/pwm.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/pwm.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/serial.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/serial.c  .generated_files/flags/default/fac1941de0969c10776a964fcfe85e2fb16a0d25 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/serial.o.d" -o ${OBJECTDIR}/_ext/1464381779/serial.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/serial.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/Project_ES_Main.c  .generated_files/flags/default/53d9c4c0aea6858974a68bc41dae50e70dae35d4 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o.d" -o ${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/Project_ES_Main.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/EventCheckers.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/EventCheckers.c  .generated_files/flags/default/f41d1f642fad24d8ec9b807c7dce6b222f20abc3 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/EventCheckers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/EventCheckers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/EventCheckers.o.d" -o ${OBJECTDIR}/_ext/1464381779/EventCheckers.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/EventCheckers.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/LineFollowSubHSM.c  .generated_files/flags/default/ba0bd42e2e0ac47a4903b64ee6f79c9db6ca9961 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/LineFollowSubHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/TopLevelHSM.c  .generated_files/flags/default/7e2659d6c8418efced84c09b37a35fd148a34779 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/TopLevelHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/TapeSensorService.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/TapeSensorService.c  .generated_files/flags/default/a975aff686c4219adcf2009440cdec6c38f21e9 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/TapeSensorService.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/TapeSensorService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/TapeSensorService.o.d" -o ${OBJECTDIR}/_ext/1464381779/TapeSensorService.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/TapeSensorService.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/BumperService.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/BumperService.c  .generated_files/flags/default/dfc14e8061ff1426b8f82dfbc0d87bbd46a64374 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/BumperService.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/BumperService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/BumperService.o.d" -o ${OBJECTDIR}/_ext/1464381779/BumperService.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/BumperService.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/FaceFindingSubHSM.c  .generated_files/flags/default/236a6e7b358717682019d51fd64bf90d772b84d6 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/FaceFindingSubHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/GoToBeaconSubHSM.c  .generated_files/flags/default/730a89fd25032fece2c88f53a59318749e1d3bff .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/GoToBeaconSubHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/AimingSubHSM.c  .generated_files/flags/default/a85280770f1dadc0a481d3e7f11a4fb941c0eb46 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/AimingSubHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/FaceFinding2ndSubHSM.c  .generated_files/flags/default/4f42b5d81963b5cefae2c24f0de9bafd598907cc .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/FaceFinding2ndSubHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1464381779/AD.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/AD.c  .generated_files/flags/default/da4b22f2c305af5a300e2e172ab676cd386c1dd1 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/AD.o.d" -o ${OBJECTDIR}/_ext/1464381779/AD.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/AD.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/BOARD.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/BOARD.c  .generated_files/flags/default/716573bb9aa243e2b32d9b27dbb398ed2f798b12 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/BOARD.o.d" -o ${OBJECTDIR}/_ext/1464381779/BOARD.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/BOARD.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_CheckEvents.c  .generated_files/flags/default/638cdc528eab30d9d070864ba3a86e4ccd300ff4 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_CheckEvents.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_CheckEvents.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_Framework.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_Framework.c  .generated_files/flags/default/4ded5dd1207822a1e02c7cf828342a17403b0384 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_Framework.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Framework.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_KeyboardInput.c  .generated_files/flags/default/6900e0b17b7b1fc89534097db14e8988af2aa60a .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_KeyboardInput.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_KeyboardInput.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_PostList.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_PostList.c  .generated_files/flags/default/160970af14193df0843b12d968a7ee2556a396b4 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_PostList.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_PostList.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_Queue.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_Queue.c  .generated_files/flags/default/7606358f40ef06b679a85942602eb5741af91ae8 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_Queue.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Queue.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_TattleTale.c  .generated_files/flags/default/6fbfc1e168a68c3ef6649b1ff65903f613b1071 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_TattleTale.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_TattleTale.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/ES_Timers.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/ES_Timers.c  .generated_files/flags/default/fb1d76c5e314d90113bddfacb087c01e0379f943 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1464381779/ES_Timers.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/ES_Timers.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/IO_Ports.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/IO_Ports.c  .generated_files/flags/default/ce26313a39098766e4846d8229ca8b3e9a7f1111 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1464381779/IO_Ports.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/LED.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/LED.c  .generated_files/flags/default/8f9925cd7f7313228c55daae95f5180391ce19e3 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/LED.o.d" -o ${OBJECTDIR}/_ext/1464381779/LED.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/LED.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/pwm.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/pwm.c  .generated_files/flags/default/fdc751002014575e79bd3fa50eb8aa7ef9e94d3b .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/pwm.o.d" -o ${OBJECTDIR}/_ext/1464381779/pwm.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/pwm.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/serial.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/serial.c  .generated_files/flags/default/6571878b6694a2403d3a948721e26ffc9ed1de5 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/serial.o.d" -o ${OBJECTDIR}/_ext/1464381779/serial.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/serial.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/Project_ES_Main.c  .generated_files/flags/default/e18f88423efc3ef74deb3df5e2d2dc15dfa65841 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o.d" -o ${OBJECTDIR}/_ext/1464381779/Project_ES_Main.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/Project_ES_Main.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/EventCheckers.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/EventCheckers.c  .generated_files/flags/default/6d9c16a90b1776666a411bc38fbbbc054689ceab .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/EventCheckers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/EventCheckers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/EventCheckers.o.d" -o ${OBJECTDIR}/_ext/1464381779/EventCheckers.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/EventCheckers.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/LineFollowSubHSM.c  .generated_files/flags/default/d66582889cfe69506d000c3eae5eadaaef65cab .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/LineFollowSubHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/LineFollowSubHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/TopLevelHSM.c  .generated_files/flags/default/eefdd27ce7820bc5c42fd741de92c3143be364aa .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/TopLevelHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/TopLevelHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/TapeSensorService.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/TapeSensorService.c  .generated_files/flags/default/913f6304a01390d9b51d67931901ac748caa38f1 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/TapeSensorService.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/TapeSensorService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/TapeSensorService.o.d" -o ${OBJECTDIR}/_ext/1464381779/TapeSensorService.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/TapeSensorService.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/BumperService.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/BumperService.c  .generated_files/flags/default/a36da2430339b72634d2e263792ea5b680c985b0 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/BumperService.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/BumperService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/BumperService.o.d" -o ${OBJECTDIR}/_ext/1464381779/BumperService.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/BumperService.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/FaceFindingSubHSM.c  .generated_files/flags/default/f0ff078bab07737ce82e9821c3a23da02272f69b .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/FaceFindingSubHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/FaceFindingSubHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/GoToBeaconSubHSM.c  .generated_files/flags/default/918df7737b9f979d9eeb09756f171e2b1232cc7e .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/GoToBeaconSubHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/GoToBeaconSubHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/AimingSubHSM.c  .generated_files/flags/default/d928662c656c8f4851890a7965563234ab102f45 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/AimingSubHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/AimingSubHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o: C:/Users/lcarvaja/Desktop/Project\ -\ HSM.X/FaceFinding2ndSubHSM.c  .generated_files/flags/default/5ed6e8fe83d4722c7ec2bd43a660651a6b88b7f6 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1464381779" 
	@${RM} ${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -I"../../../../ECE118/templates" -MP -MMD -MF "${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o.d" -o ${OBJECTDIR}/_ext/1464381779/FaceFinding2ndSubHSM.o "C:/Users/lcarvaja/Desktop/Project - HSM.X/FaceFinding2ndSubHSM.c"    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Project_-_HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/ECE118/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Project_-_HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Project_-_HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/ECE118/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Project_-_HSM.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Project_-_HSM.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python  C:\ECE118\scripts\Enum_To_String.py ]"
	@python  C:\ECE118\scripts\Enum_To_String.py 
	@echo "--------------------------------------"

# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
