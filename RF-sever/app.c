/***************************************************************************//**
 * @file
 * @brief Core application logic.
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
#include "em_common.h"
#include "app_assert.h"
#include "sl_bluetooth.h"
#include "sl_button.h"
#include "sl_simple_button_instances.h"
#include "sl_simple_led_instances.h"
#include "gatt_db.h"
#include "sl_iostream_init_eusart_instances.h"
#include <stdio.h>
#include "sl_sleeptimer.h"
#include "appLogic.h"
#include "app_button_press.h"
#include "app.h"

//#define DEBOUNCE_DELAY_MS 160


conn_state_t conn_state;

//this defines the maxmum number of led instances less by one
#define MAX_LED_INDEX 4

//uint8_t report_button_flag = 0U;

//what function is to me done

struct message testMessage = {SHORT ,false , initial};


// The advertising set handle allocated from Bluetooth stack.
uint8_t advertising_set_handle = 0xff;

//timer handling the decay for the advertisement period
sl_sleeptimer_timer_handle_t ad_decay;


// The advertising set handle allocated from Bluetooth stack.
uint8_t initialised = 0U;

//this is for keeping track between the different use case scenarios
uint8_t current_led = 0U;

uint8_t current_connection;
// Decalaration for defaulting the IOstream
void initialise_Default_IOStream(void);

////fucntion declaration for local the updated of gatt table value
//static sl_status_t update_value(uint8_t gattdb_X);

//fucntion declaration for notification for updated of notification flag
void notify_flag_change(uint8_t gattdb_X, uint8_t connection);

led_conf leds[MAX_LED_INDEX];

void ad_decay_callback(sl_sleeptimer_timer_handle_t *handle, void *data);



/***************************************************************************//**
 * Callback on button change.
 ******************************************************************************/
//  void sl_button_on_change(const sl_button_t *handle){
//
//      if (sl_button_get_state(handle) == SL_SIMPLE_BUTTON_PRESSED) {
//          testMessage.report_button_flag = 1U;
//          if (&BUTTON_INSTANCE_0 == handle) {
////              leds[current_led].led++;
//              leds[current_led].percentage++;
//              testMessage.ledFunction = increase;
//
//          }else if(&sl_button_btn1 == handle){
//              leds[current_led].percentage--;
//              testMessage.ledFunction = decrease;
//
//          }else{
//              do{leds[current_led].status = leds[current_led].status ^ (uint8_t)1U;
//              testMessage.ledFunction = toggle;}while(0);
//          }
//      }
//  }


void app_button_press_cb(uint8_t button, uint8_t duration){
//  testMessage.report_button_flag = true;

  switch (duration) {
    case APP_BUTTON_PRESS_DURATION_SHORT:
          testMessage.report_button_flag = true;
          testMessage.duration = SHORT;

          if (&BUTTON_INSTANCE_0 == SL_SIMPLE_BUTTON_INSTANCE(button)) {
              if(++leds[current_led].percentage > (uint8_t)100U){
                  leds[current_led].percentage = (uint8_t)100U;
              }
              testMessage.ledFunction = increase;
          } else if (&sl_button_btn1 == SL_SIMPLE_BUTTON_INSTANCE(button)) {
              if(--leds[current_led].percentage > (uint8_t)100){
                  leds[current_led].percentage = 0U;
              }
              testMessage.ledFunction = decrease;
          } else {
              leds[current_led].status ^= 1U;
              testMessage.ledFunction = toggle;
          }

      break;

    case APP_BUTTON_PRESS_DURATION_MEDIUM:
//TODO wrong button call care to put it write;
//      if (&sl_button_btn2 == SL_SIMPLE_BUTTON_INSTANCE(button)) {
      if (&BUTTON_INSTANCE_0 == SL_SIMPLE_BUTTON_INSTANCE(button)) {
          testMessage.report_button_flag = true;
          testMessage.duration = MEDIUM;
          if (current_led < MAX_LED_INDEX){
              current_led++;
          }else {
              current_led = 0U;
          }
      }

      break;

    default:
      break;
  }

}

  void send_notification(uint8_t gattdb_X){
    sl_status_t sc;

    switch (gattdb_X) {
      case gattdb_Led_num:
        // Read led values characteristic stored in local GATT database.
        sc = sl_bt_gatt_server_write_attribute_value(gattdb_Led_num,
                                                    0,
                                                    (size_t)sizeof(leds[current_led].led),
                                                    &leds[current_led].led);
        app_assert_status(sc);

        // Send characteristic notification.
        sc = sl_bt_gatt_server_notify_all(gattdb_Led_num,
                                          sizeof(leds[current_led].led),
                                          &leds[current_led].led);
        app_assert_status(sc);
        break;

      case gattdb_Status:
        // Read status button characteristic stored in local GATT database.
        sc = sl_bt_gatt_server_write_attribute_value(gattdb_Status,
                                                    0,
                                                    (size_t)sizeof(leds[current_led].status),
                                                    &leds[current_led].status);
        app_assert_status(sc);

        // Send characteristic notification.
        sc = sl_bt_gatt_server_notify_all(gattdb_Status,
                                          sizeof(leds[current_led].status),
                                          &leds[current_led].status);
        app_assert_status(sc);
        break;

      case gattdb_Percentage:
        // Read percentage characteristic stored in local GATT database.
        sc = sl_bt_gatt_server_write_attribute_value(gattdb_Percentage,
                                                    0,
                                                    (size_t)sizeof(leds[current_led].percentage),
                                                    &leds[current_led].percentage);
        app_assert_status(sc);

        // Send characteristic notification.
        sc = sl_bt_gatt_server_notify_all(gattdb_Percentage,
                                          sizeof(leds[current_led].percentage),
                                          &leds[current_led].percentage);
        app_assert_status(sc);
        break;

      case gattdb_Send:
        sc = sl_bt_gatt_server_notify_all(gattdb_Send, 1U, (uint8_t*)1u);
              app_assert_status(sc);
              //re-arm the
              re_arm_connection_delay();

      default:
        break;
    }

    return;
  }
