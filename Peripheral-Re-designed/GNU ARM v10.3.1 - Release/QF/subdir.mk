################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/qp/qpc/src/qf/qep_hsm.c \
C:/qp/qpc/src/qf/qep_msm.c \
C:/qp/qpc/src/qf/qf_act.c \
C:/qp/qpc/src/qf/qf_actq.c \
C:/qp/qpc/src/qf/qf_defer.c \
C:/qp/qpc/src/qf/qf_dyn.c \
C:/qp/qpc/src/qf/qf_mem.c \
C:/qp/qpc/src/qf/qf_ps.c \
C:/qp/qpc/src/qf/qf_qact.c \
C:/qp/qpc/src/qf/qf_qeq.c \
C:/qp/qpc/src/qf/qf_qmact.c \
C:/qp/qpc/src/qf/qf_time.c 

OBJS += \
./QF/qep_hsm.o \
./QF/qep_msm.o \
./QF/qf_act.o \
./QF/qf_actq.o \
./QF/qf_defer.o \
./QF/qf_dyn.o \
./QF/qf_mem.o \
./QF/qf_ps.o \
./QF/qf_qact.o \
./QF/qf_qeq.o \
./QF/qf_qmact.o \
./QF/qf_time.o 

C_DEPS += \
./QF/qep_hsm.d \
./QF/qep_msm.d \
./QF/qf_act.d \
./QF/qf_actq.d \
./QF/qf_defer.d \
./QF/qf_dyn.d \
./QF/qf_mem.d \
./QF/qf_ps.d \
./QF/qf_qact.d \
./QF/qf_qeq.d \
./QF/qf_qmact.d \
./QF/qf_time.d 


# Each subdirectory must supply rules for building sources it contributes
QF/qep_hsm.o: C:/qp/qpc/src/qf/qep_hsm.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qep_hsm.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qep_msm.o: C:/qp/qpc/src/qf/qep_msm.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qep_msm.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qf_act.o: C:/qp/qpc/src/qf/qf_act.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qf_act.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qf_actq.o: C:/qp/qpc/src/qf/qf_actq.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qf_actq.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qf_defer.o: C:/qp/qpc/src/qf/qf_defer.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qf_defer.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qf_dyn.o: C:/qp/qpc/src/qf/qf_dyn.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qf_dyn.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qf_mem.o: C:/qp/qpc/src/qf/qf_mem.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qf_mem.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qf_ps.o: C:/qp/qpc/src/qf/qf_ps.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qf_ps.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qf_qact.o: C:/qp/qpc/src/qf/qf_qact.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qf_qact.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qf_qeq.o: C:/qp/qpc/src/qf/qf_qeq.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qf_qeq.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qf_qmact.o: C:/qp/qpc/src/qf/qf_qmact.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qf_qmact.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QF/qf_time.o: C:/qp/qpc/src/qf/qf_time.c QF/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QF/qf_time.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


