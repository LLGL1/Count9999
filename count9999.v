module count9999(
  input iclk,
  input irst,
  output [6:0] oSeg1,
  output [6:0] oSeg2,
  output [6:0] oSeg3,
  output [6:0] oSeg4
  );
  
wire wiDivFoCount;
wire wflag1;
wire wflag2;
wire wflag3;
wire wflag4;

wire [3:0] oCounter1;
wire [3:0] oCounter2;
wire [3:0] oCounter3;
wire [3:0] oCounter4; 

/*assign wflag2 = (oCounter1 == 4'b1001)?1'b1:1'b0; //assign condicional 
assign wflag3 = (oCounter2 == 4'b1001)?1'b1:1'b0; 
assign wflag4 = (oCounter3 == 4'b1001)?1'b1:1'b0; */
 
DivF             Module1(
.iclk (iclk),
.irst (irst),
.oSalidas ( wiDivFoCount)
);

 
Count  #(.N(4)) UNIDADES(  
.iclk (iclk),
.irst (irst),
.iCE (wiDivFoCount),
.oflag (wflag1),
.oSalidas (oCounter1)
);

Count  #(.N(4)) DECENAS(  
.iclk (iclk),
.irst (irst),
.iCE (wflag1),
.oflag (wflag2),
.oSalidas (oCounter2)
);

Count #(.N(4)) CENTENAS(  
.iclk (iclk),
.irst (irst),
.iCE (wflag2),
.oflag (wflag3),
.oSalidas (oCounter3)
);

Count #(.N(4))  MILLARES( 
.iclk (iclk),
.irst (irst),
.iCE (wflag3),
.oflag (wflag4),
.oSalidas (oCounter4)
);

BCD   #(.N(7))  Display1(
.iclk (iclk),
.irst (irst),
.iBCD (oCounter1),
.oSeg (oSeg1)
);
BCD   #(.N(7))  Display2(
.iclk (iclk),
.irst (irst),
.iBCD (oCounter2),
.oSeg (oSeg2)
);
BCD   #(.N(7))  Display3(
.iclk (iclk),
.irst (irst),
.iBCD (oCounter3),
.oSeg (oSeg3)
);
BCD   #(.N(7))  Display4(
.iclk (iclk),
.irst (irst),
.iBCD (oCounter4),
.oSeg (oSeg4)
);


endmodule 