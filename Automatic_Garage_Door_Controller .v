module AUTO(
  input     wire      UP_MAX,
  input     wire      DOWN_MAX,
  input     wire      CLK,
  input     wire      RST,
  input     wire      Activate,
  output    reg       UP_M,
  output    reg       DOWN_M
  );

reg   [1:0]   current_state;
reg   [1:0]   next_state;

localparam   S0=2'b00,//UP=0,DOWN=0,idle
             S1=2'b01,//UP=1,Down=0
             S2=2'b11;//Up=0,Down=1

always @(posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      current_state=S0;//rest to idle
    end
  else
    begin
       current_state=next_state;     
    end
end

always @(*)
begin
  case(current_state)
    
    S0:
      begin
        UP_M=1'b0;
        DOWN_M=1'b0;
        
        if(!Activate)
          begin
            next_state=S0;
          end
        else if (Activate && UP_MAX && (~DOWN_MAX))
          begin
            next_state=S1; 
          end
          
        else if (Activate && (~UP_MAX) && DOWN_MAX)
          begin
            next_state=S2;
          end
        else
          begin
            next_state=S0;
          end
      end
    S1:
      begin
        UP_M=1'b1;
        DOWN_M=1'b0;
        if(UP_MAX)
          begin
            next_state=S0;
          end
        else
          begin
            next_state=S1;
          end
      end
    S2:
     begin
        UP_M=1'b0;
        DOWN_M=1'b1;
        if(DOWN_MAX)
          begin
            next_state=S0;
          end
        else
          begin
            next_state=S2;
          end
      end
    default:
      begin
        next_state=S0;
      end
    endcase
end
endmodule