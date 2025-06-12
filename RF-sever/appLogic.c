#include "sl_simple_button_instances.h"
#include "sl_simple_led_instances.h"
#include "em_common.h"
#include "app.h"
#include "sl_iostream_init_eusart_instances.h"
#include "sl_iostream_eusart.h"
#include "appLogic.h"
#include "gatt_db.h"
#include "sl_bluetooth.h"
#include "app_log.h"
#include "sl_sleeptimer.h"
#include "app_assert.h"
#include "app_button_press.h"

//parse definition for instruction retrival
void parse_command(const char *cmd);

//this is the call back for a noticed decay time exceed
void connection_decay_callback(sl_sleeptimer_timer_handle_t *handle, void *data);

//memory size buffer
#define BUFFER_SIZE 16


extern led_conf leds[MAX_LED_INDEX];

//memory buffer for vcom input
char rx_buffer[BUFFER_SIZE];

// connection decay timer instance
sl_sleeptimer_timer_handle_t connection_decay;

//blink timer instance
sl_sleeptimer_timer_handle_t blinkhandle;

// state check for decay functionality
volatile bool disconnect = false;

volatile bool endBlink = false;



/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
SL_WEAK void app_init(void)
{
  initialise_Default_IOStream();

//  PRINT_MESSAGE();
  //Disable the app buttons for now
  sl_button_disable(&BUTTON_INSTANCE_0);
  sl_button_disable(&sl_button_btn1);
  sl_button_disable(&sl_button_btn2);

  //Enable the app button press functionality
  app_button_press_enable();
  //diable vcom revice requirement on power
  sl_iostream_set_default(sl_iostream_vcom_handle);
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

  if (testMessage.report_button_flag){
      testMessage.report_button_flag = false;

      switch (conn_state) {
        case sleeping:
          switch (testMessage.duration) {
//            case SHORT:
//              break;

            default:
              app_log_info("Waking...\n");

              conn_state = advertising;
              advertise_entry();

    //          sl_led_turn_on(&sl_led_led0);
              break;
          }

          break;

        case running:


          send_notification(gattdb_Led_num);
          send_notification(gattdb_Percentage);
          send_notification(gattdb_Status);
          send_notification(gattdb_Send);
          PRINT_MESSAGE();


          switch (testMessage.duration) {
            case MEDIUM:
              led_blink(2U);

              break;
            default:
              led_blink(1U);
              break;
          }

          break;

        default:

          break;
        }
      }

  //logic for closing the connection on decay
  if(disconnect){
      disconnect = false;
      do{
      sc = sl_bt_connection_close(current_connection);
      app_assert_status(sc);
      app_log_info("Entering Sleep.\n");
      }while(0);
  }

  // blink end
  if(endBlink){

      endBlink = false;
      sc = sl_sleeptimer_stop_timer(&blinkhandle);
      app_assert_status(sc);
//      app_log_info("Led Changed.\n");
  }

    char c;
    static uint8_t index = 0U;


  // Check if a character was received
    if (sl_iostream_getchar(sl_iostream_vcom_handle, &c) == SL_STATUS_OK) {

        if (c == '\n' || c == '\r') {
          rx_buffer[index] = '\0';  // Null-terminate the string
          // Process the command, e.g., "L1 P80 S0"
          parse_command(rx_buffer);
//          //re-arm the timer
//          re_arm_connection_delay();

          index = 0;  // Reset buffer index

        } else if (index < BUFFER_SIZE - 2) {
          rx_buffer[index] = (char)c;
          index++;

        }

    }



  /////////////////////////////////////////////////////////////////////////////
  // Put your additional application code here!                              //
  // This is called infinitely.                                              //
  // Do not call blocking functions from here!                               //
  /////////////////////////////////////////////////////////////////////////////
}


