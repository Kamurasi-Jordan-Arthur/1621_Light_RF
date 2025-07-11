################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../QS/qs/qstamp.c 

OBJS += \
./QS/qs/qstamp.o 

C_DEPS += \
./QS/qs/qstamp.d 


# Each subdirectory must supply rules for building sources it contributes
QS/qs/qstamp.o: ../QS/qs/qstamp.c QS/qs/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"QS/qs/qstamp.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


