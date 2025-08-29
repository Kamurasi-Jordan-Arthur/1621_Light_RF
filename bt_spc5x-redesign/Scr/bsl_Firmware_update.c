#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "sl_app_assert.h"
//#include "bt_SPC51_SM.h"
#include "bsl_firmware_update.h"


sl_sleeptimer_timer_handle_t updateTimer;

// TX and RX buffers for use during transmit and receive
uint8_t BSL_TX_buffer[MAX_PACKET_SIZE + 2];
//uint8_t BSL_RX_buffer[MAX_PACKET_SIZE + 2];
uint8_t BSL_RX_buffer[32U + 2U];

// A buffer to hold incoming firmware data
uint8_t app_firmware_data_buffer[MAX_PAYLOAD_DATA_SIZE ];
//uint8_t app_firmware_data_buffer[4080];




// Variable to hold the Max buffer allowed by BSL core
uint16_t BSL_MAX_BUFFER_SIZE;

//Varible declaration for holding the state of the timer during BSL
bool update_timer_expired = false;

// declaration of the bsl read type variable
uint8_t bsl_read = OTHER;

// Define the global instance of the OTA data structure
ota_data_t g_ota_data  = {0U,0U,0U,1U,1U,0U};

sl_status_t sc;

void updateTimerEx_Callback(sl_sleeptimer_timer_handle_t *handle, void *data){
  (void)data;
  (void)handle;

  update_timer_expired = true;
  //app_log_info("Update_timer_expired.\n");
}

void BSL_software_trigger(void)
{
    /* Request for SW Invoke */
  printf("%c", 0x22);
  app_log_info("BSL_software_triggered.\n");

}

/*
 * Turn on the error LED
 */
void Firmware_assert_false(void)
{
    app_log_warning("Update_Assertions.\n");

    app_assert_s(false);
}
//*****************************************************************************
//
// ! Host_BSL_Connection
// ! Need to send first to build connection with target
//
//*****************************************************************************

void Host_BSL_Connection(void)
{
    uint32_t ui32CRC;

    BSL_TX_buffer[0] = (uint8_t) PACKET_HEADER;
    BSL_TX_buffer[1] = LSB(CMD_BYTE);
    BSL_TX_buffer[2] = 0x00;
    BSL_TX_buffer[3] = CMD_CONNECTION;

    // Calculate CRC on the PAYLOAD (CMD + Data)
    ui32CRC = softwareCRC(&BSL_TX_buffer[3], CMD_BYTE);
    // Insert the CRC into the packet
    *(uint32_t *) &BSL_TX_buffer[HDR_LEN_CMD_BYTES] = ui32CRC;

    sc = sl_iostream_write(SL_IOSTREAM_STDIN , BSL_TX_buffer, HDR_LEN_CMD_BYTES + CRC_BYTES);
    app_assert_status(sc);

    bsl_read = BYTE_ACK;

    //uart_ack = UART_writeBuffer(BSL_TX_buffer, HDR_LEN_CMD_BYTES + CRC_BYTES);


//    TODO remove these unused variables bsl_err
}

