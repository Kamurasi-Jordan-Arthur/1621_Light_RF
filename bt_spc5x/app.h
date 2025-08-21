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

// Declare the start address of the bootloader flash

#define BSL_START_ADDRESS  0 // Replace with the actual address for your SPC51


// for matter of extention to the state machine handler
extern sl_bt_msg_t * event;

enum USER_SIGS {

  BUTTON_ID = Q_USER_SIG,
  NEXT_FIRMWARE_UPDATE_STATE_ID,
  UART_ARK_ID,
  TIMEOUT_ID,
  BLE_UPDATE_START_ID,
  BLE_DATA_READY_ID,

};







 // Forward declaration (no need for full definition)
 //typedef struct bt_SPC51 bt_SPC51;


typedef struct {
    QEvt super;    /* inherits QEvt */

    uint8_t keyId; /* event parameter (ID of the key depressed) */

    uint8_t duration; /* how long has it been depressed*/

} buttonEvt_t;

// exporting of the button Evt varible holding the press configurations
extern buttonEvt_t buttonEvt;

//decision bool for to send a button pressed event
extern bool button_pressed;

//timer instance for new connections.
extern sl_sleeptimer_timer_handle_t newConnectionTimer;

//blink counter
extern uint8_t blink_count;

//fucntion declaration for notification for updated of notification flag
void notify_flag_change(void);

// Declaration for notification sending for any given characteristic
void send_notification(void);

// FD for extraction of sent data
void parse_dataAndProcess(void);

//
bool command_received();
void send_size(void);

//time window for new connections
#define NEW_DEVICE_CONNECTABLE_DECAY (1 * 1 * 500)

/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
void app_init(void);

/**************************************************************************//**
 * Application Process Action.
 *****************************************************************************/
void app_process_action(void);

#endif // APP_H
