################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/driver/leddrv/src/sl_led.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/driver/leddrv/src/sl_simple_led.c 

OBJS += \
./gecko_sdk_4.4.6/platform/driver/leddrv/src/sl_led.o \
./gecko_sdk_4.4.6/platform/driver/leddrv/src/sl_simple_led.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/driver/leddrv/src/sl_led.d \
./gecko_sdk_4.4.6/platform/driver/leddrv/src/sl_simple_led.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/driver/leddrv/src/sl_led.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/driver/leddrv/src/sl_led.c gecko_sdk_4.4.6/platform/driver/leddrv/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/driver/leddrv/src/sl_led.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/driver/leddrv/src/sl_simple_led.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/driver/leddrv/src/sl_simple_led.c gecko_sdk_4.4.6/platform/driver/leddrv/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/driver/leddrv/src/sl_simple_led.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