//
////Probably wont be called and should Not be called
//static sl_status_t update_value(uint8_t gattdb_X){
//    sl_status_t sc;
//    size_t data_recv_len;
//
//    switch (gattdb_X) {
//      case gattdb_Led_num:
//        // Read led  num value characteristic stored in local GATT database.
//        sc = sl_bt_gatt_server_read_attribute_value(gattdb_Led_num,
//                                                    0,
//                                                    (size_t)sizeof(leds),
//                                                    &data_recv_len,
//                                                    &led);
//        app_assert_status(sc);
//
//        // Send characteristic notification.
//        sc = sl_bt_gatt_server_notify_all(gattdb_Led_num,
//                                          sizeof(led),
//                                          &led);
//        app_assert_status(sc);
//        break;
//
//      case gattdb_Status:
//        // Read status characteristic stored in local GATT database.
//        sc = sl_bt_gatt_server_read_attribute_value(gattdb_Status,
//                                                    0,
//                                                    (size_t)sizeof(status),
//                                                    &data_recv_len,
//                                                    &status);
//        app_assert_status(sc);
//
//        // Send characteristic notification.
//        sc = sl_bt_gatt_server_notify_all(gattdb_Led_num,
//                                          sizeof(led),
//                                          &led);
//        app_assert_status(sc);
//        break;
//
//      case gattdb_Percentage:
//        // Read percentage characteristic stored in local GATT database.
//        sc = sl_bt_gatt_server_read_attribute_value(gattdb_Percentage,
//                                                    0,
//                                                    (size_t)sizeof(percentage),
//                                                    &data_recv_len,
//                                                    &percentage);
//        app_assert_status(sc);
//
//        // Send characteristic notification.
//        sc = sl_bt_gatt_server_notify_all(gattdb_Percentage,
//                                          sizeof(percentage),
//                                          &percentage);
//        app_assert_status(sc);
//        break;
//
//      case gattdb_Send:
//        sc = sl_bt_gatt_server_notify_all(gattdb_Send,
//                                          sizeof(gattdb_Send),
//                                          &gattdb_Send);
//        app_assert_status(sc);
////        PRINT_MESSAGE();
//
//        break;
//
//      default:
//        break;
//    }
//
//    return sc;
//  }

void notify_flag_change(uint8_t gattdb_X, uint8_t connection){
  (void) connection;
//  sl_status_t sc;
    switch (gattdb_X) {
      case gattdb_Led_num:
          app_log_info("%s notification enabled.\n", "Led");

        break;

      case gattdb_Status:
          app_log_info("Status notification enabled.\n");

        break;

      case gattdb_Percentage:
          app_log_info("Percentage notification enabled.\n");

        break;
        case gattdb_Send:
          app_log_info("Send notification enabled.\n");

          // enable the buttons and now we can listen for incomming data from hosts
          app_log_info("RX-EM-restriction placed.\n");
          sl_iostream_uart_set_rx_energy_mode_restriction(sl_iostream_uart_vcom_handle, true);

          // Notify the user that we'r in business
//          sl_led_turn_on(&sl_led_led0);

          //Enable buttons
          sl_button_enable(&BUTTON_INSTANCE_0);
          sl_button_enable(&sl_button_btn1);
//          sl_button_enable(&sl_button_btn2);

          //Arm the connetion delay timer
          re_arm_connection_delay();

          // intruduce the connection restrictions i.e Latency
//          sc = sl_bt_connection_set_parameters(
//              connection,
//              160,     // 50 ms
//              160,     // 100 ms
//              0x01f3,      // latency: can skip 4 intervals
//              600,    // 6 seconds supervision timeout
//              0,
//              0);
          //Just for test cases
//          sc = sl_bt_connection_set_parameters(
//              connection,
//              160,
//              160,
//              5,      // latency: can skip 5 intervals
//              450,    // 6 seconds supervision timeout
//              0,
//              0xFFFF);
//          app_assert_status(sc);

          conn_state = running;

          break;

      default:
        break;
    }

    return;
  }

