`timescale 1us/1ps
module AUTO_TB;

reg       Activate_TB;
reg       UP_MAX_TB,DOWN_MAX_TB;
reg       CLK_TB,RST_TB;
wire      UP_M_TB,DOWN_M_TB;



always #50 CLK_TB = !CLK_TB;

initial
begin

//Initial Values

Activate_TB=1'b0;
UP_MAX_TB=1'b0;
DOWN_MAX_TB=1'b0;
CLK_TB=1'b0;
RST_TB=1'b1;

#1
RST_TB=1'b0;
#2
RST_TB=1'b1;

#2
Activate_TB=1'b0;
UP_MAX_TB=1'b0;
DOWN_MAX_TB=1'b0;

#97

$display("Test Case 1");

if(UP_M_TB==1'b0 && DOWN_M_TB==1'b0)
$display("IDLE state test passed");
else
$display("IDLE state test failed");

#5

Activate_TB=1'b1;
UP_MAX_TB=1'b0;
DOWN_MAX_TB=1'b1;

#100
$display("Test Case 2");

if(DOWN_M_TB==1'b1 && UP_M_TB==1'b0)
$display("MOVE TO DOWN  state test passed");
else
$display("MOVE TO DOWN state test failed");

#5

Activate_TB=1'b0;
UP_MAX_TB=1'b1;
DOWN_MAX_TB=1'b0;

#100

$display("Test Case 3");

if(DOWN_M_TB==1'b1 && UP_M_TB==1'b0)
$display(" stay in the same state test passed");
else
$display("Stay in the same state test failed");

#5
Activate_TB=1'b1;
UP_MAX_TB=1'b0;
DOWN_MAX_TB=1'b1;

#100

$display("Test Case 4");

if(UP_M_TB==1'b0 && DOWN_M_TB==1'b0)
$display("MOVE FROM DOWN STATE TO IDLE state test passed");
else
$display("Move from down state to idle state test failed");

#5

Activate_TB=1'b1;
UP_MAX_TB=1'b1;
DOWN_MAX_TB=1'b0;

#100

$display("Test Case 5");

if(UP_M_TB==1'b1 && DOWN_M_TB==1'b0)
$display("Transition from  IDLE STATE TO UP state test passed");
else
$display("Transition from IDLE state to UP state test failed");
#5

Activate_TB=1'b0;
UP_MAX_TB=1'b0;
DOWN_MAX_TB=1'b1;

#100

$display("Test Case 6");

if(UP_M_TB==1'b1 && DOWN_M_TB==1'b0)
$display("Stay in UP state test passed");
else
$display("Stay in  UP state test failed");

#5

Activate_TB=1'b0;
UP_MAX_TB=1'b1;
DOWN_MAX_TB=1'b0;

#100

$display("Test Case 7");

if(UP_M_TB==1'b0 && DOWN_M_TB==1'b0)
$display("Move from UP state to IDLE test passed");
else
$display("Move from  UP state to IDLE test failed");

$stop;

end
AUTO DUT(
.Activate(Activate_TB),
.UP_MAX(UP_MAX_TB),
.DOWN_MAX(DOWN_MAX_TB),
.CLK(CLK_TB),
.RST(RST_TB),
.UP_M(UP_M_TB),
.DOWN_M(DOWN_M_TB)
);

endmodule

