################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c 

OBJS += \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.o \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.d \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c gecko_sdk_4.4.6/platform/security/sl_component/sl_protocol_crypto/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c gecko_sdk_4.4.6/platform/security/sl_component/sl_protocol_crypto/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


