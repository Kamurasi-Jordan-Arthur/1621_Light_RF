################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Scr/bsp.c \
../Scr/remote.c 

OBJS += \
./Scr/bsp.o \
./Scr/remote.o 

C_DEPS += \
./Scr/bsp.d \
./Scr/remote.d 


# Each subdirectory must supply rules for building sources it contributes
Scr/bsp.o: ../Scr/bsp.c Scr/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"Scr/bsp.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Scr/remote.o: ../Scr/remote.c Scr/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"Scr/remote.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


