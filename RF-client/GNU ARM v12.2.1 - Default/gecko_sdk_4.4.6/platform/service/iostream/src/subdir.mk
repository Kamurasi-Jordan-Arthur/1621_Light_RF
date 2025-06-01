################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/iostream/src/sl_iostream.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/iostream/src/sl_iostream_stdlib_config.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/iostream/src/sl_iostream_uart.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/iostream/src/sl_iostream_usart.c 

OBJS += \
./gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream.o \
./gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_retarget_stdio.o \
./gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_stdlib_config.o \
./gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_uart.o \
./gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_usart.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream.d \
./gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_retarget_stdio.d \
./gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_stdlib_config.d \
./gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_uart.d \
./gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_usart.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/iostream/src/sl_iostream.c gecko_sdk_4.4.6/platform/service/iostream/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_retarget_stdio.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/iostream/src/sl_iostream_retarget_stdio.c gecko_sdk_4.4.6/platform/service/iostream/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_retarget_stdio.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_stdlib_config.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/iostream/src/sl_iostream_stdlib_config.c gecko_sdk_4.4.6/platform/service/iostream/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_stdlib_config.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_uart.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/iostream/src/sl_iostream_uart.c gecko_sdk_4.4.6/platform/service/iostream/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_uart.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_usart.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/iostream/src/sl_iostream_usart.c gecko_sdk_4.4.6/platform/service/iostream/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/iostream/src/sl_iostream_usart.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


