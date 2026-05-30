module SFIFO(dout,full,empty,din,wenable,renable,clock,clear);
  // active low clear
  input [3:0]din;
  input wenable,renable,clock,clear;
  output reg [3:0]dout;
  output reg full,empty;
  
  reg [1:0]rpointer;
  reg [1:0]wpointer;
  reg [2:0]count;
  reg [3:0] mem [0:3]; // 4 memory locations with 4 bit size
  always@(posedge clock or posedge clear)
    begin
      if (clear==1)
        begin
          wpointer<=0;
          rpointer<=0;
          count<=0;
          dout<=0;
          full<=0;
          empty<=0;
        end
      else 
        begin
          if (count==4)
            begin
              full<=1;
              empty<=0;
            end
          else if (count==0)
            begin
              full<=0;
              empty<=1;
            end
          else 
            begin
              full<=0;
              empty<=0;
            end
          if (wenable==1 && full==0)
            begin
              mem[wpointer]<=din;
              wpointer<=wpointer+1;
              count<=count+1;
            end
          if (renable==1 && empty==0)
            begin
              dout<=mem[rpointer];
              rpointer<=rpointer+1;
              count<=count-1;
            end
        end
      end
endmodule
