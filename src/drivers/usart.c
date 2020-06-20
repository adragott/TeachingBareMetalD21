#include "usart.h"

#define SERCOM0 (0x42000800)
#define SERCOM1 (0x42000C00)
#define SERCOM2 (0x42001000)
#define SERCOM3 (0x42001400)
#define SERCOM4 (0x42001800)
#define SERCOM5 (0x42001C00)

#define SERCOM_CTRLA_OFF (0x00)
#define SERCOM_CTRLB_OFF (0x04)
#define SERCOM_BAUD_OFF (0x0C)
#define SERCOM_RXPL_OFF (0x0E)
#define SERCOM_INTENCLR_OFF (0x14)
#define SERCOM_INTENSET_OFF (0x16)
#define SERCOM_INTFLAG_OFF (0x18)
#define SERCOM_STATUS_OFF (0x1A)
#define SERCOM_SYNCBUSY_OFF (0x1C)
#define SERCOM_DATA_OFF (0x28)
#define SERCOM_DBGCTRL_OFF (0x30)


//CTRLA
#define SERCOM_CTRLA_SWRST_Pos (0)
#define SERCOM_CTRLA_SWRST (1 << SERCOM_CTRLA_SWRST_Pos)

#define SERCOM_CTRLA_ENABLE_Pos (1)
#define SERCOM_CTRLA_ENABLE (1 << SERCOM_CTRLA_ENABLE_Pos)

#define SERCOM_CTRLA_DORD_Pos (30)
#define SERCOM_CTRLA_DORD (1 << SERCOM_CTRLA_DORD_Pos)

#define SERCOM_CTRLA_CPOL_Pos (29)
#define SERCOM_CTRLA_CPOL (1 << SERCOM_CTRLA_CPOL_Pos)

#define SERCOM_CTRLA_CMODE_Pos (28)
#define SERCOM_CTRLA_CMODE (1 << SERCOM_CTRLA_CMODE_Pos)

#define SERCOM_CTRLA_RXPO_Pos (20)
#define SERCOM_CTRLA_RXPO (0x03 << SERCOM_RXPO_Pos)

#define SERCOM_CTRLA_MODE_Pos (2)
#define SERCOM_CTRLA_MODE (0x07 << SERCOM_MODE_Pos)

#define SERCOM_CTRLA_TXPO_Pos (16)
#define SERCOM_CTRLA_TXPO (0x03 << SERCOM_TXPO_Pos)

#define SERCOM_CTRLA_ENABLE_Pos (1)
#define SERCOM_CTRLA_ENABLE (1 << SERCOM_CTRLA_ENABLE_Pos)

#define ACTIVE_SERCOM SERCOM3

// hw init -- aka HARDWARE INITIALIZE
void usart_init(void)
{

	uint32_t* ctrla_reg = ACTIVE_SERCOM | SERCOM_CTRLA_OFF;
	uint32_t* ctrlb_reg = ACTIVE_SERCOM | SERCOM_CTRLB_OFF;
	uint16_t* baud_reg = ACTIVE_SERCOM | SERCOM_BAUD_OFF;
	uint8_t* intenclr_reg = ACTIVE_SERCOM | SERCOM_INTENCLR_OFF;
	uint8_t* intenset_reg = ACTIVE_SERCOM | SERCOM_INTENSET_OFF;
	uint16_t* status_reg = ACTIVE_SERCOM | SERCOM_STATUS_OFF;
	uint16_t* data_reg = ACTIVE_SERCOM | SERCOM_DATA_OFF;
	uint8_t* dbgctrl_reg = ACTIVE_SERCOM | SERCOM_DBGCTRL_OFF;
    // reset the module by writing '1' to CTRLA.SWRST 
    // This also disables the module
	ctrla_reg |= SERCOM_CTRLA_SWRST;
    // select either INTERNAL or EXTERNAL clock by writing the Communication
    // Mode bit in the CTRLA register (CTRLA.CMODE)
	cltra_reg |= SERCOM_CTRLA_MODE;
    // choose async or sync mode in CTRLA register (CTRLA.CMODE)
	ctrla_reg |= SERCOM_CTRLA_CMODE;
    // Select pin for RX data by writing the Receive Data Pinout value to
    // (CTRLA.RXPO)
	/* ctrla_reg |= (0x01 & SERCOM_CTRLA_RXPO); */
    // Select PADS for the transmitter and external clock by writing the 
    // Transmit Data Pinout bit to (CTRLA.TXPO)
	ctrla_reg |= (0x01 & SERCOM_CTRLA_TXPO);
    // Configure Character size field in (CTRLB.CHSIZE)

    // Set the Data Order bit in (CTRLA.DORD) to determine MSB- or LSB-first 
    // data transmission

    // Configure parity mode -- TBD

    // Configure Stop bits in the Stop Bit Mode in (CTRLB.SBMODE)

    // Enable the transmitter and receiver by writing '1' to the Receiver Enable
    // and Transmitter Enable bits in (CTRLB.RXEN and CTRLB.TXEN)

    // Enable USART by writing '1' to the CTRLA.ENABLE Register

}
// read
void usart_read(void)
{

}
// write
void usart_write(void)
{

}


