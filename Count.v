module Count #(parameter N=4)(
input iclk,
input irst,
input iCE,
output [N-1:0] oSalidas,
output oflag
);


reg[N-1:0] rCount_D;
reg[N-1:0] rCount_Q;
reg rflag_Q = 1'd0;
reg rflag_D = 1'd0;

assign oSalidas = rCount_Q;
assign oflag = rflag_Q; 


always @(posedge iclk)
begin
 if (!irst)
  begin
    rCount_Q <= 4'd0;
	 rflag_Q <= 1'd0; 
   end
	else if (iCE)
	  begin
	    rCount_Q <= rCount_D;
		 rflag_Q <= rflag_D; 
	  end
	  else
	  begin
	    rCount_Q <= rCount_Q; //nothing to do
		 rflag_Q <= rflag_Q; 
	  end
end

always @ *
	begin
	 if (rCount_Q == 4'd9)
	 begin
		rCount_D = 4'd0;
		rflag_D = 1'd1; 
	 end
	 else
	 begin
		rCount_D = rCount_Q + 1'd1;
		rflag_D = 1'd0; 
	 end
	end


endmodule 
/*always @(posedge iclk or negedge  irst)
	 begin
	 	if(!irst)
		begin
		
			cont0 = 0;
			cont1 = 0;
			cont2 = 0;
			cont3 = 0;
		
		end
		else
			
			if(cont0 < 4'b1001)
			
				cont0 = cont0 + 1; // contador de unidades
				
			else
			begin
			
				cont0 = 0;
				
				if(cont1 < 4'b1001)
				
					cont1 = cont1 + 1;// contador de decenas
					
				else
				begin
				
					cont1 = 0;
					
					if(cont2 < 4'b1001)
					
						cont2 = cont2 + 1;//contador de centenas
						
					else
					begin
					
						cont2 = 0;
						
							if(cont3 < 4'b1001)
					
								cont3 = cont3 + 1; //contador de miles
						
							else
							
								cont3 = 0;
					
					end
				
				end
			
			end
	 
	 end


endmodule*/