//*****************************************************************************
// ! Host_BSL_GetID
// ! Need to send when build connection to get RAM BSL_RX_buffer size and other information
//
//*****************************************************************************
  void Host_BSL_GetID(void)
{
    uint32_t ui32CRC;

    BSL_TX_buffer[0] = (uint8_t) PACKET_HEADER;
    BSL_TX_buffer[1] = LSB(CMD_BYTE);
    BSL_TX_buffer[2] = 0x00;
    BSL_TX_buffer[3] = CMD_GET_ID;

    // Calculate CRC on the PAYLOAD (CMD + Data)
    ui32CRC = softwareCRC(&BSL_TX_buffer[3], CMD_BYTE);
    // Insert the CRC into the packet
    *(uint32_t *) &BSL_TX_buffer[HDR_LEN_CMD_BYTES] = ui32CRC;

    sc = sl_iostream_write(SL_IOSTREAM_STDIN , BSL_TX_buffer, HDR_LEN_CMD_BYTES + CRC_BYTES);
    app_assert_status(sc);
    bsl_read = BYTE_ACK;



    // Write the packet to the target
//    uart_ack = UART_writeBuffer(BSL_TX_buffer, HDR_LEN_CMD_BYTES + CRC_BYTES);
//    if (uart_ack != uart_noError) {
//        Firmware_assert_false();
//    }

//    UART_readBuffer(BSL_RX_buffer, HDR_LEN_CMD_BYTES + ID_BACK + CRC_BYTES);
//    BSL_MAX_BUFFER_SIZE = 0;
//    BSL_MAX_BUFFER_SIZE =
//        *(uint16_t *) &BSL_RX_buffer[HDR_LEN_CMD_BYTES + ID_BACK - 14];
}
//*****************************************************************************
// ! Unlock BSL for programming
// ! If first time, assume blank device.
// ! This will cause a mass erase and destroy previous password.
// ! When programming complete, issue BSL_readPassword to retrieve new one.
//
//*****************************************************************************
void Host_BSL_loadPassword(uint8_t *pPassword)
{

    uint32_t ui32CRC;

    BSL_TX_buffer[0] = (uint8_t) PACKET_HEADER;
    BSL_TX_buffer[1] = LSB(PASSWORD_SIZE + CMD_BYTE);
    BSL_TX_buffer[2] = 0x00;
    BSL_TX_buffer[3] = CMD_RX_PASSWORD;

    memcpy(&BSL_TX_buffer[4], pPassword, PASSWORD_SIZE);

    // Calculate CRC on the PAYLOAD (CMD + Data)
    ui32CRC = softwareCRC(&BSL_TX_buffer[3], PASSWORD_SIZE + CMD_BYTE);

    // Insert the CRC into the packet
    *(uint32_t *) &BSL_TX_buffer[HDR_LEN_CMD_BYTES + PASSWORD_SIZE] = ui32CRC;

    // Write the packet to the target
    sc = sl_iostream_write(SL_IOSTREAM_STDIN , BSL_TX_buffer ,HDR_LEN_CMD_BYTES + PASSWORD_SIZE + CRC_BYTES);
    app_assert_status(sc);

    bsl_read = BYTE_ACK;

}

void Host_BSL_BaudrateChange(uint8_t  baudrate)
{

    uint32_t ui32CRC;

    BSL_TX_buffer[0] = (uint8_t) PACKET_HEADER;
    BSL_TX_buffer[1] = LSB(CMD_BAUDRATE_SIZE);
    BSL_TX_buffer[2] = 0x00;
    BSL_TX_buffer[3] = CMD_BAUDRATE;
    BSL_TX_buffer[4] = baudrate;

    // Calculate CRC on the PAYLOAD (CMD + Data)
    ui32CRC = softwareCRC(&BSL_TX_buffer[3], CMD_BAUDRATE_SIZE);

    // Insert the CRC into the packet
    *(uint32_t *) &BSL_TX_buffer[HDR_LEN_CMD_BYTES + 1U ] = ui32CRC;

    // Write the packet to the target
    sc = sl_iostream_write(SL_IOSTREAM_STDIN , BSL_TX_buffer ,HDR_LEN_CMD_BYTES + 1U + CRC_BYTES);
    app_assert_status(sc);

    bsl_read = BYTE_ACK;

}

//*****************************************************************************
// ! Host_BSL_MassErase
// ! Need to do mess erase before write new image
//
//*****************************************************************************
void Host_BSL_MassErase(void)
{
    uint32_t ui32CRC;

    BSL_TX_buffer[0] = (uint8_t) PACKET_HEADER;
    BSL_TX_buffer[1] = LSB(CMD_BYTE);
    BSL_TX_buffer[2] = 0x00;
    BSL_TX_buffer[3] = CMD_MASS_ERASE;

    // Calculate CRC on the PAYLOAD (CMD + Data)
    ui32CRC = softwareCRC(&BSL_TX_buffer[3], CMD_BYTE);
    // Insert the CRC into the packet
    *(uint32_t *) &BSL_TX_buffer[HDR_LEN_CMD_BYTES] = ui32CRC;

    // Write the packet to the target
    sc = sl_iostream_write(SL_IOSTREAM_STDIN , BSL_TX_buffer, HDR_LEN_CMD_BYTES + CRC_BYTES);
    app_assert_status(sc);
//    uart_ack = UART_writeBuffer(BSL_TX_buffer, HDR_LEN_CMD_BYTES + CRC_BYTES);
    bsl_read = BYTE_ACK;
//    bsl_err = Host_BSL_getResponse();
}

