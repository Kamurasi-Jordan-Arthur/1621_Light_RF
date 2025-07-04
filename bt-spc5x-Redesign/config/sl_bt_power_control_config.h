/***************************************************************************//**
 * @file
 * @brief Bluetooth LE Power Control configuration
 *******************************************************************************
 * # License
 * <b>Copyright 2023 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied warranty.
 * In no event will the authors be held liable for any damages arising from the
 * use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software in a
 *    product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 ******************************************************************************/

#ifndef SL_BT_POWER_CONTROL_CONFIG_H
#define SL_BT_POWER_CONTROL_CONFIG_H

// <<< Use Configuration Wizard in Context Menu >>>

// <h> Bluetooth LE Power Control Configuration

// <o SL_BT_ACTIVATE_POWER_CONTROL> Activate or deactivate the power control functionality
// <i> Default: 1
// <i> Setting value to 1 activates the power control feature, and golden RSSI range parameters shall be applied.
// <i> Setting value to 0 deactivates the power control feature. The golden RSSI range parameters are ignored.
#define SL_BT_ACTIVATE_POWER_CONTROL 1

// <o SL_BT_GOLDEN_RSSI_MIN_1M> The lower bound of RSSI golden range on 1M PHY
// <i> Default: -60
// <i> Define the lower bound of RSSI golden range which the RSSI on 1M PHY of a
// <i> Bluetooth connection is preferred to remain in. Unit: dBm
#define SL_BT_GOLDEN_RSSI_MIN_1M     -30

// <o SL_BT_GOLDEN_RSSI_MAX_1M> The upper bound of RSSI golden range on 1M PHY
// <i> Default: -40
// <i> Define the upper bound of RSSI golden range which the RSSI on 1M PHY of a
// <i> Bluetooth connection is preferred to remain in. Unit: dBm
#define SL_BT_GOLDEN_RSSI_MAX_1M     0

// <o SL_BT_GOLDEN_RSSI_MIN_2M> The lower bound of RSSI golden range on 2M PHY
// <i> Default: -60
// <i> Define the lower bound of RSSI golden range which the RSSI on 2M PHY of a
// <i> Bluetooth connection is preferred to remain in. Unit: dBm
#define SL_BT_GOLDEN_RSSI_MIN_2M     -30

// <o SL_BT_GOLDEN_RSSI_MAX_2M> The upper bound of RSSI golden range on 2M PHY
// <i> Default: -40
// <i> Define the upper bound of RSSI golden range which the RSSI on 2M PHY of a
// <i> Bluetooth connection is preferred to remain in. Unit: dBm
#define SL_BT_GOLDEN_RSSI_MAX_2M     0

// <o SL_BT_GOLDEN_RSSI_MIN_CODED_S8> The lower bound of RSSI golden range on Coded PHY with coding scheme S=8
// <i> Default: -60
// <i> Define the lower bound of RSSI golden range which the RSSI on Coded PHY (S=8) of a
// <i> Bluetooth connection is preferred to remain in. Unit: dBm
#define SL_BT_GOLDEN_RSSI_MIN_CODED_S8     -30

// <o SL_BT_GOLDEN_RSSI_MAX_CODED_S8> The upper bound of RSSI golden range on Coded PHY with coding scheme S=8
// <i> Default: -40
// <i> Define the upper bound of RSSI golden range which the RSSI on Coded PHY (S=8) of a
// <i> Bluetooth connection is preferred to remain in. Unit: dBm
#define SL_BT_GOLDEN_RSSI_MAX_CODED_S8     0

// <o SL_BT_GOLDEN_RSSI_MIN_CODED_S2> The lower bound of RSSI golden range on Coded PHY with coding scheme S=2
// <i> Default: -60
// <i> Define the lower bound of RSSI golden range which the RSSI on Coded PHY (S=2) of a
// <i> Bluetooth connection is preferred to remain in. Unit: dBm
#define SL_BT_GOLDEN_RSSI_MIN_CODED_S2     -30

// <o SL_BT_GOLDEN_RSSI_MAX_CODED_S2> The upper bound of RSSI golden range on Coded PHY with coding scheme S=2
// <i> Default: -40
// <i> Define the upper bound of RSSI golden range which the RSSI on Coded PHY (S=2) of a
// <i> Bluetooth connection is preferred to remain in. Unit: dBm
#define SL_BT_GOLDEN_RSSI_MAX_CODED_S2     0

// <o SL_BT_DEFAULT_MAX_POWER_LEVEL> The maximum transmit power level to use.
// <i> Default: SL_BT_USE_MAX_POWER_LEVEL_SUPPORTED_BY_RADIO
// <i> Define the maximum transmit power level to use instead of the maximum supported by the radio.
// <i> If the configured power level is higher what the radio supports, then the maximum
// <i> supported level shall be used. Unit: deci-dBm.
#define SL_BT_DEFAULT_MAX_POWER_LEVEL (SL_BT_USE_MAX_POWER_LEVEL_SUPPORTED_BY_RADIO)

// <o SL_BT_DEFAULT_MIN_POWER_LEVEL> The minimum transmit power level to use.
// <i> Default: SL_BT_USE_MIN_POWER_LEVEL_SUPPORTED_BY_RADIO
// <i> Define the minimum transmit power level to use instead of the minimum supported by the radio.
// <i> If the configured power level is lower what the radio supports, then the minimum
// <i> supported level shall be used. Unit: deci-dBm.
#define SL_BT_DEFAULT_MIN_POWER_LEVEL (SL_BT_USE_MIN_POWER_LEVEL_SUPPORTED_BY_RADIO)

// </h> End Bluetooth LE Power Control Configuration

// <<< end of configuration section >>>

/**
 * @brief Initialize Bluetooth LE Power Control feature.
 *
 * This function is automatically called by code generated by the Universal
 * Configurator if the feature is included in the project. The application is
 * not expected to call this function directly.
 *
 * TODO, BG-10780: This special init function is only used in the
 * controller-only build. The host stack build handles the init via the new
 * feature definition mechanism. The controller should migrate to use the same
 * mechanism and the same config instance.
 */
sl_status_t sl_bt_init_power_control();

#endif // SL_BT_POWER_CONTROL_CONFIG_H
