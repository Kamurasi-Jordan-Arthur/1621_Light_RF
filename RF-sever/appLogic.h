/*
 * appLogic.h
 *
 *  Created on: May 31, 2025
 *      Author: jordan
 */

#ifndef APPLOGIC_H_
#define APPLOGIC_H_


// How long to wait for till to be broken due to inactivity
#define FIVE_MINUTES_MS (1 * 15 * 1000)


extern sl_sleeptimer_timer_handle_t connection_decay;

extern sl_sleeptimer_timer_handle_t blinkhandle;

void led_blink(uint8_t times);

void re_arm_connection_delay(void);

#endif /* APPLOGIC_H_ */
