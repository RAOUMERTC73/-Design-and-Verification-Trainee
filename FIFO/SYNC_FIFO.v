module SYNC_FIFO (
    input [7:0] data, 
    input clk, reset, rd, wr,
    output empty, full, 
    output reg [3:0]count,
    output reg [7:0] data_out);

    reg [7:0] fifo_ram [0:7];
    reg [2:0] read_ptr, write_ptr;
    assign empty= (count==0);
    assign full =(count==8);
    
    always @(posedge clk) 
        begin
            if (wr && ! full)
                fifo_ram [write_ptr] <= data;
            else if (wr && rd)
                fifo_ram [write_ptr] <= data;
            end

//Read and Write Clock
    always @ (posedge clk) 
        begin
            if (rd && !empty)
                data_out <= fifo_ram [read_ptr];
            else if (rd && wr)
                data_out <= fifo_ram [read_ptr];
        end

//pointer block 
    always @(posedge clk) 
    begin
        if (reset) begin
            write_ptr <= 0;
            read_ptr <= 0;
        end 
        else begin
            write_ptr <= ((wr && ! full) || (wr && rd)) ? write_ptr + 1 : write_ptr;
            read_ptr <= ((rd && !empty) || (wr && rd)) ? read_ptr + 1 : read_ptr;
        end
    end

//counter
    always @(posedge clk) 
        begin
            if (reset) 
                count <= 0;
            else begin
                case ({wr, rd})
                2'b00: count <= count;
                2'b01: count <= (count == 0) ? 0: count - 1;
                2'b10: count <= (count == 8) ? 8: count + 1;
                2'b11 : count <= count;
                default: count <= count;
                endcase
            end
        end
endmodule

/**************************************************
P1.1 FIFO
************************************************/
module FIFO( clk, rst, buf_in, buf_out, wr_en, rd_en, buf_empty, buf_full, fifo_counter );

input                 rst, clk, wr_en, rd_en;   
input [7:0]           buf_in;                   
output[7:0]           buf_out;                  
output                buf_empty, buf_full;      
output[3 :0] fifo_counter;             

reg[7:0]              buf_out;
reg                   buf_empty, buf_full;
reg[3 :0]    fifo_counter;
reg[3 -1:0]  rd_ptr, wr_ptr;           
reg[7:0]              buf_mem[7 : 0];   

always @(fifo_counter)
begin
   buf_empty = (fifo_counter==0);
   buf_full = (fifo_counter== 8);

end

always @(posedge clk or posedge rst)
begin
   if( rst )
       fifo_counter <= 0;

   else if( (!buf_full && wr_en) && ( !buf_empty && rd_en ) )
       fifo_counter <= fifo_counter;

   else if( !buf_full && wr_en )
       fifo_counter <= fifo_counter + 1;

   else if( !buf_empty && rd_en )
       fifo_counter <= fifo_counter - 1;
   else
      fifo_counter <= fifo_counter;
end

always @( posedge clk or posedge rst)
begin
   if( rst )
      buf_out <= 0;
   else
   begin
      if( rd_en && !buf_empty )
         buf_out <= buf_mem[rd_ptr];

      else
         buf_out <= buf_out;

   end
end

always @(posedge clk)
begin

   if( wr_en && !buf_full )
      buf_mem[ wr_ptr ] <= buf_in;

   else
      buf_mem[ wr_ptr ] <= buf_mem[ wr_ptr ];
end

always@(posedge clk or posedge rst)
begin
   if( rst )
   begin
      wr_ptr <= 0;
      rd_ptr <= 0;
   end
   else
   begin
      if( !buf_full && wr_en )    wr_ptr <= wr_ptr + 1;
          else  wr_ptr <= wr_ptr;

      if( !buf_empty && rd_en )   rd_ptr <= rd_ptr + 1;
      else rd_ptr <= rd_ptr;
   end

end
endmodule