void initialise_Default_IOStream(void){
  sl_iostream_set_default(sl_iostream_vcom_handle);
}

/**************************************************************************//**
 * Bluetooth stack event handler.
 * This overrides the dummy weak implementation.
 *
 * @param[in] evt Event coming from the Bluetooth stack.
 *****************************************************************************/
void sl_bt_on_event(sl_bt_msg_t *evt)
{

  switch (SL_BT_MSG_ID(evt->header)) {
    sl_status_t sc;

    // Device boot event

    case sl_bt_evt_system_boot_id:
      initialised = true;

      sc = sl_bt_advertiser_create_set(&advertising_set_handle);
      app_assert_status(sc);

      sc = sl_bt_legacy_advertiser_generate_data(
        advertising_set_handle,
        sl_bt_advertiser_general_discoverable);

      app_assert_status(sc);

      sc = sl_bt_advertiser_set_timing(
        advertising_set_handle,
        2400U, 3200U, // min & max interval (ms * 1.6)
        1700U, 0U);    // duration, max events
      app_assert_status(sc);

      sc = sl_bt_advertiser_set_channel_map(advertising_set_handle, (uint8_t)0x01);  // Only channel 37

      conn_state = advertising;
      advertise_entry();

      break;

    // Notification enabled/disabled
    case sl_bt_evt_gatt_server_characteristic_status_id:
      notify_flag_change(
          evt->data.evt_gatt_server_characteristic_status.characteristic, evt->data.evt_gatt_server_characteristic_status.connection);

      break;

    // Connection opened
    case sl_bt_evt_connection_opened_id:
      app_log_info("Connected.\n"
            ">>Bt_Server-side ...\n"
            ">>Max no. of Leds %d\n"
            ">>Input Syntax :-l%%d -p%%d -s%%d\n\n", MAX_LED_INDEX);

      //Stop the blinky indicator and turn off led
      sc = sl_sleeptimer_stop_timer(&blinkhandle);
      app_assert_status(sc);
      sl_led_turn_off(&sl_led_led0);

      current_connection = evt->data.evt_connection_opened.connection;
      conn_state = openned;

      break;

    // Connection closed
    case sl_bt_evt_connection_closed_id:
      app_log_info("Dis-connected.\n");

      if(conn_state == running){
//          case when the remote desides to disconnect during conection
          sc = sl_sleeptimer_stop_timer(&connection_decay);
          app_assert_status(sc);
          app_log_info("RX-EM-restriction removed.\n");
          sl_iostream_uart_set_rx_energy_mode_restriction(sl_iostream_uart_vcom_handle, false);
      }


//      sl_iostream_uart_set_rx_energy_mode_restriction(sl_iostream_uart_vcom_handle, false);

      if (conn_state == sleeping){
          sl_led_turn_off(&sl_led_led0);
          break;
      }

      conn_state = advertising;
      advertise_entry();

      break;

    case sl_bt_evt_advertiser_timeout_id:
      if (conn_state == advertising){

          //Stop the blinky indicator and turn it off
          sc = sl_sleeptimer_stop_timer(&blinkhandle);
          app_assert_status(sc);
          sl_led_turn_off(&sl_led_led0);

          conn_state = sleeping;
//          sl_led_turn_off(&sl_led_led0);

          sl_button_enable(&BUTTON_INSTANCE_0);
          sl_button_enable(&sl_button_btn1);
//          sl_button_enable(&sl_button_btn2);

          app_log("Entering Sleep..\n");
      }

      break;

    // Default handler
    default:
      break;
  }
}

void advertise_entry(void){
  sl_status_t sc;
  sc = sl_bt_legacy_advertiser_start(
    advertising_set_handle,
    sl_bt_legacy_advertiser_connectable);
  app_assert_status(sc);

  app_log("Advertising...\n");

  // Indicate the advertisement
  led_blink(0U);

}

void ad_decay_callback(sl_sleeptimer_timer_handle_t *handle, void *data){
  (void)handle;
  (void)data;
  sl_status_t sc;
  if(conn_state == advertising){
      sc = sl_bt_advertiser_stop(advertising_set_handle);

      app_assert_status(sc);
      conn_state = sleeping;
      app_log_info("Entering Sleep.\n");

  }
//     Timer expired: handle timeout event here
}

// function call for each time the an interrupt happens of the Usart recieve occurs

