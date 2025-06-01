################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/hardware/board/src/sl_board_control_gpio.c \
/home/jordan/SimplicityStudio/SDKs/gecko_sdk/hardware/board/src/sl_board_init.c 

OBJS += \
./gecko_sdk_4.4.6/hardware/board/src/sl_board_control_gpio.o \
./gecko_sdk_4.4.6/hardware/board/src/sl_board_init.o 

C_DEPS += \
./gecko_sdk_4.4.6/hardware/board/src/sl_board_control_gpio.d \
./gecko_sdk_4.4.6/hardware/board/src/sl_board_init.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.6/hardware/board/src/sl_board_control_gpio.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/hardware/board/src/sl_board_control_gpio.c gecko_sdk_4.4.6/hardware/board/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/hardware/board/src/sl_board_control_gpio.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.6/hardware/board/src/sl_board_init.o: /home/jordan/SimplicityStudio/SDKs/gecko_sdk/hardware/board/src/sl_board_init.c gecko_sdk_4.4.6/hardware/board/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.6/hardware/board/src/sl_board_init.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


