################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_burtc.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_cmu.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_core.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_dbg.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_emu.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_eusart.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_gpcrc.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_gpio.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_i2c.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_iadc.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_ldma.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_letimer.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_msc.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_prs.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_rmu.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_rtcc.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_se.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_system.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_timer.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_usart.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_wdog.c 

OBJS += \
./gecko_sdk_4.4.6/platform/emlib/src/em_burtc.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_cmu.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_core.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_dbg.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_emu.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_eusart.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_gpcrc.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_gpio.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_i2c.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_iadc.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_ldma.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_letimer.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_msc.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_prs.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_rmu.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_rtcc.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_se.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_system.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_timer.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_usart.o \
./gecko_sdk_4.4.6/platform/emlib/src/em_wdog.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/emlib/src/em_burtc.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_cmu.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_core.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_dbg.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_emu.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_eusart.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_gpcrc.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_gpio.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_i2c.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_iadc.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_ldma.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_letimer.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_msc.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_prs.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_rmu.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_rtcc.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_se.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_system.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_timer.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_usart.d \
./gecko_sdk_4.4.6/platform/emlib/src/em_wdog.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/emlib/src/em_burtc.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_burtc.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_burtc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_cmu.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_cmu.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_cmu.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_core.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_core.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_core.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_dbg.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_dbg.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_dbg.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_emu.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_emu.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_emu.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_eusart.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_eusart.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_eusart.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_gpcrc.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_gpcrc.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_gpcrc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_gpio.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_gpio.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_gpio.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_i2c.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_i2c.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_i2c.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_iadc.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_iadc.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_iadc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_ldma.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_ldma.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_ldma.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_letimer.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_letimer.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_letimer.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_msc.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_msc.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_msc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_prs.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_prs.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_prs.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_rmu.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_rmu.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_rmu.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_rtcc.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_rtcc.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_rtcc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_se.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_se.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_se.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_system.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_system.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_system.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_timer.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_timer.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_timer.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_usart.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_usart.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_usart.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/emlib/src/em_wdog.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_wdog.c gecko_sdk_4.4.6/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/emlib/src/em_wdog.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


