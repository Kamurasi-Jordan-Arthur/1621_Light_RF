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
#include "sl_sleeptimer.h"
#include "gatt_db.h"

#include "app_button_press.h"
#include "sl_simple_button.h"
#include "sl_simple_button_instances.h"

#include "sl_simple_led.h"
#include "sl_simple_led_instances.h"

#include "qpc.h"
#include "remote.h"
#include "app.h"


/*Variable definitions*/
 // Led service UUID defined by Bluetooth SIG
const uint8_t led_service_UUID[16] =  {
    0xa2, 0x4e, 0x96, 0x11, 0x4f, 0xec, 0xce, 0xbd,
    0xc8, 0x40, 0x2d, 0x30, 0xac, 0x43, 0x33, 0xbb
  };

const uint8_t led_cofig_char_UUID[16] = {
  0x6c, 0x38, 0x51, 0x44, 0x3a, 0x91, 0x43, 0x92,
  0xbd, 0x40, 0x74, 0x27, 0x89, 0x56, 0xf5, 0x5f
};

 const uint8_t changes_char_UUID[16] = {
  0x6d, 0x38, 0x51, 0x44, 0x3a, 0x91, 0x43, 0x92,
  0xbd, 0x40, 0x74, 0x27, 0x89, 0x56, 0xf5, 0x5f
};
//
//static const uint8_t status_char_UUID[16] = {
//  0x6e, 0x38, 0x51, 0x44, 0x3a, 0x91, 0x43, 0x92,
//  0xbd, 0x40, 0x74, 0x27, 0x89, 0x56, 0xf5, 0x5f
//};
//
//static const uint8_t send_char_UUID[16] = {
//    0x6f, 0x38, 0x51, 0x44, 0x3a, 0x91, 0x43, 0x92,
//    0xbd, 0x40, 0x74, 0x27, 0x89, 0x56, 0xf5, 0x5f
//  };


//bt evt holding variable
sl_bt_msg_t * event;

//QEvent instance for button press events to the QMsh
buttonEvt_t buttonEvt;

//QEvent instance for bluetooth events to the QMsh
static QEvt btEvt;


//App-logic_indicators
static bool blink_expired = false;
static bool scan_timer_expired = false;
bool button_pressed = false;

//led blinking count
uint8_t blink_count;

// the application timer instance
sl_sleeptimer_timer_handle_t appTimer;

/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
SL_WEAK void app_init(void)
{

  // initialise the button event
  QEvt_ctor((QEvt *)(&buttonEvt), BUTTON_ID);

  //construct the state machine
  bt_remote_ctor((bt_remote *)QMsm_bt_remote_p);
  //bt_SPC51_ctor((remoteSM *)QMsm_bt_SPC51_p);  // bt_SPC51_SM "constructor" invokes QMsm_ctor()

  QASM_INIT(QMsm_bt_remote_p, 0U, 0U); // initial transition

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
      sc = sl_sleeptimer_stop_timer(&appTimer);
      app_assert_status(sc);
      app_log_info("blink_expired.\n");

      sc = sl_sleeptimer_restart_timer_ms(
        &appTimer,
        RUNNING_TIMEOUT,
        scanTimerCallback,
        NULL,
        0U,
        0U);
      app_assert_status(sc);

      app_log_info("Running Window extended.\n");


  }

  if(button_pressed){
      button_pressed = false;
      app_log_info("button_pressed.\n");

      QASM_DISPATCH(QMsm_bt_remote_p, &buttonEvt.super, (void)0U);

      //because we have no event Queue hence
//      if (button_pressed){
//          QASM_DISPATCH(QMsm_bt_remote_p, &buttonEvt.super, (void)0U);
//          button_pressed = false;
//      }
  }

  if(scan_timer_expired){
      app_log_info("Timer_expired.\n");
      scan_timer_expired = false;
      static const QEvt timeout = QEVT_INITIALIZER(TIMEOUT_ID);
      QASM_DISPATCH(QMsm_bt_remote_p, &timeout, (void)0U);

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

  QASM_DISPATCH(QMsm_bt_remote_p, &btEvt, (void)0U);

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
//    case sl_bt_evt_connection_closed_id:
//      bd_addr peer_address;
//      uint8_t address_type;
//      event->data.evt_connection_closed.reason;
//      SL_STATUS_BT_CTRL_REMOTE_USER_TERMINATED
//      sl_bt_connection_set_default_parameters
//      break;
//
//  }

}

