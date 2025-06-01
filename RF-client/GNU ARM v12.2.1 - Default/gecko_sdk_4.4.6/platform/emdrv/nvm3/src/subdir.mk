################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emdrv/nvm3/src/nvm3_lock.c 

OBJS += \
./gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_default_common_linker.o \
./gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_hal_flash.o \
./gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_lock.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_default_common_linker.d \
./gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_hal_flash.d \
./gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_lock.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_default_common_linker.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.c gecko_sdk_4.4.6/platform/emdrv/nvm3/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_default_common_linker.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_hal_flash.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.c gecko_sdk_4.4.6/platform/emdrv/nvm3/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_hal_flash.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_lock.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emdrv/nvm3/src/nvm3_lock.c gecko_sdk_4.4.6/platform/emdrv/nvm3/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emdrv/nvm3/src/nvm3_lock.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


