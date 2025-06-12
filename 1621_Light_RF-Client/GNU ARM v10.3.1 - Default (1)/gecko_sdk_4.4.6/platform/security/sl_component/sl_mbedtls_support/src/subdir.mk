################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c 

OBJS += \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.o \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.o \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.o \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.o \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.d \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.d \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.d \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.d \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.d \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.d \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.d \
./gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.c gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_aes.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.c gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


