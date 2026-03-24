/*****
    Pololu 3pi
    Slave program source file
 
    09-MAR-2021
*****/

#include "pololu_robot.h"
#include <stdio.h>
#include "../Common/uart1.h"
#include "../Common/tmr0.h"

uint16_t sensor_data[5]; //global otherwise the array gets fucked when called
uint16_t sensor_values[5]; //global binary version of sensor data for easier reading 

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

uint8_t Read_Calibrated_Sensors(void)
{
    uint8_t lowerbyte[5];
    uint8_t upperbyte[5];
    uint8_t sensor_bits;
                    
    while(!UART1_is_tx_ready()) continue; 
    UART1_Write(0x87); //recives two bytes must read each
                    
    for(int i = 0; i < 5; i++){
                                          
        while(!UART1_is_rx_ready()) continue;                
        lowerbyte[i] = UART1_Read(); //first byte            
        while(!UART1_is_rx_ready()) continue;                
        upperbyte[i] = UART1_Read(); //second byte
        
        sensor_data[i] = upperbyte[i]*256 + lowerbyte[i]; //combine      
     }
    //by turning into 1 or 0 the array will be easier to use later on IMO-Aiden
    for(int i = 0; i < 5; i++){
        if(sensor_data[i] >= 500){ //if value greater than 500 make 1
            sensor_values[i] = 1;
        }else{
            sensor_values[i] = 0; //if lower than 500 then 0
        } 
    }
        
    
    sensor_bits = (sensor_values[0] << 4 | sensor_values[1] << 3 | sensor_values[2] << 2
           | sensor_values[3] << 1 | sensor_values[4]);
    return sensor_bits; //now returns it as a 8 bit. first 5 bits used
    //00100
    //case 0b0000 0100 middle
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
void robot_8cm (char speed)
{
    //set tmr to 0 and start it with a prescale of 128
    TMR0_StopTimer();
    TMR0_Initialize(T0_16_BIT & T0_POST_1_1, T0_SOURCE_INT & T0_SYNC & T0_PRE_1_128);
    TMR0_Write16BitTimer((65536-(983143/speed)));//calculation for timer start
    TMR0IF=0;
    TMR0_StartTimer();
    Forward(speed);//go forward
    
    while(TMR0IF==0) continue;//stay till flag
    Stop();//stop after flag
    TMR0_StopTimer();
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
                    UART1_Write((char) speed+1);
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
                    UART1_Write((char) speed+1);
}

void Left_Turn(char speed, char differential)
{
    //  Add code
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write((char) speed+1+differential);
}

void Right_Turn(char speed, char differential)
{
    //  Add code
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed+differential);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write((char) speed+1);
}

void Stop (void)
{
    Forward(0);
}

void Turn_around(char speed){
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(BACKWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write((char) speed+1);
                    
    //makes each wheel the same speed in opposite directions so it spins in place 
}
/*  END FILE    */