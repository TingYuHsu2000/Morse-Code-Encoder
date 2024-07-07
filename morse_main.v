
module morse_main(
input clk,rst,sw0,sw1,btn1,btn2,btn3,
output reg out,
output reg green,red
);
reg [3:0]len;
reg [3:0]count;
reg [12:0]morse;
reg [1:0]state;
reg [1:0]next;
reg finish;
reg [4:0]button;
parameter  ledout=2'b01;//state
parameter  idle=2'b00;
parameter  res=2'b10;

parameter idle00=5'b00000;//button input
parameter idle01=5'b01000;
parameter idle10=5'b10000;
parameter idle11=5'b11000;
parameter A=5'b00001;
parameter B=5'b00010;
parameter C=5'b00011;
parameter D=5'b00100;
parameter E=5'b00101;
parameter F=5'b00110;
parameter G=5'b00111;
parameter H=5'b01001;
parameter I=5'b01010;
parameter J=5'b01011;
parameter K=5'b01100;
parameter L=5'b01101;
parameter M=5'b01110;
parameter N=5'b01111;
parameter O=5'b10001;
parameter P=5'b10010;
parameter Q=5'b10011;
parameter R=5'b10100;
parameter S=5'b10101;
parameter T=5'b10110;
parameter U=5'b10111;
parameter V=5'b11001;
parameter W=5'b11010;
parameter X=5'b11011;
parameter Y=5'b11100;
parameter Z=5'b11101;

always @(posedge clk or posedge rst) begin
if(rst) state<=idle;
else state<=next;
end
always @(posedge clk)begin //next state

case (state)
    idle:begin
        button = {sw1,sw0,btn3,btn2,btn1}; 
        case(button)
            idle00:begin 
                next<=idle;
            end
            idle01:begin 
                next<=idle;
            end
            idle10:begin 
                next<=idle;
            end
            idle11:begin 
                next<=idle;
            end
            A:begin 
                morse<=6'b101110;
                len<=4'd6;
                next<=ledout;
            end
            B:begin 
                morse<=10'b1110101010;
                len<=4'd10;
                next<=ledout;
            end
            C:begin 
                morse<=12'b111010111010;
                len<=4'd12;
                next<=ledout;
            end
            D:begin 
                morse<=8'b11101010;
                len<=4'd8;
                next<=ledout;
            end
            E:begin 
                morse<=2'b10;
                len<=4'd2;
                next<=ledout;
            end
            F:begin 
                morse<=10'b1010111010;
                len<=4'd10;
                next<=ledout;
            end
            G:begin 
                morse<=10'b1110111010;
                len<=4'd10;
                next<=ledout;
            end
            H:begin 
                morse<=8'b10101010;
                len<=4'd8;
                next<=ledout;
            end
            I:begin 
                morse<=4'b1010;
                len<=4'd4;
                next<=ledout;
            end
            J:begin 
                morse<=14'b10111011101110;
                len<=4'd14;
                next<=ledout;
            end
            K:begin 
                morse<=10'b1110101110;
                len<=4'd10;
                next<=ledout;
            end
            L:begin 
                morse<=10'b1011101010;
                len<=4'd10;
                next<=ledout;
            end
            M:begin 
                morse<=8'b11101110;
                len<=4'd8;
                next<=ledout;
            end
            N:begin 
                morse<=6'b111010;
                len<=4'd6;
                next<=ledout;
            end
            O:begin 
                morse<=12'b111011101110;
                len<=4'd12;
                next<=ledout;
            end
            P:begin 
                morse<=12'b101110111010;
                len<=4'd12;
                next<=ledout;
            end
            Q:begin 
                morse<=14'b11101110101110;
                len<=4'd14;
                next<=ledout;
            end
            R:begin 
                morse<=8'b10111010;
                len<=4'd8;
                next<=ledout;
            end
            S:begin 
                morse<=6'b101010;
                len<=4'd6;
                next<=ledout;
            end
            T:begin 
                morse<=4'b1110;
                len<=4'd4;
                next<=ledout;
            end
            U:begin 
                morse<=8'b10101110;
                len<=4'd8;
                next<=ledout;
            end
            V:begin 
                morse<=10'b1010101110;
                len<=4'd10;
                next<=ledout;
            end
            W:begin 
                morse<=10'b1011101110;
                len<=4'd10;
                next<=ledout;
            end
            X:begin 
                morse<=12'b111010101110;
                len<=4'd12;
                next<=ledout;
            end
            Y:begin 
                morse<=14'b11101011101110;
                len<=4'd14;
                next<=ledout;
            end
            Z:begin 
                morse<=12'b111011101010;
                len<=4'd12;
                next<=ledout;
            end
        endcase 
    end
    ledout:begin 
        if(finish)begin 
            next<=idle;
        end
    end 
endcase 
end 
always @(posedge clk or posedge rst) begin//output
    if (rst) begin
        out = 1'b0;
        count<=4'd0;
    end
    else begin
       case(state)
            idle:begin 
                out = 1'b0;
                green<=1'b1;
                red<=1'b0;
                finish<=1'b0;
                count<=4'd0;
            end
            ledout:begin 
                if(count<len)begin
                    green<=1'b0;
                    red<=1'b1;
                    out<=morse[len-1-count];
                    count<=count+1;
                end 
                else begin 
                    finish<=1'b1;
                end
            end
       endcase 
    end
end



endmodule