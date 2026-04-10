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
FINAL_IMAGE=${DISTDIR}/Polulu_Lab8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Polulu_Lab8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=robotmain.c ../Common/adcc.c ../Common/device_config.c ../Common/i2c1_master.c ../Common/initialize.c ../Common/pin_manager.c ../Common/pwm7.c ../Common/tmr0.c ../Common/tmr2.c ../Common/uart1.c ../Common/uart2.c pololu_robot.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/robotmain.p1 ${OBJECTDIR}/_ext/2108356922/adcc.p1 ${OBJECTDIR}/_ext/2108356922/device_config.p1 ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1 ${OBJECTDIR}/_ext/2108356922/initialize.p1 ${OBJECTDIR}/_ext/2108356922/pin_manager.p1 ${OBJECTDIR}/_ext/2108356922/pwm7.p1 ${OBJECTDIR}/_ext/2108356922/tmr0.p1 ${OBJECTDIR}/_ext/2108356922/tmr2.p1 ${OBJECTDIR}/_ext/2108356922/uart1.p1 ${OBJECTDIR}/_ext/2108356922/uart2.p1 ${OBJECTDIR}/pololu_robot.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/robotmain.p1.d ${OBJECTDIR}/_ext/2108356922/adcc.p1.d ${OBJECTDIR}/_ext/2108356922/device_config.p1.d ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1.d ${OBJECTDIR}/_ext/2108356922/initialize.p1.d ${OBJECTDIR}/_ext/2108356922/pin_manager.p1.d ${OBJECTDIR}/_ext/2108356922/pwm7.p1.d ${OBJECTDIR}/_ext/2108356922/tmr0.p1.d ${OBJECTDIR}/_ext/2108356922/tmr2.p1.d ${OBJECTDIR}/_ext/2108356922/uart1.p1.d ${OBJECTDIR}/_ext/2108356922/uart2.p1.d ${OBJECTDIR}/pololu_robot.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/robotmain.p1 ${OBJECTDIR}/_ext/2108356922/adcc.p1 ${OBJECTDIR}/_ext/2108356922/device_config.p1 ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1 ${OBJECTDIR}/_ext/2108356922/initialize.p1 ${OBJECTDIR}/_ext/2108356922/pin_manager.p1 ${OBJECTDIR}/_ext/2108356922/pwm7.p1 ${OBJECTDIR}/_ext/2108356922/tmr0.p1 ${OBJECTDIR}/_ext/2108356922/tmr2.p1 ${OBJECTDIR}/_ext/2108356922/uart1.p1 ${OBJECTDIR}/_ext/2108356922/uart2.p1 ${OBJECTDIR}/pololu_robot.p1

