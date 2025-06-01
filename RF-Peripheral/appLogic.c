#include "sl_simple_button_instances.h"
#include "app.h"
#include "sl_iostream_init_eusart_instances.h"
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



/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
SL_WEAK void app_init(void)
{
  initialise_Default_IOStream();
//  PRINT_MESSAGE();
  sl_button_disable(&BUTTON_INSTANCE_0);

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
//  if (report_button_flag){
//      report_button_flag = false;
//
//      do {
//
//         led++;
//         percentage--;
//         status = status ^ (uint8_t)1U;
//
//      } while (0);
//
//      PRINT_MESSAGE();
//
//
//      send_notification(gattdb_Led_num);
//      send_notification(gattdb_Percentage);
//      send_notification(gattdb_Status);
//
//      //just for the seek
//      (status) ? sl_led_turn_on(&LED_INSTANCE_0) : sl_led_turn_off(&LED_INSTANCE_0);
//
//      }

  char c;

  // Check if a character was received
  if (sl_iostream_getchar(sl_iostream_vcom_handle, &c) == SL_STATUS_OK) {

      if (c == '\n' || c == '\r') {
        rx_buffer[index] = '\0';  // Null-terminate the string
        // Process the command, e.g., "L1 P80 S0"
        parse_command(rx_buffer);

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
  sl_status_t sc;
  if(initialised == 0U)
    {
      return;
    }
  if (sscanf(cmd, "-l%d -p%d -s%d", &led, &per, &sta) == 3) {
      if (led > MAX_LED_INDEX || sta > 1){
          printf("Invalid.\n");
          return;
      }
      leds[led].led = led;
      leds[led].percentage = per;
      leds[led].status = sta;


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
          printf("Invalid Input.\n");
          return;
      }

      leds[led].led = led;
      leds[led].percentage = per;


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
          printf("Invalid. \n");
          return;
      }
      leds[led].led = led;
      leds[led].status = sta;

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

