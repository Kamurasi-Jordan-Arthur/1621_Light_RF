################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.c 

OBJS += \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager.o \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.o \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.o \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.o \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_hash.o \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.o \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.o \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_signature.o \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_util.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager.d \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.d \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.d \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.d \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_hash.d \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.d \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.d \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_signature.d \
./gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_util.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager.c gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_hash.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_hash.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_signature.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_signature.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_util.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.c gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/se_manager/src/sl_se_manager_util.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


