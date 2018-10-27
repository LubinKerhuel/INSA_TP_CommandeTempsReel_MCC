# Test MCLV Motor Control board with Simulink

The model setup dsPIC peripheral blocks and simple logic to run a DC motor and collect sensors data with the MCLV V2 board.

## Getting Started

Open the model, push the build button to generate code, compile, and flash the binary to the MCLV targeted board.
![Model_Hardware_Test_withSampleTime.slx][fig:Model_Hardware_Test_withSampleTime]

### Hardware Prerequisites

- MCLV V2 Motor Control Board
- PIM dsPIC33EP256MC506 with external Op-Amp
- Programmer (ICD4, ICD3, Real-Ice, pickit4, pickit3,...)
- Cable to send data from the MCLV board (Tx) to the PC (Rx) (like a FTDI cable)

### Software Prerequisites

- Matlab/Simulink
  - Embedded coder (Matlab Coder & Simulink Coder)
  - Fixed point toolbox
- [MPLAB device blocks for Simulink][blockset]
- [MPLAB X IDE][MPLABX] development (required to flash the binary from matlab)
- [XC16][XC16] compiler

## Test

- MCLV2 board powered and programmed
- open picgui interface (>>**picgui** at matlab prompt)
  - Select host UART port and connect at 115200 
  - push the picgui **start** button to visualize runtime curves showing potentiometer, motor position, motor speed and current measured on shunt resistors.
- rotate potentiometer to accelerate motor and change direction. (middle position is off)

math test: $\sqrt(2) + \frac{1}{2^5}$
<!--- 
comment  -->

[fig:Model_Hardware_Test_withSampleTime]: ./Fig/Model_Hardware_Test_withSampleTime.png "Simulink Model Model_Hardware_Test_withSampleTime.slx from this repository set-up the dsPIC 33EP256MC506 PIM daughter board used on a MCLV v2 microchip motor control board. Two PWM signals drives a DC motor. One QEI peripheral provides position and speed from an optical encoder. 3 ADC channels provides board potentiometer position and current measurement from two shunt resistors. Peripheral QEI and ADC output values are sent through the UART to the microchip picgui interface for visualisation and data logging."

[blockset]: https://www.microchip.com/SimulinkBlocks "Blockset for dsPIC and PIC32 (free)"
[MPLABX]: https://www.microchip.com/MPLABX "Microchip developpment environment (free)"
[XC16]: https://www.microchip.com/XC16 "Microchip Compiler (free with -O1 optimisation)"