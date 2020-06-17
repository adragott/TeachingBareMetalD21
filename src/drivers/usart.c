#include "usart.h"

// hw init -- aka HARDWARE INITIALIZE
void usart_init(void)
{
    
    // reset the module by writing '1' to CTRLA.SWRST 
    // This also disables the module
    
    // select either INTERNAL or EXTERNAL clock by writing the Communication
    // Mode bit in the CTRLA register (CTRLA.CMODE)

    // choose async or sync mode in CTRLA register (CTRLA.CMODE)

    // Select pin for RX data by writing the Receive Data Pinout value to
    // (CTRLA.RXPO)

    // Select PADS for the transmitter and external clock by writing the 
    // Transmit Data Pinout bit to (CTRLA.TXPO)

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


