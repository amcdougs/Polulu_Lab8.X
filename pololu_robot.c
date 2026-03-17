/*****
    Pololu 3pi
    Slave program source file
 
    09-MAR-2021
*****/

#include "pololu_robot.h"
#include <stdio.h>
#include "../Common/uart1.h"


unsigned int* Calibrate_Sensors(void)
{
    unsigned char lbyte[5], ubyte[5], i;
    static unsigned int values[5];
    
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(CALIBRATE);
    for (i=0; i<5; i++)
    {
        while (!UART1_is_rx_ready()) continue;
        lbyte[i] = UART1_Read();
        while (!UART1_is_rx_ready()) continue;
        ubyte[i] = UART1_Read();
        values[i] = ubyte[i]*256 + lbyte[i];
    }
    return values;
}

void Auto_Calibrate(void)
{
    bool center = 0;
    char lbyte, ubyte;
    unsigned int position;
    
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(AUTO_CALIBRATE);
    while(!UART1_is_rx_ready()) continue;
    while(UART1_Read() != 'c')              //  Wait until Auto Calibrate signals that
    {                                       //  calibration is done, with 'c' character
        while(!UART1_is_rx_ready()) continue;
    }  
}

unsigned int* Read_Calibrated_Sensors(void)
{
    // >u<
    while(!UART1_is_tx_ready()) continue;//checks uart is clear to send command
    UART1_Write(READ_CALIBRATED_SENSORS); 
    
    unsigned char lbyte[5], ubyte[5], i;
    static unsigned int values[5];
    
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(READ_CALIBRATED_SENSORS);
    for (i=0; i<5; i++)//reads each sensor
    {
        while (!UART1_is_rx_ready()) continue;
        lbyte[i] = UART1_Read();
        while (!UART1_is_rx_ready()) continue;
        ubyte[i] = UART1_Read();
        values[i] = ubyte[i]*256 + lbyte[i];
    }
    return values; 
}

unsigned int Read_Battery_Voltage(void)
{
    unsigned char lbyte, ubyte;
       
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(READ_BATTERY);
    while (!UART1_is_rx_ready()) continue;
    lbyte = UART1_Read();
    while (!UART1_is_rx_ready()) continue;
    ubyte = UART1_Read();
    return (unsigned int)(ubyte*256 + lbyte);
}

void LCD_Clear(void)
{
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(CLEAR_LCD);
}

void LCD_Print(char *str, char length)
{
    char i=0;
    
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(PRINT_LCD);
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(length);
    while (i<length)
    {
        if(UART1_is_tx_ready())
        {
            UART1_Write(str[i]);
            i++;
        }
    }
}

void LCD_PrintCharacter(char byte)
{
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(PRINT_LCD);
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(1);
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(byte);
}

void LCD_Position(char x, char y)
{
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(POSITION_LCD);
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(x);
    while(!UART1_is_tx_ready()) continue;
    UART1_Write(y);
}

void Forward(char speed)
{
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
}

void Backward(char speed)
{
    //  Add code
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
}

void Left_Turn(char speed, char differential)
{
    //  Add code
}

void Right_Turn(char speed, char differential)
{
    //  Add code
}

void Stop (void)
{
    Forward(0);
}
/*  END FILE    */