# Source Files
SOURCEFILES=robotmain.c ../Common/adcc.c ../Common/device_config.c ../Common/i2c1_master.c ../Common/initialize.c ../Common/pin_manager.c ../Common/pwm7.c ../Common/tmr0.c ../Common/tmr2.c ../Common/uart1.c ../Common/uart2.c pololu_robot.c



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

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Polulu_Lab8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F46K42
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/robotmain.p1: robotmain.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/robotmain.p1.d 
	@${RM} ${OBJECTDIR}/robotmain.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/robotmain.p1 robotmain.c 
	@-${MV} ${OBJECTDIR}/robotmain.d ${OBJECTDIR}/robotmain.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/robotmain.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/adcc.p1: ../Common/adcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/adcc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/adcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/adcc.p1 ../Common/adcc.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/adcc.d ${OBJECTDIR}/_ext/2108356922/adcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/adcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/device_config.p1: ../Common/device_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/device_config.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/device_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/device_config.p1 ../Common/device_config.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/device_config.d ${OBJECTDIR}/_ext/2108356922/device_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/device_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/i2c1_master.p1: ../Common/i2c1_master.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1 ../Common/i2c1_master.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/i2c1_master.d ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/initialize.p1: ../Common/initialize.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/initialize.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/initialize.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/initialize.p1 ../Common/initialize.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/initialize.d ${OBJECTDIR}/_ext/2108356922/initialize.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/initialize.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/pin_manager.p1: ../Common/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/pin_manager.p1 ../Common/pin_manager.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/pin_manager.d ${OBJECTDIR}/_ext/2108356922/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/pwm7.p1: ../Common/pwm7.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/pwm7.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/pwm7.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/pwm7.p1 ../Common/pwm7.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/pwm7.d ${OBJECTDIR}/_ext/2108356922/pwm7.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/pwm7.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/tmr0.p1: ../Common/tmr0.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/tmr0.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/tmr0.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/tmr0.p1 ../Common/tmr0.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/tmr0.d ${OBJECTDIR}/_ext/2108356922/tmr0.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/tmr0.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/tmr2.p1: ../Common/tmr2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/tmr2.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/tmr2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/tmr2.p1 ../Common/tmr2.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/tmr2.d ${OBJECTDIR}/_ext/2108356922/tmr2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/tmr2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/uart1.p1: ../Common/uart1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart1.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/uart1.p1 ../Common/uart1.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/uart1.d ${OBJECTDIR}/_ext/2108356922/uart1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/uart1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/uart2.p1: ../Common/uart2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart2.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/uart2.p1 ../Common/uart2.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/uart2.d ${OBJECTDIR}/_ext/2108356922/uart2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/uart2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/pololu_robot.p1: pololu_robot.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pololu_robot.p1.d 
	@${RM} ${OBJECTDIR}/pololu_robot.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/pololu_robot.p1 pololu_robot.c 
	@-${MV} ${OBJECTDIR}/pololu_robot.d ${OBJECTDIR}/pololu_robot.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pololu_robot.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/robotmain.p1: robotmain.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/robotmain.p1.d 
	@${RM} ${OBJECTDIR}/robotmain.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/robotmain.p1 robotmain.c 
	@-${MV} ${OBJECTDIR}/robotmain.d ${OBJECTDIR}/robotmain.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/robotmain.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/adcc.p1: ../Common/adcc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/adcc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/adcc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/adcc.p1 ../Common/adcc.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/adcc.d ${OBJECTDIR}/_ext/2108356922/adcc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/adcc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/device_config.p1: ../Common/device_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/device_config.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/device_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/device_config.p1 ../Common/device_config.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/device_config.d ${OBJECTDIR}/_ext/2108356922/device_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/device_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/i2c1_master.p1: ../Common/i2c1_master.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1 ../Common/i2c1_master.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/i2c1_master.d ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/i2c1_master.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/initialize.p1: ../Common/initialize.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/initialize.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/initialize.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/initialize.p1 ../Common/initialize.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/initialize.d ${OBJECTDIR}/_ext/2108356922/initialize.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/initialize.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/pin_manager.p1: ../Common/pin_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/pin_manager.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/pin_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/pin_manager.p1 ../Common/pin_manager.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/pin_manager.d ${OBJECTDIR}/_ext/2108356922/pin_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/pin_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/pwm7.p1: ../Common/pwm7.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/pwm7.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/pwm7.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/pwm7.p1 ../Common/pwm7.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/pwm7.d ${OBJECTDIR}/_ext/2108356922/pwm7.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/pwm7.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/tmr0.p1: ../Common/tmr0.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/tmr0.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/tmr0.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/tmr0.p1 ../Common/tmr0.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/tmr0.d ${OBJECTDIR}/_ext/2108356922/tmr0.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/tmr0.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/tmr2.p1: ../Common/tmr2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/tmr2.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/tmr2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/tmr2.p1 ../Common/tmr2.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/tmr2.d ${OBJECTDIR}/_ext/2108356922/tmr2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/tmr2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/uart1.p1: ../Common/uart1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart1.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/uart1.p1 ../Common/uart1.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/uart1.d ${OBJECTDIR}/_ext/2108356922/uart1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/uart1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2108356922/uart2.p1: ../Common/uart2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2108356922" 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart2.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2108356922/uart2.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2108356922/uart2.p1 ../Common/uart2.c 
	@-${MV} ${OBJECTDIR}/_ext/2108356922/uart2.d ${OBJECTDIR}/_ext/2108356922/uart2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2108356922/uart2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/pololu_robot.p1: pololu_robot.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pololu_robot.p1.d 
	@${RM} ${OBJECTDIR}/pololu_robot.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/pololu_robot.p1 pololu_robot.c 
	@-${MV} ${OBJECTDIR}/pololu_robot.d ${OBJECTDIR}/pololu_robot.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pololu_robot.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

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
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Polulu_Lab8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/Polulu_Lab8.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=none  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/Polulu_Lab8.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/Polulu_Lab8.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/Polulu_Lab8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/Polulu_Lab8.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/Polulu_Lab8.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
