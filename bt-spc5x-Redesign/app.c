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
#include "gatt_db.h"

#include "app_button_press.h"
#include "sl_simple_button.h"
#include "sl_simple_button_instances.h"

#include "sl_simple_led.h"
#include "sl_simple_led_instances.h"

#include "app.h"
#include "qpc.h"

#include "bt_SPC51_SM.h"
#include "sl_sleeptimer.h"

// The advertising set handle allocated from Bluetooth stack.
//static uint8_t advertising_set_handle = 0xff;

//bt evt holding variable
sl_bt_msg_t * event;

// Appliction SIG for blink expire
static bool blink_expired;

uint8_t blink_count;

//Event pointer
static QEvt btEvt;
/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
SL_WEAK void app_init(void)
{

  bt_SPC51_ctor((bt_SPC51 *)QMsm_bt_SPC51_p);
//  bt_SPC51_ctor((remoteSM *)QMsm_bt_SPC51_p);  // bt_SPC51_SM "constructor" invokes QMsm_ctor()

  QASM_INIT(QMsm_bt_SPC51_p, 0U, 0U); // initial transition

  /////////////////////////////////////////////////////////////////////////////
  // Put your additional application init code here!                         //
  // This is called once during start-up.                                    //
  /////////////////////////////////////////////////////////////////////////////
}

/**************************************************************************//**
 * Application Process Action.
 *****************************************************************************/
SL_WEAK void app_process_action(void)
{
  sl_status_t sc;

  if (blink_expired){
      blink_expired = false;
      sc = sl_bt_sm_configure((INITIAL_FLAG_CONFIG || (1U << 4)), sl_bt_sm_io_capability_displayonly);
      app_assert_status(sc);

      sc = sl_sleeptimer_stop_timer(&newConnectionTimer);
      app_assert_status(sc);

      sl_simple_button_enable(&sl_button_btn0);
      blink_count = 0U;
      app_log_info("New device connection window expired...\n");
      app_log_info("Still advertising...\n");
  }
  /////////////////////////////////////////////////////////////////////////////
  // Put your additional application code here!                              //
  // This is called infinitely.                                              //
  // Do not call blocking functions from here!                               //
  /////////////////////////////////////////////////////////////////////////////
}

/**************************************************************************//**
 * Bluetooth stack event handler.
 * This overrides the dummy weak implementation.
 *
 * @param[in] evt Event coming from the Bluetooth stack.
 *****************************************************************************/


void sl_bt_on_event(sl_bt_msg_t *evt)
{
//  sl_status_t sc;

  event = evt;

  //construct the event
  QEvt_ctor(&btEvt, SL_BT_MSG_ID(evt->header));

//  btEvt = QEVT_INITIALIZER(SL_BT_MSG_ID(evt->header));

  QASM_DISPATCH(QMsm_bt_SPC51_p, &btEvt, (void)0U);

    // -------------------------------
    // This event indicates the device has started and the radio is ready.
    // Do not call any stack command before receiving this boot event!
//  switch(SL_BT_MSG_ID(evt->header)){
//    case sl_bt_evt_gatt_server_characteristic_status_id:
//      notify_flag_change(
//          event->data.evt_gatt_server_characteristic_status.characteristic,
//          event->data.evt_gatt_server_characteristic_status.connection);
//
//      break;
//    case sl_bt_evt_gatt_server_attribute_value_id:
//      send_notification();
//      break;
//
//  }

}

void notify_flag_change(void){
//  (void) connection;
//  sl_status_t sc;
//  size_t data_len;
//  uint8_t data[5U];

  switch (event->data.evt_gatt_server_characteristic_status.characteristic){
    case gattdb_Led_config:
      app_log_info("Led_config notification enabled.\n");

      break;

    case gattdb_Changes:
        app_log_info("Changes notification enabled.\n");

      break;

    default:
      app_log_append_warning("Unknown characteristic: notify_flag_change\n");
      break;

  }

//   Read status characteristic stored in local GATT database.

//  sc = sl_bt_gatt_server_read_attribute_value(event->data.evt_gatt_server_characteristic_status.characteristic,
//                                              0,
//                                              (size_t)sizeof(data),
//                                              &data_len,
//                                              data);
//  app_assert_status(sc);
//  // alert the send of data
//  sc = sl_bt_gatt_server_send_notification(event->data.evt_gatt_server_characteristic_status.connection,
//                                           event->data.evt_gatt_server_characteristic_status.characteristic,
//                                           data_len,
//                                           data);
//  app_assert_status(sc);



    return;
  }




