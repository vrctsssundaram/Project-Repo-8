module tb_roi_stream_crop;
    timeunit 1ns; timeprecision 1ps;
    reg clk=0;
    always #5 clk=~clk;
    reg rst_n=0;
    reg [7:0] pixel=0;
    reg sof=0,eol=0,valid=0;
    wire ready;
    reg m_ready=1;
    wire [7:0] out_pixel;
    wire out_sof,out_eol,out_valid;
    integer got=0,cycle=0,k;
    reg [7:0] expected [0:3];
    roi_stream_crop dut(.clk(clk),.rst_n(rst_n),
        .s_pixel(pixel),.s_sof(sof),.s_eol(eol),.s_valid(valid),.s_ready(ready),
        .cfg_x0(12'd1),.cfg_x1(12'd2),.cfg_y0(12'd1),.cfg_y1(12'd2),
        .m_pixel(out_pixel),.m_sof(out_sof),.m_eol(out_eol),
        .m_valid(out_valid),.m_ready(m_ready));
    always @(posedge clk) if (rst_n && out_valid && m_ready) begin
        if (got>=4 || out_pixel !== expected[got] ||
            out_sof !== (got==0) || out_eol !== ((got%2)==1))
            $fatal(1,"ROI pixel/order/sideband mismatch index=%0d pixel=%0d",got,out_pixel);
        got=got+1;
    end
    task automatic send(input [7:0] value,input start_of_frame,input end_of_line);
        begin
            @(negedge clk);pixel=value;sof=start_of_frame;eol=end_of_line;valid=1;
            @(posedge clk);while(!ready) @(posedge clk);
            @(negedge clk);valid=0;sof=0;eol=0;
        end
    endtask
    initial begin
        expected[0]=5;expected[1]=6;expected[2]=9;expected[3]=10;
        #23;rst_n=1;
        for(k=0;k<12;k=k+1)
            send(k[7:0],k==0,(k%4)==3);
        repeat(8) @(posedge clk);
        if(got!=4)$fatal(1,"Expected four cropped pixels; got %0d",got);
        $display("PASS: 4x3 raster cropped to 2x2 ROI, pixel order and SOF/EOL");
        $finish;
    end
    initial begin #10000;$fatal(1,"Watchdog timeout");end
endmodule