//*****************************************************************************
//
// ! Host_BSL_writeMemory
// ! Writes memory section to target
//
//*****************************************************************************
//BSL_error_t Host_BSL_writeMemory(
//    uint32_t addr, const uint8_t *data, uint32_t len)
//{
//    BSL_error_t bsl_err = eBSL_success;
//    uart_error_t uart_ack;
//    uint16_t ui16DataLength;
//    uint16_t ui16PayloadSize;
//    uint16_t ui16PacketSize;
//    uint32_t ui32CRC;
//    uint16_t ui16BytesToWrite = len;
//    uint32_t TargetAddress    = addr;
//
//    //  pSection->checksum = softwareCRC(pSection->pMemory, pSection->mem_size);
//
//    while (ui16BytesToWrite > 0) {
//        delay_cycles(2000000);  //allow target deal with the packet send before
//
//        if (ui16BytesToWrite >= MAX_PAYLOAD_DATA_SIZE)
//            ui16DataLength = MAX_PAYLOAD_DATA_SIZE;
//        else
//            ui16DataLength = ui16BytesToWrite;
//
//        ui16BytesToWrite = ui16BytesToWrite - ui16DataLength;
//
//        // Add (1byte) command + (4 bytes)ADDRS = 5 bytes to the payload
//        ui16PayloadSize = (CMD_BYTE + ADDRS_BYTES + ui16DataLength);
//
//        BSL_TX_buffer[0] = PACKET_HEADER;
//        BSL_TX_buffer[1] =
//            LSB(ui16PayloadSize);  // typically 4 + MAX_PAYLOAD SIZE
//        BSL_TX_buffer[2] = MSB(ui16PayloadSize);
//        BSL_TX_buffer[3] = (uint8_t) CMD_PROGRAMDATA;
//        *(uint32_t *) &BSL_TX_buffer[HDR_LEN_CMD_BYTES] = TargetAddress;
//
//        // Bump up the target address by 2x the number of bytes sent for the next packet
//        TargetAddress += ui16DataLength;
//
//        // Copy the data into the BSL_RX_buffer
//        memcpy(&BSL_TX_buffer[HDR_LEN_CMD_BYTES + ADDRS_BYTES], data,
//            ui16DataLength);
//
//        data += ui16DataLength;
//
//        // Calculate CRC on the PAYLOAD
//        ui32CRC = softwareCRC(&BSL_TX_buffer[3], ui16PayloadSize);
//
//        // Calculate the packet length
//        ui16PacketSize = HDR_LEN_CMD_BYTES + ADDRS_BYTES + ui16DataLength;
//
//        // Insert the CRC into the packet at the end
//        *(uint32_t *) &BSL_TX_buffer[ui16PacketSize] = ui32CRC;
//
//        // Write the packet to the target
//        uart_ack = UART_writeBuffer(BSL_TX_buffer, ui16PacketSize + CRC_BYTES);
//        if (uart_ack != uart_noError) {
//            Firmware_assert_false();
//        }
//
//        // Check operation was complete
//        bsl_err = Host_BSL_getResponse();
//        if (bsl_err != eBSL_success) break;
//
//    }  // end while
//
//    return (bsl_err);
//}


