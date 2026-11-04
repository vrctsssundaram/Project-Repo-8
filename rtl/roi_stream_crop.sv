module roi_stream_crop #(
    parameter integer COORD_W = 12
) (
    input  wire                 clk,
    input  wire                 rst_n,
    input  wire [7:0]           s_pixel,
    input  wire                 s_sof,
    input  wire                 s_eol,
    input  wire                 s_valid,
    output wire                 s_ready,
    input  wire [COORD_W-1:0]   cfg_x0,
    input  wire [COORD_W-1:0]   cfg_x1,
    input  wire [COORD_W-1:0]   cfg_y0,
    input  wire [COORD_W-1:0]   cfg_y1,
    output reg  [7:0]           m_pixel,
    output reg                  m_sof,
    output reg                  m_eol,
    output reg                  m_valid,
    input  wire                 m_ready
);
    timeunit 1ns; timeprecision 1ps;
    reg [COORD_W-1:0] x,y;
    wire [COORD_W-1:0] px = s_sof ? {COORD_W{1'b0}} : x;
    wire [COORD_W-1:0] py = s_sof ? {COORD_W{1'b0}} : y;
    wire inside_roi = (px >= cfg_x0) && (px <= cfg_x1) &&
                  (py >= cfg_y0) && (py <= cfg_y1) &&
                  (cfg_x0 <= cfg_x1) && (cfg_y0 <= cfg_y1);
    assign s_ready = !inside_roi || !m_valid || m_ready;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            x <= 0;
            y <= 0;
            m_pixel <= 0;
            m_sof <= 0;
            m_eol <= 0;
            m_valid <= 0;
        end else begin
            if (m_ready) m_valid <= 0;
            if (s_valid && s_ready) begin
                if (s_eol) begin x <= 0; y <= py+1'b1; end
                else begin x <= px+1'b1; y <= py; end
                if (inside_roi) begin
                    m_pixel <= s_pixel;
                    m_sof <= (px == cfg_x0 && py == cfg_y0);
                    m_eol <= (px == cfg_x1);
                    m_valid <= 1;
                end
            end
        end
    end
endmodule
