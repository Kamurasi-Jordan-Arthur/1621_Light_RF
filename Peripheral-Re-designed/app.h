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

#ifndef APP_H
#define APP_H
//typedef struct sl_bt_msg sl_bt_msg_t;
//typedef struct sl_sleeptimer_timer_handle sl_sleeptimer_timer_handle_t;

//time interval for each blink
#define BLINK_TIMEOUT (1u * 1u * 125u)

enum USER_SIGS {
  BUTTON_ID = Q_USER_SIG,
  TIMEOUT_ID,
};

typedef struct {
    QEvt super;    /* inherits QEvt */

    uint8_t keyId; /* event parameter (ID of the key depressed) */

    uint8_t duration; /* how long has it been depressed*/

} buttonEvt_t;

// for matters of extension to the state machine handler
//bt data holding varible
extern sl_bt_msg_t * event;

//timer instance for blinking led.
extern sl_sleeptimer_timer_handle_t appTimer;

//QPC button Event
extern buttonEvt_t buttonEvt;

//blink counter
extern uint8_t blink_count;

//todo I dought these are needed in other files
// UUID definition extension
extern const uint8_t led_service_UUID[16];

extern const uint8_t led_cofig_char_UUID[16];

extern const uint8_t changes_char_UUID[16];


uint8_t service_InAdvertisement(uint8_t *data, uint8_t len);

bd_addr *read_and_cache_bluetooth_address(uint8_t *address_type_out);

void print_bluetooth_address(void);

void blinkTimerCallback(sl_sleeptimer_timer_handle_t *handle, void *data);

void scanTimerCallback(sl_sleeptimer_timer_handle_t *handle, void *data);

// FD for extraction of sent data
bool parse_data(void);


/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
void app_init(void);

/**************************************************************************//**
 * Application Process Action.
 *****************************************************************************/
void app_process_action(void);

#endif // APP_H
