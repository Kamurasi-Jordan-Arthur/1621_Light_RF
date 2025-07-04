//$file${SMs::./Inc::bt_SPC51_SM.h} vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
//
// Model: bt_SPC5x_SM.qm
// File:  ${SMs::./Inc::bt_SPC51_SM.h}
//
// This code has been generated by QM 7.0.1 <www.state-machine.com/qm>.
// DO NOT EDIT THIS FILE MANUALLY. All your changes will be lost.
//
// Copyright (c) 2005 Quantum Leaps, LLC. All rights reserved.
//
//                 ____________________________________
//                /                                   /
//               /    GGGGGGG    PPPPPPPP   LL       /
//              /   GG     GG   PP     PP  LL       /
//             /   GG          PP     PP  LL       /
//            /   GG   GGGGG  PPPPPPPP   LL       /
//           /   GG      GG  PP         LL       /
//          /     GGGGGGG   PP         LLLLLLL  /
//         /___________________________________/
//
// SPDX-License-Identifier: GPL-3.0-or-later
//
// This generated code is open-source software licensed under the GNU
// General Public License (GPL) as published by the Free Software Foundation
// (see <https://www.gnu.org/licenses>).
//
// NOTE:
// The GPL does NOT permit the incorporation of this code into proprietary
// programs. Please contact Quantum Leaps for commercial licensing options,
// which expressly supersede the GPL and are designed explicitly for
// closed-source distribution.
//
// Quantum Leaps contact information:
// <www.state-machine.com/licensing>
// <info@state-machine.com>
//
//$endhead${SMs::./Inc::bt_SPC51_SM.h} ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#ifndef remoteSM_H_
#define remoteSM_H_

//extern QHsm * const the_oven;

//$declare(SMs::INITIAL_FLAG_CONFIG)
//$declare${SMs} vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

//${SMs::bt_SPC51} ...........................................................
typedef struct {
// protected:
    QMsm super;

// private:
    sl_status_t sc;
    uint8_t advertising_set_handle;
    bd_addr address;
    uint8_t address_type;
    uint8_t system_id[8];
} bt_SPC51;

// public:
void bt_SPC51_ctor(bt_SPC51 * const me);

// protected:
QState bt_SPC51_initial(bt_SPC51 * const me, void const * const par);
QState bt_SPC51_INITIALIZING  (bt_SPC51 * const me, QEvt const * const e);
extern QMState const bt_SPC51_INITIALIZING_s;
QState bt_SPC51_OPERRATIONAL  (bt_SPC51 * const me, QEvt const * const e);
QState bt_SPC51_OPERRATIONAL_i(bt_SPC51 * const me);
extern QMState const bt_SPC51_OPERRATIONAL_s;
QState bt_SPC51_ADVERTISING  (bt_SPC51 * const me, QEvt const * const e);
QState bt_SPC51_ADVERTISING_e(bt_SPC51 * const me);
extern QMState const bt_SPC51_ADVERTISING_s;
QState bt_SPC51_MANAGING_CONNECTION  (bt_SPC51 * const me, QEvt const * const e);
QState bt_SPC51_MANAGING_CONNECTION_e(bt_SPC51 * const me);
extern QMState const bt_SPC51_MANAGING_CONNECTION_s;

//${SMs::bt_SPC51_inst} ......................................................
extern bt_SPC51 bt_SPC51_inst;

//${SMs::INITIAL_FLAG_CONFIG} ................................................
#define INITIAL_FLAG_CONFIG 0b00101010

//${SMs::CONN_INTERVAL_MIN} ..................................................
#define CONN_INTERVAL_MIN 160U

//${SMs::CONN_INTERVAL_MAX} ..................................................
#define CONN_INTERVAL_MAX 160U

//${SMs::CONN_RESPONDER_LATENCY} .............................................
#define CONN_RESPONDER_LATENCY 5U

//${SMs::CONN_TIMEOUT} .......................................................
#define CONN_TIMEOUT 450U

//${SMs::CONN_MIN_CE_LENGTH} .................................................
#define CONN_MIN_CE_LENGTH 0U

//${SMs::CONN_MAX_CE_LENGTH} .................................................
#define CONN_MAX_CE_LENGTH 0xffff
//$enddecl${SMs} ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

//$declare(SMs::bt_SPC51)
//$declare(SMs::remoteSM_ctor)

extern QMsm * const QMsm_bt_SPC51_p; // opaque pointer to the remoteSM HSM

#endif // HISTORY_H_
