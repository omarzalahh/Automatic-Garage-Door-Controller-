# Automatic-Garage-Door-Controller-
Assignment 5.2
Automatic Garage Door Controller 

Introduction: -
-	Finite state machine (FSM) is a major tool to implement controllers and sequencers.

-	FSM has finite inputs, outputs and number of states. At each clock edge, combinational logic computes outputs and next state as function of inputs and present state. 

-	FSM has two types: -
o	Moore FSM (outputs change with the clock edge)
o	Mealy FSM (outputs change irrespective to clock edge)

Assignment: -

You have to implement an automatic Garage Door Controller that control both up and down motors.

Block Interface: -

Specifications: -
-	The Controller has 3 inputs: -
o	Activate push button (user) trigger the Up motor when the Door down and trigger the Down motor when the Door Up 
o	UP_Max (Sensor) becomes high when the Door is completely open.   
o	DN_Max (Sensor) becomes high when the Door is completely close. 
o	Always the Door is completely close or completely open.   
o	Finite state machine is initialized to IDLE state using Asynchronous reset

States Diagram: -

IDLE state: it is the default state & reset state of the finite state machine.
Mv_Up State: it is the state to enable the up motor to open the garage door
Mv_Dn state: it is the state to enable the down motor to close the garage door
 
Requirements: -

1- Design a Moore Finite state machine that implement the above state diagram using Verilog language.
2- Write a testbench to validate your design using 50 MHz clock frequency.

