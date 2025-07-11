################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sl_apploader_util_s2.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sl_bt_stack_init.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_accept_list_config.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_advertiser_config.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_connection_config.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_l2cap_config.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_periodic_adv_config.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.c \
C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_sync_config.c 

OBJS += \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sl_apploader_util_s2.o \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sl_bt_stack_init.o \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_accept_list_config.o \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_advertiser_config.o \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_connection_config.o \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.o \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_l2cap_config.o \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.o \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_periodic_adv_config.o \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.o \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_sync_config.o 

C_DEPS += \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sl_apploader_util_s2.d \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sl_bt_stack_init.d \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_accept_list_config.d \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_advertiser_config.d \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_connection_config.d \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.d \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_l2cap_config.d \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.d \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_periodic_adv_config.d \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.d \
./gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_sync_config.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/protocol/bluetooth/src/sl_apploader_util_s2.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sl_apploader_util_s2.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sl_apploader_util_s2.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/protocol/bluetooth/src/sl_bt_stack_init.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sl_bt_stack_init.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sl_bt_stack_init.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_accept_list_config.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_accept_list_config.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_accept_list_config.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_advertiser_config.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_advertiser_config.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_advertiser_config.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_connection_config.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_connection_config.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_connection_config.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_dynamic_gattdb_config.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_l2cap_config.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_l2cap_config.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_l2cap_config.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_pawr_advertiser_config.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_periodic_adv_config.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_periodic_adv_config.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_periodic_adv_config.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_periodic_advertiser_config.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_sync_config.o: C:/SiliconLabs/SimplicityStudio/v5/offline/sdk/gecko-sdk/protocol/bluetooth/src/sli_bt_sync_config.c gecko_sdk_4.4.6/protocol/bluetooth/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/protocol/bluetooth/src/sli_bt_sync_config.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


