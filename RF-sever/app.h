/***************************************************************************//**
 * @file
 * @brief Application interface provided to main().
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 ******************************************************************************/
#include <stdbool.h>
#ifndef APP_H
#define APP_H

#ifndef BUTTON_INSTANCE_0
#define BUTTON_INSTANCE_0   sl_button_btn0
#endif

#ifndef LED_INSTANCE_0
#define LED_INSTANCE_0      sl_led_led0
#endif


#define MAX_LED_INDEX 4
#include <stdio.h>

typedef enum {
  SHORT,
  MEDIUM,
  LONG,
  VERYLONG,
} press_duration;


typedef struct led_conf_t {
  uint8_t led;
  uint8_t percentage;
  uint8_t status;
} led_conf;

typedef enum {
  initial,
  toggle,
  increase,
  decrease,
} function;

struct message{
  bool report_button_flag;
  press_duration duration;
  function ledFunction;

};

typedef enum {
  advertising,
  openned,
  running,
  sleeping,
} conn_state_t;

extern struct message testMessage;

extern led_conf leds[MAX_LED_INDEX];

extern uint8_t initialised;

extern uint8_t report_button_flag;

extern conn_state_t conn_state;

extern uint8_t current_connection;

extern uint8_t current_led;

extern uint8_t advertising_set_handle;

#define PRINT_MESSAGE() app_log("L%d %d %d\n", leds[current_led].led, leds[current_led].percentage , leds[current_led].status)

// Declaration for notification sending for any given characteristic
void send_notification(uint8_t gattdb_X);

void advertise_entry(void);

/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
void app_init(void);

/**************************************************************************//**
 * Application Process Action.
 *****************************************************************************/
void app_process_action(void);

void initialise_Default_IOStream(void);

#endif // APP_H