void Host_BSL_CRCstandaloneVerification(void)
{
    uint32_t ui32CRC;

    BSL_TX_buffer[0] = (uint8_t) PACKET_HEADER;
    BSL_TX_buffer[1] = LSB((CMD_BYTE + ADDRS_BYTES + CMD_VER_BYTES));
    BSL_TX_buffer[2] = 0x00;
    BSL_TX_buffer[3] = CMD_CRCVERIFICATION;

    *(uint32_t *) &BSL_TX_buffer[HDR_LEN_CMD_BYTES] = 0x00U;

    *(uint32_t *) &BSL_TX_buffer[HDR_LEN_CMD_BYTES + ADDRS_BYTES] = g_ota_data.total_firmware_size ;

    // Calculate CRC on the PAYLOAD (CMD + Data)
    ui32CRC = softwareCRC(&BSL_TX_buffer[3], (CMD_BYTE + ADDRS_BYTES +  CMD_VER_BYTES));
    // Insert the CRC into the packet
    *(uint32_t *) &BSL_TX_buffer[HDR_LEN_CMD_BYTES + ADDRS_BYTES + CMD_VER_BYTES] = ui32CRC;

    // Write the packet to the target
    sc = sl_iostream_write(SL_IOSTREAM_STDIN , BSL_TX_buffer, HDR_LEN_CMD_BYTES + ADDRS_BYTES + CMD_VER_BYTES + CRC_BYTES);
    app_assert_status(sc);
    bsl_read = BYTE_ACK;
//    uart_ack = UART_writeBuffer(BSL_TX_buffer, HDR_LEN_CMD_BYTES + CRC_BYTES);

}




//*****************************************************************************
// ! Host_BSL_StartApp
// ! Start the new application
//
//*****************************************************************************
void Host_BSL_StartApp(void)
{
    uint32_t ui32CRC;

    BSL_TX_buffer[0] = (uint8_t) PACKET_HEADER;
    BSL_TX_buffer[1] = LSB(CMD_BYTE);
    BSL_TX_buffer[2] = 0x00;
    BSL_TX_buffer[3] = CMD_START_APP;

    // Calculate CRC on the PAYLOAD (CMD + Data)
    ui32CRC = softwareCRC(&BSL_TX_buffer[3], CMD_BYTE);
    // Insert the CRC into the packet
    *(uint32_t *) &BSL_TX_buffer[HDR_LEN_CMD_BYTES] = ui32CRC;

    // Write the packet to the target
    sc = sl_iostream_write(SL_IOSTREAM_STDIN , BSL_TX_buffer, HDR_LEN_CMD_BYTES + CRC_BYTES);
    app_assert_status(sc);
    bsl_read = BYTE_ACK;
//    uart_ack = UART_writeBuffer(BSL_TX_buffer, HDR_LEN_CMD_BYTES + CRC_BYTES);

}

//*****************************************************************************
//
// ! softwareCRC
// ! Can be used on MSP430 and non-MSP platforms
// ! This functions computes the 16-bit CRC (same as BSL on MSP target)
//
//*****************************************************************************
#define CRC32_POLY 0xEDB88320
uint32_t softwareCRC(const uint8_t *data, uint32_t length)
{
    uint32_t ii, jj, byte, crc, mask;
    ;

    crc = 0xFFFFFFFF;

    for (ii = 0; ii < length; ii++) {
        byte = data[ii];
        crc  = crc ^ byte;

        for (jj = 0; jj < 8; jj++) {
            mask = -(crc & 1);
            crc  = (crc >> 1) ^ (CRC32_POLY & mask);
        }
    }

    return crc;
}

//*****************************************************************************
//
// ! Host_BSL_getResponse
// ! For those function calls that don't return specific data.
// ! Returns errors.
//
//*****************************************************************************
//BSL_error_t Host_BSL_getResponse(void)
//{
//    BSL_error_t bsl_err = eBSL_success;
//
//    UART_readBuffer(BSL_RX_buffer, (HDR_LEN_CMD_BYTES + ACK_BYTE + CRC_BYTES));
//    //   Get ACK value
//    bsl_err = BSL_RX_buffer[HDR_LEN_CMD_BYTES + ACK_BYTE - 1];
//    //   Return ACK value
//    return (bsl_err);
//}
//
//
//
