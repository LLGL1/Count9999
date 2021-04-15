module DivF(
   input iclk,
	input irst,
   output oSalidas	  
	 );
	 
reg rSalidaS_div;
reg rSalidaC_div;

//reg rSalida_div = 1'b0;
reg [25:0] rBitsC;
reg [25:0] rBitsS;

assign oSalidas = rSalidaS_div;


always @(posedge iclk)
begin
    if (!irst)
	 begin
	   rSalidaS_div= 1'd0;//reset 
	   rBitsS <= 1'd0;
	 end 
	 else
    begin
    rSalidaS_div <= rSalidaC_div;
	 rBitsS <= rBitsC;
	 end 
end 


always @ *
begin 
     if (rBitsS==26'd50_000_000)
	  begin 
	    rSalidaC_div = 1'b1; // corra a uno  
	    rBitsC=26'd0; // reset 
	  end 
	  else 
	  begin 
	    rBitsC=rBitsS + 1'b1; // sumando 
		 rSalidaC_div=  1'b0; //no hay señal 
	  end  
end 
	  
endmodule

