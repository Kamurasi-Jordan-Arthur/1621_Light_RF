################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/udelay/src/sl_udelay.c 

S_UPPER_SRCS += \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.S 

OBJS += \
./gecko_sdk_4.4.6/platform/service/udelay/src/sl_udelay.o \
./gecko_sdk_4.4.6/platform/service/udelay/src/sl_udelay_armv6m_gcc.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/service/udelay/src/sl_udelay.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/service/udelay/src/sl_udelay.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/udelay/src/sl_udelay.c gecko_sdk_4.4.6/platform/service/udelay/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/udelay/src/sl_udelay.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/udelay/src/sl_udelay_armv6m_gcc.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.S gecko_sdk_4.4.6/platform/service/udelay/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Assembler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -x assembler-with-cpp -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


