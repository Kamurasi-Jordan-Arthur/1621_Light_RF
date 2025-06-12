################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/service/power_manager/src/sl_power_manager.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/service/power_manager/src/sl_power_manager_debug.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/service/power_manager/src/sl_power_manager_hal_s2.c 

OBJS += \
./gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager.o \
./gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager_debug.o \
./gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager_hal_s2.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager.d \
./gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager_debug.d \
./gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager_hal_s2.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/service/power_manager/src/sl_power_manager.c gecko_sdk_4.4.6/platform/service/power_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager_debug.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/service/power_manager/src/sl_power_manager_debug.c gecko_sdk_4.4.6/platform/service/power_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager_debug.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager_hal_s2.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/service/power_manager/src/sl_power_manager_hal_s2.c gecko_sdk_4.4.6/platform/service/power_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/power_manager/src/sl_power_manager_hal_s2.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


