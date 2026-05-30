module sfifo_tb();
  reg wenable,renable,clock,clear;
  reg [3:0]din;
  wire full,empty;
  wire [3:0]dout;
  SFIFO uut(dout,full,empty,din,wenable,renable,clock,clear);
  
  initial begin
    clock=0;
    forever #5clock=~clock;
  end
    
  initial begin
    $monitor("Time:%0t Wenable:%b Renable:%b Full:%b Empty:%b Din=%b Dout=%b",$time,wenable,renable,full,empty,din,dout);
    // initialize inputs
    clear=1;
    #10
    clear=0;
    // write d1,d2,d3
    #10
    wenable=1;
    renable=0;
    din=4'b0001;
    #10
    din=4'b0010;
    #10
    din=4'b0011;
    #10
    // read d1
    wenable=0;
    renable=1;
    #10
    // write d2,d3
    wenable=1;
    renable=0;
    din=4'b0100;
    #10
    din=4'b0101;
    #10
    // read d2,d3,d4,d5
    wenable=0;
    renable=1;
    #10
    #10
    #10
    #10
    renable=0;
    #20;
  end
endmodule