bool parse_data(void){
  sl_status_t sc;
  size_t data_len;
  uint8_t data[7U];
  // Read status characteristic stored in local GATT database.
  sc = sl_bt_gatt_server_read_attribute_value(gattdb_Led_config,
                                              0,
                                              (size_t)sizeof(data),
                                              &data_len,
                                              data);
  app_assert_status(sc);

  switch (event->data.evt_gatt_server_attribute_value.value.data[0]) {
    case 'P':

      //Update the value
      data[(uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[1])] =        //What led configuration to change
          (
              (data[(uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[1])] //Led configuration to be changed
             & 0x80)                                                                  // For percentage clear the percentage bits
          | (uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[2])         // Then fill them with the required bits for percentage
                                                                  );


      //Finally we should alert the SPC5x about the change
      app_log_info("L%u P%u\n",
                   (uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[1]),
                   (uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[2]));



      break;
    case 'S':
      //TODO think of toggling the status instead
      data[(uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[1])] =                //What led configuration to change
          ((data[(uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[1])]            //Led configuration to be changed
             & 0x7F)                                                                           // For status clear the status bits (bit 8)
          | ((uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[2])) << 7U);      // Then fill them with the required bits for status


      //Finally we should alert the SPC5x about the change
      app_log_info("L%u S%u\n",
                   (uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[1]),
                   (uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[2]));
      break;


    default:

      // copy the received configuration command into the data variable
      memcpy(data,
             event->data.evt_gatt_server_attribute_value.value.data,
             1U);

      data[1U] = '\0'; // Null-terminate

      app_log_warning("Unknown configuration: %s%u%u\n",
                      data, // the change
                      (uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[1]), // the led
                      (uint8_t)(event->data.evt_gatt_server_attribute_value.value.data[2]));// the value

      return false;
//      break;
  }

//  Update your database of the change
  sc = sl_bt_gatt_server_write_attribute_value(gattdb_Led_config,
                                               0U,
                                               data_len,
                                               data);
  app_assert_status(sc);

  sc = sl_bt_gatt_server_notify_all(gattdb_Led_config, data_len, data);
  app_assert_status(sc);

  return true;
}






//void send_notification(uint8_t gattdb_X, uint8array data){
void send_notification(void){

   sl_status_t sc;


   switch (event->data.evt_gatt_server_attribute_value.attribute) {
     case gattdb_Changes:
       if(!parse_data()){
           return;
       }
       break;
       /* no break */
       // Intentional fall through

     case gattdb_Led_config:
       // Read led values characteristic stored in local GATT database.
       sc = sl_bt_gatt_server_write_attribute_value(event->data.evt_gatt_server_attribute_value.attribute,
                                                    event->data.evt_gatt_server_attribute_value.offset,
                                                   (size_t)event->data.evt_gatt_server_attribute_value.value.len,
                                                   event->data.evt_gatt_server_attribute_value.value.data);
       app_assert_status(sc);

       // Send characteristic notification.
       sc = sl_bt_gatt_server_notify_all(event->data.evt_gatt_server_attribute_value.attribute,
                                         (size_t)event->data.evt_gatt_server_attribute_value.value.len,
                                         event->data.evt_gatt_server_attribute_value.value.data);
       app_assert_status(sc);
       break;

    default:
      app_log_warning("Unknown characteristic : send_notification\n");
       break;
   }

   return;
 }







sl_sleeptimer_timer_handle_t newConnectionTimer;


void newConnectionTimerCallback(sl_sleeptimer_timer_handle_t *handle, void *data){
  (void)data;
  (void)handle;

  if(blink_count < (uint8_t)120U){
      sl_led_toggle(&sl_led_led0);
      blink_count++;

  }else{
      blink_expired = true;

  }
}



void app_button_press_cb(uint8_t button, uint8_t duration){
//    QStateHandler state;
    sl_status_t sc;
//    state = QMsm_state(QMsm_bt_SPC51_p);

//    app_log_info("Pressed.\n");

    switch (duration) {
      case APP_BUTTON_PRESS_DURATION_SHORT:

        if(SL_SIMPLE_BUTTON_INSTANCE(button) == &sl_button_btn0){

            sc = sl_bt_sm_configure((INITIAL_FLAG_CONFIG & ~(1U << 4)), sl_bt_sm_io_capability_displayonly);
            app_assert_status(sc);


            //de
            sl_simple_button_disable(&sl_button_btn0);

            sc = sl_sleeptimer_restart_periodic_timer_ms(
                &newConnectionTimer,
                NEW_DEVICE_CONNECTABLE_DECAY,
                newConnectionTimerCallback,
                NULL,
                0,      // priority
                0       // option_flags
            );
            app_assert_status(sc);

            app_log_info("Connectable to new devices...\n");

        }

        break;


      case APP_BUTTON_PRESS_DURATION_MEDIUM:
        if(SL_SIMPLE_BUTTON_INSTANCE(button) == &sl_button_btn0){
            sc = sl_bt_sm_delete_bondings();

            app_log_info("All-bonds deleted...\n");

        }
        break;


      case APP_BUTTON_PRESS_DURATION_LONG:
        if(SL_SIMPLE_BUTTON_INSTANCE(button) == &sl_button_btn0){
            app_log_info("System reset\n");

            sl_bt_system_reset(sl_bt_system_boot_mode_normal);
        }
      break;

      default:
        break;
    }
}