uint8_t service_InAdvertisement(uint8_t *data, uint8_t len) {
  uint8_t ad_field_length;
  uint8_t ad_field_type;
  uint8_t i = 0;

  while (i < len) {
    ad_field_length = data[i];
    ad_field_type = data[i + 1];

    // Check for 128-bit UUIDs
    if (ad_field_type == 0x06 || ad_field_type == 0x07) {
      // Match 128-bit UUID (reversed format)
      if (memcmp(&data[i + 2], led_service_UUID, sizeof(led_service_UUID)) == 0) {

        return 1;
      }
    }

    i += ad_field_length + 1;
  }

  return 0;
}

/**************************************************************************//**
 * @brief
 *   Function to Print Bluetooth Address.
 * @return
 *   None
 *****************************************************************************/
void print_bluetooth_address(void)
{
  uint8_t address_type;
  bd_addr *address = read_and_cache_bluetooth_address(&address_type);

  app_log_info("Bluetooth %s address: %02X:%02X:%02X:%02X:%02X:%02X\n" APP_LOG_NL,
               address_type ? "static random" : "public device",
               address->addr[5],
               address->addr[4],
               address->addr[3],
               address->addr[2],
               address->addr[1],
               address->addr[0]);
}


/**************************************************************************//**
 * @brief
 *   Function to Read and Cache Bluetooth Address.
 * @param address_type_out [out]
 *   A pointer to the outgoing address_type. This pointer can be NULL.
 * @return
 *   Pointer to the cached Bluetooth Address
 *****************************************************************************/
bd_addr *read_and_cache_bluetooth_address(uint8_t *address_type_out)
{
  static bd_addr address;
  static uint8_t address_type;
  static bool cached = false;

  if (!cached) {
    sl_status_t sc = sl_bt_system_get_identity_address(&address, &address_type);
    app_assert_status(sc);
    cached = true;
  }

  if (address_type_out) {
    *address_type_out = address_type;
  }
  return &address;
}

void blinkTimerCallback(sl_sleeptimer_timer_handle_t *handle, void *data){
  (void)data;
  (void)handle;

  if(blink_count > (uint8_t)0U){

      if(sl_led_get_state(&sl_led_led0)){
          sl_led_toggle(&sl_led_led0);
          blink_count--;
      }else{
          sl_led_toggle(&sl_led_led0);
      }


  }else{
      blink_expired = true;

  }
}

void scanTimerCallback(sl_sleeptimer_timer_handle_t *handle, void *data){
  (void)data;
  (void)handle;

  scan_timer_expired = true;
}


