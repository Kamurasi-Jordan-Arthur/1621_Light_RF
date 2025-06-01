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
#include "app.h"
#include "sl_simple_button_instances.h"
#include "sl_simple_led_instances.h"
#include "gatt_db.h"
#include "sl_iostream_init_eusart_instances.h"
#include <stdio.h>


#ifndef BUTTON_INSTANCE_0
#define BUTTON_INSTANCE_0   sl_button_btn0
#endif

#ifndef LED_INSTANCE_0
#define LED_INSTANCE_0      sl_led_led0
#endif
//this defines the maxmum number of led instances less by one
#define MAX_LED_INDEX 4

static bool report_button_flag = false;


// The advertising set handle allocated from Bluetooth stack.
static uint8_t advertising_set_handle = 0xff;


// The advertising set handle allocated from Bluetooth stack.
uint8_t initialised = 0U;



// Decalaration for defaulting the IOstream
void initialise_Default_IOStream(void);

////fucntion declaration for local the updated of gatt table value
//static sl_status_t update_value(uint8_t gattdb_X);

//fucntion declaration for notification for updated of notification flag
static sl_status_t notify_flag_change(uint8_t gattdb_X,  uint8_t connection ,uint8_t client_config_flags);

//print message macro
#define PRINT_MESSAGE() printf("L%d %d %d\n", led, percentage , status)

led_conf leds[MAX_LED_INDEX];

//Application counter variable


/***************************************************************************//**
 * Callback on button change.
 ******************************************************************************/
  void sl_button_on_change(const sl_button_t *handle){
      if (sl_button_get_state(handle) == SL_SIMPLE_BUTTON_PRESSED) {

        if (&BUTTON_INSTANCE_0 == handle) {
            report_button_flag = true;

        }
      }
  }

//  static sl_status_t send_notification(uint8_t gattdb_X){
//    sl_status_t sc;
//
//    switch (gattdb_X) {
//      case gattdb_Led_num:
//        // Read led values characteristic stored in local GATT database.
//        sc = sl_bt_gatt_server_write_attribute_value(gattdb_Led_num,
//                                                    0,
//                                                    (size_t)sizeof(led),
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
//        // Read status button characteristic stored in local GATT database.
//        sc = sl_bt_gatt_server_write_attribute_value(gattdb_Status,
//                                                    0,
//                                                    (size_t)sizeof(status),
//                                                    &status);
//        app_assert_status(sc);
//
//        // Send characteristic notification.
//        sc = sl_bt_gatt_server_notify_all(gattdb_Status,
//                                          sizeof(status),
//                                          &status);
//        app_assert_status(sc);
//        break;
//
//      case gattdb_Percentage:
//        // Read percentage characteristic stored in local GATT database.
//        sc = sl_bt_gatt_server_write_attribute_value(gattdb_Percentage,
//                                                    0,
//                                                    (size_t)sizeof(percentage),
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
//      default:
//        break;
//    }
//
//    return sc;
//  }
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

static sl_status_t notify_flag_change(uint8_t gattdb_X, uint8_t connection, uint8_t client_config_flags){
    sl_status_t sc;
    uint8_t data_recv_len;
    (void) client_config_flags;

    switch (gattdb_X) {
      case gattdb_Led_num:

//        if (client_config_flags & sl_bt_gatt_notification){

            sc = sl_bt_gatt_server_send_notification(connection,
                                                    gattdb_Led_num,
                                                    (size_t)sizeof(leds[0].led),
                                                    &leds[0].led);
            printf("%s notification enabled.\n", "Led");

            app_assert_status(sc);


//        }else{
//            printf("Led notification dis-abled.\n");
//
//        }

        break;

      case gattdb_Status:
//        if (client_config_flags & sl_bt_gatt_notification){

            sc = sl_bt_gatt_server_send_notification(connection,
                                                    gattdb_Status,
                                                    (size_t)sizeof(leds[0].status),
                                                    &leds[0].status);
            printf("Status notification enabled.\n");

            app_assert_status(sc);


//        }else{
//            printf("Status notification dis-abled.\n");
//
//        }

        break;

      case gattdb_Percentage:
//        if (client_config_flags & sl_bt_gatt_notification){

            sc = sl_bt_gatt_server_send_notification(connection,
                                                    gattdb_Percentage,
                                                    (size_t)sizeof(leds[0].percentage),
                                                    &leds[0].status);
            printf("Percentage notification enabled.\n");

            app_assert_status(sc);


//        }else{
//            printf("Percentage notification dis-abled.\n");
//
//        }

        break;
        case gattdb_Send:
  //        if (client_config_flags & sl_bt_gatt_notification){
            // For this case it doesnt matter what you send for the send notification
              sc = sl_bt_gatt_server_send_notification(connection,
                                                      gattdb_Send,
                                                      (size_t)sizeof(leds[0].percentage),
                                                      &leds[0].percentage);
              printf("Percentage notification enabled.\n");

              app_assert_status(sc);


  //        }else{
  //            printf("Percentage notification dis-abled.\n");
  //
  //        }

          break;

      default:
        break;

        (void) data_recv_len;
    }

    return sc;
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
  sl_status_t sc;

  switch (SL_BT_MSG_ID(evt->header)) {

    // Device boot event
    case sl_bt_evt_system_boot_id:
      initialised = true;

      sc = sl_bt_advertiser_create_set(&advertising_set_handle);
      app_assert_status(sc);

      sc = sl_bt_legacy_advertiser_generate_data(
        advertising_set_handle,
        sl_bt_advertiser_general_discoverable);

      app_assert_status(sc);

      printf("Advertising...\n");

      sc = sl_bt_advertiser_set_timing(
        advertising_set_handle,
        160, 160, // min & max interval (ms * 1.6)
        0, 0);    // duration, max events
      app_assert_status(sc);

      sc = sl_bt_legacy_advertiser_start(
        advertising_set_handle,
        sl_bt_legacy_advertiser_connectable);
      app_assert_status(sc);

      sl_button_enable(&BUTTON_INSTANCE_0);
      break;


    // GATT attribute value changed
    case sl_bt_evt_gatt_server_attribute_value_id:
//      update_value(evt->data.evt_gatt_server_attribute_value.attribute);

      break;


    // Notification enabled/disabled
    case sl_bt_evt_gatt_server_characteristic_status_id:
      notify_flag_change(
          evt->data.evt_gatt_server_characteristic_status.characteristic,
          evt->data.evt_gatt_server_characteristic_status.connection,
          evt->data.evt_gatt_server_characteristic_status.client_config_flags);

      break;

    // Connection opened
    case sl_bt_evt_connection_opened_id:
      printf("Connected.\n");
      printf(">>Bt_Server-side ...\n"
          ">>No. of Leds %d\n"
          ">>Input Syntax :-l%%d -p%%d -s%%d\n", MAX_LED_INDEX);


      break;


    // Connection closed
    case sl_bt_evt_connection_closed_id:
      printf("Dis-connected.\n");


      sc = sl_bt_legacy_advertiser_generate_data(
        advertising_set_handle,
        sl_bt_advertiser_general_discoverable);
      app_assert_status(sc);

      sc = sl_bt_legacy_advertiser_start(
        advertising_set_handle,
        sl_bt_legacy_advertiser_connectable);

      printf("Re-advertising...\n");
      app_assert_status(sc);
      break;

    // Default handler
    default:
      break;
  }
}

