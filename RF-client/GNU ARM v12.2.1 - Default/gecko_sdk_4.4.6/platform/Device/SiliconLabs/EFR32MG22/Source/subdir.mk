################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/Device/SiliconLabs/EFR32MG22/Source/startup_efr32mg22.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/Device/SiliconLabs/EFR32MG22/Source/system_efr32mg22.c 

OBJS += \
./gecko_sdk_4.4.6/platform/Device/SiliconLabs/EFR32MG22/Source/startup_efr32mg22.o \
./gecko_sdk_4.4.6/platform/Device/SiliconLabs/EFR32MG22/Source/system_efr32mg22.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/Device/SiliconLabs/EFR32MG22/Source/startup_efr32mg22.d \
./gecko_sdk_4.4.6/platform/Device/SiliconLabs/EFR32MG22/Source/system_efr32mg22.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/Device/SiliconLabs/EFR32MG22/Source/startup_efr32mg22.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/Device/SiliconLabs/EFR32MG22/Source/startup_efr32mg22.c gecko_sdk_4.4.6/platform/Device/SiliconLabs/EFR32MG22/Source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/Device/SiliconLabs/EFR32MG22/Source/startup_efr32mg22.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/Device/SiliconLabs/EFR32MG22/Source/system_efr32mg22.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/Device/SiliconLabs/EFR32MG22/Source/system_efr32mg22.c gecko_sdk_4.4.6/platform/Device/SiliconLabs/EFR32MG22/Source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/Device/SiliconLabs/EFR32MG22/Source/system_efr32mg22.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


