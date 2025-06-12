#include "sl_simple_button_instances.h"
#include "sl_simple_led_instances.h"
#include "em_common.h"
#include "app.h"
#include "sl_iostream_init_usart_instances.h"
#include "appLogic.h"
#include "gatt_db.h"
#include "sl_bluetooth.h"

#include "app_assert.h"

//parse definition for instruction retrival
void parse_command(const char *cmd);

//memory size buffer
#define BUFFER_SIZE 16

extern led_conf leds[MAX_LED_INDEX];

//memory buffer for vcom input
char rx_buffer[BUFFER_SIZE];
static uint8_t index = 0;

// to detemine aavailaility of data in the recive buffer
volatile bool uart_rx_flag = false;


/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
SL_WEAK void app_init(void)
{
  initialise_Default_IOStream();
//  PRINT_MESSAGE();
  sl_button_disable(&BUTTON_INSTANCE_0);
  sl_button_disable(&sl_button_btn1);
  sl_button_disable(&sl_button_btn2);

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


  if (testMessage.report_button_flag){
      testMessage.report_button_flag = 0U;

//      do {
//
//          leds[current_led].led++;
//          leds[current_led].percentage = leds[current_led].percentage+2;
//          leds[current_led].status = leds[current_led].status ^ (uint8_t)1U;
//
//      } while (0);
#ifdef PRODUCTION

      PRINT_MESSAGE();
#endif
//      switch (testMessage.ledFunction) {
//        case toggle:
//          send_notification(gattdb_Status);
//          break;
//        case increase:
//        case decrease:
//
//          // because of th logic expected on the recieve side
//          send_notification(gattdb_Percentage);
//          send_notification(gattdb_Status);
//
//          break;
//
//        default:
//          break;
//      }


      send_notification(gattdb_Led_num);
      send_notification(gattdb_Percentage);
      send_notification(gattdb_Status);

      //finally send
      sl_status_t sc;
      sc = sl_bt_gatt_server_notify_all(gattdb_Send,
                                        sizeof(leds[current_led].status),
                                        &leds[current_led].status);
      app_assert_status(sc);

      //just for the seek
      (leds[current_led].status) ? sl_led_turn_on(&LED_INSTANCE_0) : sl_led_turn_off(&LED_INSTANCE_0);

      }

  if (uart_rx_flag) {
      uart_rx_flag = false;
      char c;
      while (sl_iostream_getchar(sl_iostream_vcom_handle, &c) == SL_STATUS_OK) {
          // Process character c
          if (c == '\n' || c == '\r') {
            rx_buffer[index] = '\0';  // Null-terminate the string
            // Process the command, e.g., "L1 P80 S0"
            parse_command(rx_buffer);
            break;

            index = 0;  // Reset buffer index

          } else if (index < BUFFER_SIZE - 2) {
            rx_buffer[index] = (char)c;
            index++;

          }
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
  sl_status_t sc;
  if(initialised == 0U)
    {
      return;
    }
  if (sscanf(cmd, "-l%d -p%d -s%d", &led, &per, &sta) == 3) {
      if (led > MAX_LED_INDEX || sta > 1){

#ifdef PRODUCTION:
          printf("Invalid.\n");
#endif

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


      sc = sl_bt_gatt_server_notify_all(gattdb_Led_num, 1U, (uint8_t*)&led);
      app_assert_status(sc);

      sl_bt_gatt_server_notify_all(gattdb_Percentage, 1U, (uint8_t*)&per);
      app_assert_status(sc);

      sl_bt_gatt_server_notify_all(gattdb_Status, 1U, (uint8_t*)&sta);
      app_assert_status(sc);

      sl_bt_gatt_server_notify_all(gattdb_Send, 1U, (uint8_t*)&led);
      app_assert_status(sc);

  }else if (sscanf(cmd, "-l%d -p%d", &led, &per) == 2) {
      if (led > MAX_LED_INDEX){
#ifdef PRODUCTION
          printf("Invalid.\n");
#endif

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


      sc = sl_bt_gatt_server_notify_all(gattdb_Led_num, 1U, (uint8_t*)&led);
      app_assert_status(sc);

      sl_bt_gatt_server_notify_all(gattdb_Percentage, 1U, (uint8_t*)&per);
      app_assert_status(sc);

      sl_bt_gatt_server_notify_all(gattdb_Status, 1U, &leds[led].status);
      app_assert_status(sc);

      sl_bt_gatt_server_notify_all(gattdb_Send, 1U, (uint8_t*)&per);
      app_assert_status(sc);

  }else if (sscanf(cmd, "-l%d -s%d", &led, &sta) == 2) {
      if (led > MAX_LED_INDEX || sta > 1){
#ifdef PRODUCTION:

          printf("Invalid.\n");
#endif
          return;
      }

      leds[led].led = led;
      leds[led].status = sta;
      current_led = (uint8_t)led;


      sc = sl_bt_gatt_server_notify_all(gattdb_Led_num, 1U, (uint8_t*)&led);
      app_assert_status(sc);

      sl_bt_gatt_server_notify_all(gattdb_Percentage, 1U, &leds[led].percentage);
      app_assert_status(sc);

      sl_bt_gatt_server_notify_all(gattdb_Status, 1U, (uint8_t*)&sta);
      app_assert_status(sc);

      sl_bt_gatt_server_notify_all(gattdb_Send, 1U, (uint8_t*)&sta);
      app_assert_status(sc);

  }
}

void EUSARTx_RX_IRQHandler(void)
{
    sl_iostream_eusart_irq_handler(sl_iostream_uart_vcom_handle);
    uart_rx_flag = true; // Set flag to indicate data received
}