//void inline button_press_reaction(void){
//  switch (Q_EVT_CAST(buttonEvt_t)->duration) {
//  case APP_BUTTON_PRESS_DURATION_SHORT:
//    if (&sl_button_btn0 == SL_SIMPLE_BUTTON_INSTANCE(Q_EVT_CAST(buttonEvt_t)->keyId)) {
//
//        me->changes[0] = (uint8_t)'S';
//        me->changes[1] = me->current_led;
//        me->changes[2] = (me->led_conf[me->current_led] & 0x80) ? 0x00U : 0x01U;
//
//        sl_bt_gatt_write_characteristic_value(me->connection_handle,
//                                              me->changes_characteristic_handle,
//                                              (size_t)sizeof(me->changes),
//                                              me->changes);
//
//        app_log_info("Status L%u, P%u \n",
//                     (uint8_t)me->current_led,
//                     (uint8_t)me->changes[2]);
//
//    }else if (&sl_button_btn1 == SL_SIMPLE_BUTTON_INSTANCE(Q_EVT_CAST(buttonEvt_t)->keyId)) {
//
//
//        if((me->led_conf[me->current_led] & 0x7F) < 0x64U){
//            me->changes[0] = (uint8_t)'P';
//            me->changes[1] = me->current_led;
//            me->changes[2] = (me->led_conf[me->current_led] & 0x7F) + 0x05U;
//
//            if(me->changes[2] > 0x64U){
//                me->changes[2] = 0x64U;
//            }
//
//            me->sc = sl_bt_gatt_write_characteristic_value(me->connection_handle,
//                                                            me->changes_characteristic_handle,
//                                                            (size_t)sizeof(me->changes),
//                                                            me->changes);
//            app_assert_status(me->sc);
//        }
//
//        app_log_info("Increase L%u, P%u \n",
//                     (uint8_t)me->current_led,
//                     (uint8_t)me->changes[2]);
//
//    } else if (&sl_button_btn2 == SL_SIMPLE_BUTTON_INSTANCE(Q_EVT_CAST(buttonEvt_t)->keyId)) {
//
//        if((me->led_conf[me->current_led] & 0x7F) > 0x00U){
//            me->changes[0] = (uint8_t)'P';
//            me->changes[1] = me->current_led;
//            me->changes[2] = (me->led_conf[me->current_led] & 0x7F) - 0x05U;
//
//            if(me->changes[2] > 0x64U){
//                me->changes[2] = 0x00U;
//            }
//
//            me->sc = sl_bt_gatt_write_characteristic_value(me->connection_handle,
//                                                            me->changes_characteristic_handle,
//                                                            (size_t)sizeof(me->changes),
//                                                            me->changes);
//            app_assert_status(me->sc);
//        }
//
//        app_log_info("Decrease L%u, P%u \n",
//                     (uint8_t)me->current_led,
//                     (uint8_t)me->changes[2]);
//
//
//    }
//
//        //blink only once
//
//        blink_count = 1U;
//
//        //turn led on
//        sl_led_toggle(&sl_led_led0);
//
//        me->sc = sl_sleeptimer_restart_periodic_timer_ms(
//            &appTimer,
//            BLINK_TIMEOUT,
//            blinkTimerCallback,
//            NULL,
//            0U,
//            0U);
//
//        app_assert_status(me->sc);
//        app_log_info("Blink Ounce");
//
//
//    break;
//
//  case APP_BUTTON_PRESS_DURATION_MEDIUM:
//    if (&sl_button_btn0 == SL_SIMPLE_BUTTON_INSTANCE(Q_EVT_CAST(buttonEvt_t)->keyId)) {
//        if (me->current_led < MAX_LED_INDEX){
//            me->current_led++;
//        }else {
//            me->current_led = 0U;
//        }
//        me->sc = sl_bt_gatt_write_characteristic_value(me->connection_handle,
//                                                        me->changes_characteristic_handle,
//                                                        (size_t)sizeof(me->changes),
//                                                        me->changes);
//        app_assert_status(me->sc);
//
//  //          Blink twice
//        blink_count = 2U;
//
//        //turn led on
//        sl_led_toggle(&sl_led_led0);
//
//        me->sc = sl_sleeptimer_restart_periodic_timer_ms(
//            &appTimer,
//            BLINK_TIMEOUT,
//            blinkTimerCallback,
//            NULL,
//            0U,
//            0U);
//        app_assert_status(me->sc);
//
//        app_log_info("Blink Twice");
//
//    }
//
//
//    break;
//
//  case APP_BUTTON_PRESS_DURATION_VERYLONG:
//    app_log_append_info("Resetting...\n");
//    sl_bt_system_reset(sl_bt_system_boot_mode_normal);
//    break;
//
//  default:
//    break;
//  }
//
//  //  app_button_press_enable();
//
//
//
//
//
//}

void app_button_press_cb(uint8_t button, uint8_t duration){

  button_pressed = true;
  buttonEvt.duration = duration;
  buttonEvt.keyId = button;

//  switch (duration) { }
////    Make sure the button press handled correctly
  app_button_press_disable();
}
