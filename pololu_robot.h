/*****
    Pololu 3pi
    Slave program header file
 
    09-MAR-2021
*****/
#include <stdint.h>

#define spd_scl 1.025//put on right wheel speed

#define READ_CALIBRATED_SENSORS 0x87
#define READ_BATTERY            0xB1
#define CALIBRATE               0xB4
#define AUTO_CALIBRATE          0xBA
#define CLEAR_LCD               0xB7
#define PRINT_LCD               0xB8
#define POSITION_LCD            0xB9
#define FORWARD_LEFT            0xC1
#define BACKWARD_LEFT           0xC2
#define FORWARD_RIGHT           0xC5
#define BACKWARD_RIGHT          0xC6
#define CENTERED                0b00000100

//  Calibrates sensors using a 3pi algorithm.
//  Returns a 2-byte value for each of the five sensors - total of 10 bytes returned.
unsigned int* Calibrate_Sensors(void);


//  Auto-calibration swivels the robot across a black line to calibrate using a 3pi algorithm
//  Calibration is complete when robot returns the 'c' character
void Auto_Calibrate(void);


//  Reads each of the sensor values and returns a 2-byte value for each of the 
//  five sensors - total of 10 bytes are returned.
uint8_t Read_Calibrated_Sensors(void);


//  Returns battery voltage in mV
unsigned int Read_Battery_Voltage(void);


//  Print a string of up to 8-characters to the LCD screen
//  First byte transmitted is for the length of the string.
//  Following bytes are for the actual string
void LCD_Print(char *str, char length);


//  Print a single character to the LCD screen
void LCD_PrintCharacter(char byte);


//  Clear LCD screen
void LCD_Clear(void);


//  Set the cursor position on the LCD screen by sending two bytes after
//  the command code - x position (column number, 0-7), then y position (row
//  number, 0 or 1.
void LCD_Position(char x, char y);
//  Uses TMR0 and Forward to set the robot to go 8 at any speed
//  30-110 should be the only values inputed! 20 may work
void robot_8cm(char speed);

//  Both wheels are set to spin forwards at a speed, 0 (stop) to 127 (full speed)
void Forward(char speed);


//  Both wheels are set to spin backwards at a speed, 0 (stop) to 127 (full speed)
void Backward(char speed);


//  Wheels move at different speeds to turn the robot
//  Right wheel turns at speed + differential - limit speed + differential < 127
//  Left wheel turns at speed - differential
void Left_Turn(char speed, char differential);


//  Wheels move at different speeds to turn the robot
//  Left wheel turns at speed + differential - limit speed + differential < 127
//  Right wheel turns at speed - differential
void Right_Turn(char speed, char differential);


//  Both wheels move at speed zero
void Stop (void);

void Turn_around(char speed);

void Hard_Left(char speed, char speed2);

void Hard_Right(char speed, char speed2);

void PID_Init(void);

void PID_Start(void);

bool problemYN(uint8_t giggity);


/*  END FILE    */
