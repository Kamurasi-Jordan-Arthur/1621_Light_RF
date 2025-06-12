################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli_arguments.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli_command.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli_input.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli_io.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli_tokenize.c 

OBJS += \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli.o \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_arguments.o \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_command.o \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_input.o \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_io.o \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_tokenize.o 

C_DEPS += \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli.d \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_arguments.d \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_command.d \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_input.d \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_io.d \
./gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_tokenize.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/platform/service/cli/src/sl_cli.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli.c gecko_sdk_4.4.6/platform/service/cli/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/cli/src/sl_cli.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_arguments.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli_arguments.c gecko_sdk_4.4.6/platform/service/cli/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_arguments.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_command.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli_command.c gecko_sdk_4.4.6/platform/service/cli/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_command.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_input.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli_input.c gecko_sdk_4.4.6/platform/service/cli/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_input.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_io.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli_io.c gecko_sdk_4.4.6/platform/service/cli/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_io.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_tokenize.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/platform/service/cli/src/sl_cli_tokenize.c gecko_sdk_4.4.6/platform/service/cli/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/platform/service/cli/src/sl_cli_tokenize.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


