################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/sleeptimer/src/sl_sleeptimer.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c 

OBJS += \
./gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer.o \
./gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o \
./gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.o \
./gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.o \
./gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer.d \
./gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.d \
./gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.d \
./gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.d \
./gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/sleeptimer/src/sl_sleeptimer.c gecko_sdk_4.4.6/platform/service/sleeptimer/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c gecko_sdk_4.4.6/platform/service/sleeptimer/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.c gecko_sdk_4.4.6/platform/service/sleeptimer/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.c gecko_sdk_4.4.6/platform/service/sleeptimer/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c gecko_sdk_4.4.6/platform/service/sleeptimer/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


