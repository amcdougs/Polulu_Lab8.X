/*****    
 * APSC 1299    
 * Lab 9 - Pololu 3pi Robot   
 * Student file - Robotmain.c source code    
 * 
 * Date:  09-MAR-2021
 *****/


#include <xc.h>
#include <stdio.h>
#include "../Common/device_config.h"
#include "../Common/initialize.h"
#include "../Common/pin_manager.h"
#include "../Common/pwm7.h"
#include "../Common/tmr0.h"
#include "../Common/tmr2.h"
#include "../Common/uart1.h"
#include "../Common/uart2.h"
#include "pololu_robot.h"

#define TRUE    1
#define FALSE   0

#define RUN         1
#define DIAGNOSE    0

void Diagnostic_Menu(void);
char Get_Number(void);
char Get_Key(void);
void Countdown(char time);
uint16_t counts;


void main(void) 
{
    SYSTEM_Initialize();
    PIN_MANAGER_Initialize();
    UART1_Initialize();
    UART2_Initialize();
    
    
    //  Pin settings
    TRISBbits.TRISB5 = INPUT;      //  Monitors value of RUN / DIAGNOSE switch
    ANSELBbits.ANSELB5 = DIGITAL;
    
    //  Variable declarations
    char key, speed, differential;
    char i, length, any, sensor;
    char msg[9];
    unsigned int sum, battery;
    unsigned int* sensor_value;
    bool white, black;
    unsigned int turn;
    uint8_t lowerbyte[5];
    uint8_t upperbyte[5];
                    
    uint16_t sensor_data[5];
    uint8_t sensor_good; //TO-DO AIDEN ADD THE CODE FOR THIS
    
       
            

    if (PORTBbits.RB5 == DIAGNOSE)      //  Run code in diagnostic mode
    {
        Diagnostic_Menu();
        LCD_Clear();
        LCD_Position(0,0);
        LCD_Print("Diagnose", 8);
        battery = Read_Battery_Voltage();
        length = sprintf(msg, "%u mV", battery);
        LCD_Position(0,1);
        LCD_Print(msg, length);
        while(1)
        {
            key = Get_Key();
            switch (key)
            {
                case 'c':
                    LCD_Clear();
                    LCD_Position(0,0);
                    LCD_Print("Calibrate", 8);
                    LCD_Position(0,1);
                    LCD_Print("Sensors ", 8);
                    printf("\n\r");
                    white = FALSE;
                    while (!white)
                    {
                        printf("Place all five sensors on a white surface \n\r");
                        printf("Press any key to continue \n\r");
                        any = Get_Key();
                        sensor_value = Calibrate_Sensors();
                        sum = 0;
                        for (i=0; i<5; i++)
                        {
                            sum = sum + sensor_value[i];
                            printf("Sensor %u = %u \n\r", i, sensor_value[i]);
                        }
                        if (sum == 0)
                        {
                            white = TRUE;
                            printf("White calibration complete \n\r");
                        }
                    }
                    black = FALSE;
                    while (!black)
                    {
                        printf("Place all five sensors on a black surface \n\r");
                        printf("Press any key to continue \n\r");
                        any = Get_Key();
                        sensor_value = Calibrate_Sensors();
                        sum = 0;
                        for (i=0; i<5; i++)
                        {
                            sum = sum + sensor_value[i];
                            printf("Sensor %u = %u \n\r", i, sensor_value[i]);
                        }
                        if (sum == 5000)
                        {
                            black = TRUE;
                            printf("Black calibration complete \n\r");
                            printf("Calibration complete \n\r");
                            LCD_Position(0,1);
                            LCD_Print("Complete", 8);
                        }
                    }
                    break;
                case 'r':
                    LCD_Clear();
                    LCD_Position(0,0);
                    LCD_Print("  Read  ", 8);
                    LCD_Position(0,1);
                    LCD_Print("Sensors", 8);
                    printf("\n\r");

                    //  Add code to read calibrated values of all sensors
                    //  and print sensor number and values to CoolTerm/PuTTY
                        while(!UART1_is_tx_ready()) continue; //found this code in the slides lmao 
                        UART1_Write(0x87); //this gets you two bits so you gotta read the first and second 
                        for(int i = 0; i < 5; i++){
                            
                        while(!UART1_is_rx_ready()) continue;
                        lowerbyte[i] = UART1_Read(); //first 
                        while(!UART1_is_rx_ready()) continue;
                        upperbyte[i] = UART1_Read(); //second
                        
                        sensor_data[i] = upperbyte[i]*256 + lowerbyte[i]; //combine      
                    }
                        for(int i = 0; i < 5; i++){
                            printf("Sensor. %d %u\n", i, sensor_data[i]); 
                        }
                    /*
                     AIDEN TO-DO turn these values into 1 or 0s and return as array 
                     * that way its was easier to read the values and check for stuff
                     * ie sensor[3] == 1 means middle is black
                     */

                    break;
                case 'd':
                    
                    LCD_Clear();
                    LCD_Position(0,0);
                    LCD_Print("Sensor ", 7);
                    printf("\n\r");
                    printf("Enter sensor number, 0-4 \n\r");
                    sensor = Get_Key();
                    while (sensor < '0' || sensor > '4')
                    {
                        printf("\n\r");
                        printf("Invalid entry.  Enter sensor number, 0-4 \n\r");
                        sensor = Get_Key();
                    }
                    LCD_Position(7,0);
                    LCD_PrintCharacter(sensor);

                    //  Add code to get sensor value of selected sensor and
                    //  display to second line of LCD as well as CoolTerm/PuTTY
                    
                    while(!UART1_is_tx_ready()) continue; //found this code in the slides lmao 
                    UART1_Write(0x87); //this gets you two bits so you gotta read the first and second 
                    for(int i = 0; i < 5; i++){
                        while(!UART1_is_rx_ready()) continue;
                        lowerbyte[i] = UART1_Read(); //first 
                        while(!UART1_is_rx_ready()) continue;
                        upperbyte[i] = UART1_Read(); //second
                        sensor_data[i] = upperbyte[i]*256 + lowerbyte[i]; //combine 
                    }
                    
                    key = sensor - '0'; //this converts the key press to correct ascii 
                        printf("Sensor %d: %u\n", key, sensor_data[key]); 
                    

                    break;
                case 'v':
                    LCD_Clear();
                    LCD_Position(0,0);
                    LCD_Print("Battery ", 8);
                    printf("\n\r");
                    battery = Read_Battery_Voltage();
                    length = sprintf(msg, "%u mV", battery);
                    LCD_Position(0,1);
                    LCD_Print(msg, length);
                    printf("Battery voltage = %u \n\r", battery);
                    break;
                case 'F':
                    LCD_Clear();
                    LCD_Position(0,0);
                    LCD_Print("Forward ", 8);
                    printf("\n\r");
                    printf("\t Please enter the forward speed, 0 - 127 \r\n");
                    speed = Get_Number();
                    Forward(speed);
                    length = sprintf(msg, " %u ", speed);
                    LCD_Position(0,1);
                    LCD_Print(msg, length);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    break;
                case 'B':
                    LCD_Clear();
                    LCD_Position(0,0);
                    LCD_Print("Backward", 8);
                    printf("\n\r");
                    printf("\t Please enter the backward speed, 0 - 127 \r\n");
                    speed = Get_Number();
                    Backward(speed);
                    length = sprintf(msg, " %u ", speed);
                    LCD_Position(0,1);
                    LCD_Print(msg, length);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(BACKWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(BACKWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    break;
                case 'L':
                    LCD_Clear();
                    LCD_Position(0,0);
                    LCD_Print("  Left  ", 8);
                    printf("\n\r");
                    printf("\t Please enter the forward speed, 0 - 127 \r\n");
                    speed = Get_Number();
                    printf("\t Please enter the turning differential: speed + differential < 127 \r\n");
                    differential = Get_Number();
                    turn = speed + differential;
                    Left_Turn(speed, differential);
                    length = sprintf(msg, "%u %u", speed, differential);
                    LCD_Position(0,1);
                    LCD_Print(msg, length);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(turn);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    break;
                case 'R':
                    LCD_Clear();
                    LCD_Position(0,0);
                    LCD_Print(" Right  ", 8);
                    printf("\n\r");
                    printf("\t Please enter the forward speed, 0 - 127 \r\n");
                    speed = Get_Number();
                    printf("\t Please enter the turning differential: speed + differential < 127 \r\n");
                    differential = Get_Number();
                    turn = speed + differential;
                    Right_Turn(speed, differential);
                    length = sprintf(msg, "%u %u", speed, differential);
                    LCD_Position(0,1);
                    LCD_Print(msg, length);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(turn);
                    break;
                case 'S':
                    LCD_Clear();
                    LCD_Position(0,0);
                    LCD_Print("  Stop  ", 8);
                    printf("\n\r");
                    Stop();
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(0);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(0);
                    
                    break;
                case 'm':
                    LCD_Clear();
                    LCD_Position(0,0);
                    LCD_Print("Diagnose", 8);
                    battery = Read_Battery_Voltage();
                    length = sprintf(msg, "%u mV", battery);
                    LCD_Position(0,1);
                    LCD_Print(msg, length);
                    Diagnostic_Menu();
                    break;
               
                    
                    
                    
            }
        }
    }

    if (PORTBbits.RB5 == RUN)       //  Run line-following code
    {
        Diagnostic_Menu();
        LCD_Clear();
        LCD_Position(0,0);
        LCD_Print("  Run   ", 8);
        battery = Read_Battery_Voltage();
        length = sprintf(msg, "%u mV", battery);
        LCD_Position(0,1);
        LCD_Print(msg, length);
        __delay_ms(1000);       //  Delay allows user to quickly read voltage
        LCD_Position(0,0);
        LCD_Print("Auto Cal", 8);
        Auto_Calibrate();
        LCD_Position(0,1);
    	LCD_Print("  done  ", 8);
        Countdown(6);
        __delay_ms(1);
        //  Start robot moving using 3pi PD function
        //  Speed = 30; a = 1; b = 20; c = 3; d = 2
        
        
        
        bool L_Turn;
        bool R_Turn;
        
        TMR0_Initialize(T0_16_BIT & T0_POST_1_1, T0_SOURCE_INT & T0_SYNC & T0_PRE_1_1);
        
        while(1){
            L_Turn = false;
            R_Turn = false;
                    
            uint8_t giggity = Read_Calibrated_Sensors();
            switch(giggity){
                case 0b00000100: //forward
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(0xBB);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(20);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(1);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(20);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(3);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(2); 
                    break;
                    
                case 0b00010000: //left
                case 0b00001000:
                case 0b00011000:
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(0xBC);
                    Left_Turn(0,30);
                    __delay_ms(200); 
                    L_Turn = true;
                    break;
                    
                case 0b00000001:
                case 0b00000010:
                case 0b00000011:
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(0xBC); 
                    Right_Turn(0,30);
                    __delay_ms(200);
                    R_Turn = true;
                    break;
                case 0b00000000: //stop
                    if(L_Turn == true){ //HARD LEFT only if last thing was a turn
                     while(!UART1_is_tx_ready()) continue;
                    UART1_Write(0xBC);
                    Left_Turn(0,30);
                    __delay_ms(200); 
                    }else if(R_Turn == true){ //HARD RIGHT give another lil bit of turn time 
                        while(!UART1_is_tx_ready()) continue;
                        UART1_Write(0xBC); 
                       Right_Turn(0,30);
                        __delay_ms(200);
                    
                    }
                        
                    __delay_ms(150);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(0xBC);
                    break;
            }
        
        }
        
    }
}

void Diagnostic_Menu (void)
{
    printf("\r\n");
    printf("\t******************************\r\n");
    printf("\t*                            *\r\n");
    printf("\t*   APSC 1299 - Pololu 3pi   *\r\n");
    printf("\t*      Diagnostic Menu       *\r\n");
    printf("\t*                            *\r\n");
    printf("\t******************************\r\n");
    printf("\n\r");
    printf("Command Key \t Description \r\n");
    printf("  c \t\t (c)alibrate sensors \r\n");
    printf("  r \t\t (r)ead calibrated sensors \r\n");
    printf("  d \t\t (d)isplay sensor x value \r\n");
    printf("\r\n");
    printf("  v \t\t (v)oltage - Read and display battery voltage \r\n");
    printf("\r\n");
    printf("  F \t\t Wheels rotate (F)orward \r\n");
    printf("  B \t\t Wheels rotate (B)ackward \r\n");
    printf("  L \t\t (L)eft turn \r\n");
    printf("  R \t\t (R)ight turn \r\n");
    printf("  S \t\t (S)top motor \r\n");
    printf("\r\n");
    printf("  m \t\t Refresh (m)enu \r\n");
    printf("\n\r");
}

//  Reads digit characters and returns a numerical value
//  Numerical value limited to 255
char Get_Number(void)
{
    char digit = 255;
    char value = 0;
    
    while(digit != '\r') 
    {
        digit = Get_Key();
        if (digit == '\r')
            continue;
        else if (digit < 48 || digit > 57)
        {
            printf("\n\r");
            printf("Invalid input. Please redo numerical input. \r\n");
            value = 0;
            digit = 255;
        }
        else
            value = value*10 + (digit-48);
    }
    return(value);
}

//  Code execution holds until valid keypress is detected
//  Valid keypress is any alpha-numeric key and/or 'ENTER'
char Get_Key(void)
{
    char rxdata = 255;
    
    //  execution holds until valid keypress detected
    while(((rxdata < 48) || (rxdata > 122)) && (rxdata != '\r'))
    {
        if (UART2_is_rx_ready()) 
        {
            rxdata = UART2_Read();
            if (UART2_is_tx_ready())
            {
                UART2_Write(rxdata);
                if(rxdata == '\r') 
                    UART2_Write('\n'); 
            }
        }
    }
    return(rxdata);
}

//  Timed delay before the robot starts moving
//  Parameter time is delay in seconds
void Countdown(char time)
{
    char length, msg[9];
    char i = time;
    unsigned int counts;
    
    LCD_Clear();
    LCD_Print("Counting", 8);
    TMR0_Initialize(T0_16_BIT & T0_POST_1_1, T0_SOURCE_INT & T0_SYNC & T0_PRE_1_256);
    TMR0_StartTimer();
    LCD_Position(0,1);
    length = sprintf(msg, "  %u s  ", i);
    LCD_Print(msg, length);
    while (i > 0)
    {
        counts = TMR0_Read16BitTimer();
        if (counts >= 46875)
        {
            i--;
            TMR0_Write16BitTimer(0);
            switch(i)
            {
                case 0:
                    LCD_Clear();
                    LCD_Position(0,1);
                    LCD_Print("   GO   ", 8);
                    break;
                case 1:
                    LCD_Position(0,1);
                    LCD_Print("  SET   ", 8);
                    break;
                case 2:
                    LCD_Position(0,1);
                    LCD_Print(" READY  ", 8);
                    break;
                default:
                    LCD_Position(0,1);
                    length = sprintf(msg, "  %u s  ", i);
                    LCD_Print(msg, length);
            }
        }
    }
    TMR0_StopTimer();
}

/*  END FILE    */