void parse_command(const char *cmd)
{
  int led, per, sta;
//  sl_status_t sc;
  if(initialised == 0U)
    {
      return;
    }
  if (sscanf(cmd, "-l%d -p%d -s%d", &led, &per, &sta) == 3) {
      if (led >= MAX_LED_INDEX || sta > 1){

          app_log_info("Invalid.\n");

          return;
      }

      if ((int)per > (int)100){
          per = (int)100;

      }else if((int)per < (int)0){
          per = (int)0;

      }

      leds[led].led = led;
      leds[led].percentage = per;
      leds[led].status = sta;
      current_led = (uint8_t)led;

      send_notification(gattdb_Led_num);
      send_notification(gattdb_Percentage);
      send_notification(gattdb_Status);
      send_notification(gattdb_Send);

//      sc = sl_bt_gatt_server_notify_all(gattdb_Led_num, 1U, (uint8_t*)&led);
//      app_assert_status(sc);
//
//      sl_bt_gatt_server_notify_all(gattdb_Percentage, 1U, (uint8_t*)&per);
//      app_assert_status(sc);
//
//      sl_bt_gatt_server_notify_all(gattdb_Status, 1U, (uint8_t*)&sta);
//      app_assert_status(sc);
//
//      sl_bt_gatt_server_notify_all(gattdb_Send, 1U, (uint8_t*)&led);
//      app_assert_status(sc);

  }else if (sscanf(cmd, "-l%d -p%d", &led, &per) == 2) {
      if (led >= MAX_LED_INDEX){
          app_log_info("Invalid.\n");

          return;
      }

      if ((int)per > (int)100){
          per = (int)100;

      }else if((int)per < (int)0){
          per = (int)0;

      }
      leds[led].led = led;
      leds[led].percentage = per;
      current_led = (uint8_t)led;

      send_notification(gattdb_Led_num);
      send_notification(gattdb_Percentage);
      send_notification(gattdb_Status);
      send_notification(gattdb_Send);

//      sc = sl_bt_gatt_server_notify_all(gattdb_Led_num, 1U, (uint8_t*)&led);
//      app_assert_status(sc);
//
//      sl_bt_gatt_server_notify_all(gattdb_Percentage, 1U, (uint8_t*)&per);
//      app_assert_status(sc);
//
//      sl_bt_gatt_server_notify_all(gattdb_Status, 1U, &leds[led].status);
//      app_assert_status(sc);
//
//      sl_bt_gatt_server_notify_all(gattdb_Send, 1U, (uint8_t*)&per);
//      app_assert_status(sc);

  }else if (sscanf(cmd, "-l%d -s%d", &led, &sta) == 2) {
      if (led >= MAX_LED_INDEX || sta > 1){

          app_log_info("Invalid.\n");
          return;
      }

      leds[led].led = led;
      leds[led].status = sta;
      current_led = (uint8_t)led;

      send_notification(gattdb_Led_num);
      send_notification(gattdb_Percentage);
      send_notification(gattdb_Status);
      send_notification(gattdb_Send);
//      sc = sl_bt_gatt_server_notify_all(gattdb_Led_num, 1U, (uint8_t*)&led);
//      app_assert_status(sc);
//
//      sl_bt_gatt_server_notify_all(gattdb_Percentage, 1U, &leds[led].percentage);
//      app_assert_status(sc);
//
//      sl_bt_gatt_server_notify_all(gattdb_Status, 1U, (uint8_t*)&sta);
//      app_assert_status(sc);
//
//      sl_bt_gatt_server_notify_all(gattdb_Send, 1U, (uint8_t*)&sta);
//      app_assert_status(sc);

  }
  PRINT_MESSAGE();
}

// Not entirely usefull
//void EUART0_RX_IRQHandler(void)
//{
//    sl_iostream_eusart_irq_handler(sl_iostream_uart_vcom_handle);
//    uart_rx_flag = true; // Set flag to indicate data received
//}


// Not entirely usefull
//bool app_is_ok_to_sleep(void)
//{
//  if(uart_rx_flag){
//      return false;
//  }
//  return true;
//}

// Timer callback function
void connection_decay_callback(sl_sleeptimer_timer_handle_t *handle, void *data){
  (void)data;
  (void)handle;

  if(conn_state == running){

      app_log_info("Connection Life decay.\n\n");
      disconnect = true;
      conn_state = sleeping;


  }
//     Timer expired: handle timeout event here
}

// function call for each time the an interrupt happens of the Usart recieve occurs
void re_arm_connection_delay(void)
{
    sl_status_t sc;
    app_log_info("Re_arming_connection_delay\n\n");

    sc = sl_sleeptimer_restart_timer_ms(
        &connection_decay,
        FIVE_MINUTES_MS,
        connection_decay_callback,
        NULL,
        0,      // priority
        0       // option_flags
    );
    app_assert_status(sc);
}



void led_bink_callback(sl_sleeptimer_timer_handle_t *handle, void *data){
  (void)data;
  (void)handle;
  switch (conn_state) {

    case running:

        switch (testMessage.duration) {

          //led-change blink
          case MEDIUM:{
            static uint8_t blinkcount = 2U;
            sl_led_toggle(&sl_led_led0);

            if(!sl_led_get_state(&sl_led_led0)){
                blinkcount--;
            }

            if (!blinkcount){
              endBlink = true;
              blinkcount = 2U;
            }

            break;
          }

            //single blink
          default:
            sl_led_toggle(&sl_led_led0);
            endBlink = true;
            break;

        }
        break;



    case advertising:
      sl_led_toggle(&sl_led_led0);

      break;

    default:
      break;
  }
}


void led_blink(uint8_t times){
  sl_status_t sc;
  (void) times;
  switch (conn_state) {
        case running:
          //Message logging
          switch (testMessage.duration) {
            case MEDIUM:
              app_log_info("Blinking twice\n");

              break;
            default:
              app_log_info("Blinking Once\n");
              break;
          }

          sl_led_toggle(&LED_INSTANCE_0);
          sc = sl_sleeptimer_restart_periodic_timer_ms(
              &blinkhandle,
              125U,
              led_bink_callback,
              NULL,
              0U,
              0U);

          app_assert_status(sc);
          break;

        case advertising:
          app_log_info("Advertisement blink\n");
          sl_led_toggle(&LED_INSTANCE_0);
          sc = sl_sleeptimer_restart_periodic_timer_ms(
              &blinkhandle,
              250U,
              led_bink_callback,
              NULL,
              0U,
              0U);
          app_assert_status(sc);

          break;

        default:
          break;
      }

      app_assert_status(sc);
}
