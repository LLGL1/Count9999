`timescale 1ns / 1ps
module testbench_counters();

parameter CLK_PERIOD = 2;

reg clk_tb;
reg rst_tb;

always #(CLK_PERIOD/2) clk_tb = ~clk_tb;

wire [3:0] oCounter1;
wire [3:0] oCounter2;
wire [3:0] oCounter3;
wire [3:0] oCounter4;
  
count9999 count (
.iclk			(clk_tb),
.irst			(rst_tb),
.oCounter1	(oCounter1),
.oCounter2	(oCounter2),
.oCounter3	(oCounter3),
.oCounter4	(oCounter4)
);

initial
begin
	  clk_tb = 1'b0;
	#4  rst_tb = 1'b1;
	/*    enable_tb = 1'b0;
	#10 rst_tb = 1'b0; //16.1ns
	#8  rst_tb = 1'b1;
	#8  enable_tb = 1'b1;
	#50 enable_tb = 1'b0;
	#2  enable_tb = 1'b1;
	#10 enable_tb = 1'b0;
	#2  enable_tb = 1'b1;
	#10 enable_tb = 1'b0;
	#2  enable_tb = 1'b1;*/
	#10
	#800	 
	$display("Hey, the simulation is finished!!");
	$stop;
end

endmodule