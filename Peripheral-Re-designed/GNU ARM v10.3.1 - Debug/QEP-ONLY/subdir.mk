################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../QEP-ONLY/qep_hsm.c \
../QEP-ONLY/qep_msm.c 

OBJS += \
./QEP-ONLY/qep_hsm.o \
./QEP-ONLY/qep_msm.o 

C_DEPS += \
./QEP-ONLY/qep_hsm.d \
./QEP-ONLY/qep_msm.d 


# Each subdirectory must supply rules for building sources it contributes
QEP-ONLY/qep_hsm.o: ../QEP-ONLY/qep_hsm.c QEP-ONLY/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QEP-ONLY/qep_hsm.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

QEP-ONLY/qep_msm.o: ../QEP-ONLY/qep_msm.c QEP-ONLY/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QEP-ONLY/qep_msm.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


