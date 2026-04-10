/*****
    Pololu 3pi
    Slave program source file
 
    09-MAR-2021
*****/

#include "pololu_robot.h"

uint16_t sensor_data[5]; //global otherwise the array gets fucked when called
uint16_t sensor_values[5]; //array of weight*value of sensor 

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
void UpdateGlobal()
{
    uint8_t lowerbyte[5];
    uint8_t upperbyte[5];
    
    while(!UART1_is_tx_ready()) continue; 
    UART1_Write(0x87); //recives two bytes must read each
                    
    for(int i = 0; i < 5; i++){
                                          
        while(!UART1_is_rx_ready()) continue;                
        lowerbyte[i] = UART1_Read(); //first byte            
        while(!UART1_is_rx_ready()) continue;                
        upperbyte[i] = UART1_Read(); //second byte
        
        sensor_data[i] = upperbyte[i]*256 + lowerbyte[i]; //combine      
     }
    
    for(int i = 0; i < 5; i++){
        if(sensor_data[i] >= 350){ //gets individual sensors on or off with threshold
            sensGlobal[i] = 1;
        }else{//if lower than 500 then 0
            sensGlobal[i] = 0;
        } 
    } 
}
uint16_t Read_Calibrated_Sensors()
{
    uint8_t lowerbyte[5];
    uint8_t upperbyte[5];
    uint16_t weight=3000;
    
    int multiples[5] = {-2,-1,0,1,2};
                    
    while(!UART1_is_tx_ready()) continue; 
    UART1_Write(0x87); //recives two bytes must read each
                    
    for(int i = 0; i < 5; i++){
                                          
        while(!UART1_is_rx_ready()) continue;                
        lowerbyte[i] = UART1_Read(); //first byte            
        while(!UART1_is_rx_ready()) continue;                
        upperbyte[i] = UART1_Read(); //second byte
        
        sensor_data[i] = upperbyte[i]*256 + lowerbyte[i]; //combine      
     }
    
    for(int i = 0; i < 5; i++){
        
        weight=weight+(multiples[i]*sensor_data[i]);//sums 
        
        if(sensor_data[i] >= 350){ //gets individual sensors on or off with threshold
            sensGlobal[i] = 1;
        }else{//if lower than 500 then 0
            sensGlobal[i] = 0;
        } 
    } 
    
    
    return weight;//returns 0-15,000 value 7500 is centered.
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
    TMR0_Write16BitTimer((65536-((983143/speed)/8)));//calculation for timer start
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
                    UART1_Write(BACKWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(BACKWARD_RIGHT);
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

void Hard_Right(char speed, char speed2){
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(BACKWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write((char) speed+1);
    
}

void Hard_Left(char speed, char speed2){
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(FORWARD_RIGHT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(speed);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(BACKWARD_LEFT);
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write((char) speed+1);
                    
}
void edgeMethod(uint16_t sens)
{
    PID_Stop();
    Forward(20);
    __delay_ms(350);//needs to be tested but should be a few CMs
    Stop();
    UpdateGlobal();
    if(sens>3000)//far right edge
    {
        Hard_Right(30,30);
        do{
            UpdateGlobal();
        }while(!sensGlobal[2]);
        Stop();
    }
    else if(sens<3000)//far left edge
    {
        Hard_Left(30,30);
        do{
            UpdateGlobal();
        }while(!sensGlobal[2]);
        Stop();
    }
    PID_Start();
}

void PlusOrEnd()
{


}

void PID_Start(void){
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
}

void PID_Stop(void){
                    while(!UART1_is_tx_ready()) continue;
                    UART1_Write(0xBC);
}

void Gap(){
    //forward 8 cm
    PID_Stop();
    for(int i = 0; i<8; i++){
        robot_8cm(10);
        UpdateGlobal();
        if(sensGlobal[0] == 1||sensGlobal[1] == 1||sensGlobal[2] == 1||sensGlobal[3] == 1||sensGlobal[4] == 1){
            PID_Start();
            return;
        }
    }
    //turn around
    /*
    Hard_Left(60,60);
    __delay_ms(200);
    Stop(); */
    Hard_Right(60,60);
    __delay_ms(250);
    Stop();
    
    for(int i = 0; i<8; i++){
        robot_8cm(10);
        UpdateGlobal();
        if(sensGlobal[0] == 1||sensGlobal[1] == 1||sensGlobal[2] == 1||sensGlobal[3] == 1||sensGlobal[4] == 1){
            PID_Start();
            return;
        }
    }
    
    //turn around then call gap recursively (works)
    
    
    
}
/*  END FILE    */