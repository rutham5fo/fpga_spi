`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:13:12 PM
// Design Name: 
// Module Name: spi_slave
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spi_slave #(
        parameter integer SPI_DATA_WIDTH = 32,
        parameter integer SPI_RD_ADDR_WIDTH = 4,
        parameter integer SPI_WR_ADDR_WIDTH = 4,
        //parameter integer SAMPLER_SIZE = 2,                     // No. of metaguard regs
        parameter integer PING_PONG_SIZE = 2,                   // No. of ping pong mosi buffers
        parameter integer SHIFT_MAX = SPI_RD_ADDR_WIDTH + SPI_WR_ADDR_WIDTH + SPI_DATA_WIDTH,
        parameter integer SHIFT_IN_COMP = 0,
        parameter integer SHIFT_OUT_COMP = 0
    )
    (
        input                           clk,
        input                           reset_n,
        input                           spi_clk_iob,
        input                           spi_clk_inv_iob,
        //input                           spi_clk,
        //input                           spi_clk_0,
        //input                           spi_clk_180,
        //input                           spi_in_ready,
        input                           spi_cs_n,
        input                           spi_mosi,
        input   [SPI_DATA_WIDTH-1:0]    driver_in_data,
        input                           spi_read_en_in,
        input                           spi_write_en_in,
        
        // Debug signals
        output  [$clog2(SHIFT_MAX)-1:0]           in_shift_count_debug,
        //output  [$clog2(PING_PONG_SIZE)-1:0]      out_mosi_reg_sel_debug,
        //output  [$clog2(PING_PONG_SIZE)-1:0]      in_mosi_reg_sel_debug,
        //output  [PING_PONG_SIZE-1:0]              mosi_reg_debug,
        //output  [PING_PONG_SIZE-1:0]              mosi_valid_debug,
        //output  [PING_PONG_SIZE-1:0]              prev_mosi_valid_debug,
        //output  [SPI_DATA_WIDTH-1:0]              miso_reg_debug,
        
        //output                          bufgce_enable,
        output                          spi_miso_disable,
        output                          spi_read_en_out,
        output                          spi_write_en_out,
        output                          spi_miso,
        output  [SPI_RD_ADDR_WIDTH-1:0] spi_rd_addr,
        output  [SPI_WR_ADDR_WIDTH-1:0] spi_wr_addr,
        output  [SPI_DATA_WIDTH-1:0]    driver_out_data
    );
    
    localparam SAMPLER_SIZE = 2;
    localparam SPI_BUFFER_WIDTH = SPI_WR_ADDR_WIDTH + SPI_DATA_WIDTH;
    localparam SPI_ADDR_WIDTH = SPI_RD_ADDR_WIDTH + SPI_WR_ADDR_WIDTH;
    localparam READ_AT = SPI_RD_ADDR_WIDTH;    
    
    reg                                             spi_in_reg = 1'b0;
    reg                                             spi_active;
    reg                                             spi_out_reg = 1'b0;
    reg                                             spi_in_data;
    //reg [PING_PONG_SIZE-1:0]                        mosi_reg;
    //reg [PING_PONG_SIZE-1:0]                        mosi_valid;
    //reg [PING_PONG_SIZE-1:0]                        prev_mosi_valid;
    reg [SPI_DATA_WIDTH-1:0]                        miso_reg;
    reg [$clog2(SHIFT_MAX+1)-1:0]                   in_shift_count;
    reg [SPI_BUFFER_WIDTH-1:0]                      in_buffer_reg;
    reg [SPI_DATA_WIDTH-1:0]                        out_buffer_reg;
    //reg [$clog2(PING_PONG_SIZE)-1:0]                in_mosi_reg_sel;
    //reg [$clog2(PING_PONG_SIZE)-1:0]                out_mosi_reg_sel;
    //reg                                             new_bit_avail;
    //reg                                             load_miso_reg;
    //reg                                             spi_in_valid;
    //reg                                             prev_spi_in_valid;
    //reg                                             spi_in_ready;
    reg                                             miso_disable_reg;
    reg                                             spi_io_regs_en;
    reg                                             spi_p_valid;
    reg                                             spi_n_valid;
    reg                                             merger_out;
    reg                                             merger_out_valid;
    reg                                             merger_out_prev_valid;
    reg                                             merger_prev_p_valid;
    reg                                             merger_prev_n_valid;
    reg                                             distru_p;
    reg                                             distru_n;
    
    // Metastable Guard regs and sampler regs
    //(* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_in_ready_metaguard;
    //(* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_in_data_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_pp_valid_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_pn_valid_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_p_data_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_np_valid_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_nn_valid_metaguard;
    (* ASYNC_REG = "TRUE" *) reg [SAMPLER_SIZE-1:0]                  spi_n_data_metaguard;
    //(* ASYNC_REG = "TRUE" *) reg [PING_PONG_SIZE-1:0]                mosi_valid_metaguard[SAMPLER_SIZE-1:0];
    
    //wire                                                             mosi_to_in_buff;
    wire                                                             spi_write_en_val;
    //wire                                                             spi_in_buffered;
    //wire                                                             read_spi_in;
    wire                                                             read_merger_out;
    wire                                                             read_merger_p_in;
    wire                                                             read_merger_n_in;
    //wire                                                             new_bit_ord;
    //wire    [PING_PONG_SIZE-1:0]                                     new_bit_xord;
    wire                                                             spi_p_data;
    wire                                                             spi_n_data;
    
    //integer i;
    
    // Debug signals
    assign in_shift_count_debug = in_shift_count;
    //assign out_mosi_reg_sel_debug = out_mosi_reg_sel;
    //assign in_mosi_reg_sel_debug = in_mosi_reg_sel;
    //assign mosi_reg_debug = mosi_reg;
    //assign mosi_valid_debug = mosi_valid;
    //assign prev_mosi_valid_debug = prev_mosi_valid;
    assign miso_reg_debug = miso_reg;
    
    //assign new_bit_xord = prev_mosi_valid ^ mosi_valid_metaguard[SAMPLER_SIZE-1];
    //assign new_bit_ord = |new_bit_xord;
    //assign read_spi_in = prev_spi_in_valid ^ spi_in_valid;
    assign read_merger_out = merger_out_valid ^ merger_out_prev_valid;
    assign read_merger_p_in = (merger_prev_p_valid ^ spi_pp_valid_metaguard[SAMPLER_SIZE-1]) & ~(spi_pp_valid_metaguard[SAMPLER_SIZE-1] ^ spi_pn_valid_metaguard[SAMPLER_SIZE-1]);
    assign read_merger_n_in = (merger_prev_n_valid ^ spi_np_valid_metaguard[SAMPLER_SIZE-1]) & ~(spi_np_valid_metaguard[SAMPLER_SIZE-1] ^ spi_nn_valid_metaguard[SAMPLER_SIZE-1]);
    assign spi_miso_disable = miso_disable_reg;
    //assign spi_miso = spi_out_reg;
    assign spi_rd_addr = in_buffer_reg[0 +: SPI_RD_ADDR_WIDTH];
    assign spi_wr_addr = in_buffer_reg[SPI_DATA_WIDTH +: SPI_WR_ADDR_WIDTH];
    assign spi_read_en_out = (in_shift_count == READ_AT + SHIFT_IN_COMP) ? 1'b1 : 1'b0;
    assign spi_write_en_out = spi_write_en_val;
    assign driver_out_data = in_buffer_reg[0 +: SPI_DATA_WIDTH];
    //assign mosi_to_in_buff = mosi_reg[out_mosi_reg_sel];
    assign spi_write_en_val = ((in_shift_count >= (SHIFT_MAX + SHIFT_IN_COMP) && !spi_io_regs_en) || !reset_n) ? 1'b1 : 1'b0;
    
    // --- IO regs and control ---
    IDDR #(
        .DDR_CLK_EDGE("OPPOSITE_EDGE"), // "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED"
        .INIT_Q1(1'b0), // Initial value of Q1: 1'b0 or 1'b1
        .INIT_Q2(1'b0), // Initial value of Q2: 1'b0 or 1'b1
        .SRTYPE("ASYNC") // Set/Reset type: "SYNC" or "ASYNC"
    ) spi_in_iddr (
        .Q1(spi_p_data), // 1-bit output for positive edge of clock
        .Q2(spi_n_data), // 1-bit output for negative edge of clock
        .C(spi_clk_iob),   // 1-bit clock input
        .CE(spi_io_regs_en), // 1-bit clock enable input
        .D(spi_mosi),   // 1-bit DDR data input
        .R(~reset_n),   // 1-bit reset
        .S(1'b0)    // 1-bit set
    );
    
    ODDR #(
        .DDR_CLK_EDGE("OPPOSITE_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE("ASYNC") // Set/Reset type: "SYNC" or "ASYNC"
    ) spi_out_oddr (
        .Q(spi_miso),   // 1-bit DDR output
        .C(spi_clk_inv_iob),   // 1-bit clock input
        .CE(spi_io_regs_en), // 1-bit clock enable input
        .D1(distru_p), // 1-bit data input (positive edge)
        .D2(distru_n), // 1-bit data input (negative edge)
        .R(~reset_n),   // 1-bit reset
        .S(1'b0)    // 1-bit set
    );
    
    always @(posedge spi_clk_iob, negedge reset_n) begin
        if (!reset_n) begin
            //spi_in_reg <= 1'b0;
            spi_p_valid <= 1'b0;
            //spi_in_ready <= 1'b0;
        end
        else begin
            //spi_in_reg <= (spi_io_regs_en) ? spi_mosi : spi_in_reg;
            //spi_in_ready <= ~spi_in_ready;
            spi_p_valid <= ~spi_p_valid;
        end
    end

    always @(negedge spi_clk_iob, negedge reset_n) begin
        if (!reset_n) begin
            //spi_out_reg <= 0;
            spi_n_valid <= 1'b0;
        end
        else begin
            //spi_out_reg <= (spi_io_regs_en) ? miso_reg[SPI_DATA_WIDTH-1] : spi_out_reg;
            spi_n_valid <= ~spi_n_valid;
        end
    end
    
    // --- System SpiClk domain control and regs ---
    /*
    always @(posedge spi_clk_0) begin
        //spi_in_ready_metaguard <= {spi_in_ready_metaguard[0 +: SAMPLER_SIZE-1], spi_in_ready};
        //spi_in_data_metaguard <= {spi_in_data_metaguard[0 +: SAMPLER_SIZE-1], spi_in_reg};
        //spi_p_valid_metaguard <= {spi_p_valid_metaguard[0 +: SAMPLER_SIZE-1], spi_p_valid};
        //spi_p_data_metaguard <= {spi_p_data_metaguard[0 +: SAMPLER_SIZE-1], spi_p_data};
        if (!reset_n) begin
            mosi_reg <= 0;
            mosi_valid <= 0;
        end
        else if (read_spi_in) begin
            mosi_reg[in_mosi_reg_sel] <= spi_in_data;
            mosi_valid[in_mosi_reg_sel] <= ~mosi_valid[in_mosi_reg_sel];
        end
    end
    */
    /*
    always @(posedge spi_clk_180) begin
        //spi_n_valid_metaguard <= {spi_n_valid_metaguard[0 +: SAMPLER_SIZE-1], spi_n_valid};
        //spi_n_data_metaguard <= {spi_n_data_metaguard[0 +: SAMPLER_SIZE-1], spi_n_data};
        if (!reset_n) begin
            //spi_in_data <= 1'b0;
            //spi_in_valid <= 1'b0;
            //in_mosi_reg_sel <= 0;
            miso_reg <= 0;
            //prev_spi_in_valid <= 1'b0;
        end
        else begin
            //spi_in_data <= spi_in_data_metaguard[SAMPLER_SIZE-1];
            //spi_in_valid <= spi_in_ready_metaguard[SAMPLER_SIZE-1];
            //prev_spi_in_valid <= (read_spi_in) ? ~prev_spi_in_valid : prev_spi_in_valid;
            //in_mosi_reg_sel <= (read_spi_in) ? in_mosi_reg_sel + 1 : in_mosi_reg_sel;
            if (load_miso_reg) miso_reg <= out_buffer_reg;
            //else if (read_spi_in) miso_reg <= {miso_reg[0 +: SPI_DATA_WIDTH-1], 1'b0};
            else if (read_merger_p_in || read_merger_n_in) miso_reg <= {miso_reg[0 +: SPI_DATA_WIDTH-1], 1'b0};
            else miso_reg <= miso_reg;
        end
    end
    */
    // --- Input/Output buffer reg and control ---
    /*
    always @(negedge clk) begin
        if (!reset_n) begin
            out_mosi_reg_sel <= 0;
            new_bit_avail <= 1'b0;
        end
        else begin
            out_mosi_reg_sel <= (new_bit_avail) ? out_mosi_reg_sel + 1 : out_mosi_reg_sel;
            new_bit_avail <= new_bit_ord;
        end
    end
    */
    always @(negedge clk) begin
        spi_pn_valid_metaguard <= {spi_pn_valid_metaguard[0 +: SAMPLER_SIZE-1], spi_p_valid};
        spi_nn_valid_metaguard <= {spi_nn_valid_metaguard[0 +: SAMPLER_SIZE-1], spi_n_valid};
    end
    
    always @(posedge clk) begin
        spi_pp_valid_metaguard <= {spi_pp_valid_metaguard[0 +: SAMPLER_SIZE-1], spi_p_valid};
        spi_p_data_metaguard <= {spi_p_data_metaguard[0 +: SAMPLER_SIZE-1], spi_p_data};
        spi_np_valid_metaguard <= {spi_np_valid_metaguard[0 +: SAMPLER_SIZE-1], spi_n_valid};
        spi_n_data_metaguard <= {spi_n_data_metaguard[0 +: SAMPLER_SIZE-1], spi_n_data};
        if (!reset_n) begin
            merger_out <= 1'b0;
            merger_out_valid <= 1'b0;
            merger_prev_p_valid <= 1'b0;
            merger_prev_n_valid <= 1'b0;
            distru_p <= 1'b0;
            distru_n <= 1'b0;
            miso_reg <= 0;
        end
        else begin
            if (read_merger_p_in) begin
                merger_out <= spi_p_data_metaguard[SAMPLER_SIZE-1];
                merger_prev_p_valid <= ~merger_prev_p_valid;
                merger_out_valid <= ~merger_out_valid;
                distru_p <= miso_reg[SPI_DATA_WIDTH-1];
                miso_reg <= {miso_reg[0 +: SPI_DATA_WIDTH], 1'b0};
            end
            else if (read_merger_n_in) begin
                merger_out <= spi_n_data_metaguard[SAMPLER_SIZE-1];
                merger_prev_n_valid <= ~merger_prev_n_valid;
                merger_out_valid <= ~merger_out_valid;
                distru_n <= miso_reg[SPI_DATA_WIDTH-1];
                miso_reg <= {miso_reg[0 +: SPI_DATA_WIDTH], 1'b0};
            end
            else if (spi_write_en_in) begin
                miso_reg <= out_buffer_reg;
                distru_p <= out_buffer_reg[SPI_DATA_WIDTH-1];
                distru_n <= out_buffer_reg[SPI_DATA_WIDTH-2];
            end
        end
    end
    
    always @(posedge clk) begin
        miso_disable_reg <= spi_cs_n;
        spi_io_regs_en <= ~spi_cs_n;
        //load_miso_reg <= (in_shift_count > SPI_DATA_WIDTH) ? 1'b1 : 1'b0;
        if (!reset_n) begin
            in_buffer_reg <= 0;
            merger_out_prev_valid <= 1'b0;
            //prev_mosi_valid <= 0;
            out_buffer_reg <= 0;
            /*
            for (i = 0; i < PING_PONG_SIZE; i = i+1) begin
                mosi_valid_metaguard[0][i] <= 1'b0;
                mosi_valid_metaguard[1][i] <= 1'b0;
            end
            */
        end
        else begin
            out_buffer_reg <= (spi_read_en_in) ? driver_in_data : out_buffer_reg;
            in_buffer_reg <= (in_shift_count < SHIFT_MAX + SHIFT_IN_COMP && spi_active && read_merger_out) ? {in_buffer_reg[0 +: SPI_BUFFER_WIDTH-1], merger_out} : in_buffer_reg;
            merger_out_prev_valid <= (read_merger_out) ? ~merger_out_prev_valid : merger_out_prev_valid;
            /*
            for (i = 0; i < PING_PONG_SIZE; i = i+1) begin
                mosi_valid_metaguard[0][i] <= mosi_valid[i];
                mosi_valid_metaguard[1][i] <= mosi_valid_metaguard[0][i];
            end
            if (new_bit_avail) begin
                in_buffer_reg <= (in_shift_count < SHIFT_MAX + SHIFT_IN_COMP && spi_active) ? {in_buffer_reg[0 +: SPI_BUFFER_WIDTH-1], mosi_to_in_buff} : in_buffer_reg;
                prev_mosi_valid[out_mosi_reg_sel] <= ~prev_mosi_valid[out_mosi_reg_sel];
            end
            */
        end
    end
    
    always @(posedge clk) begin
        if (!reset_n || spi_write_en_in) begin
            in_shift_count <= 0;
            spi_active <= 1'b0;
        end
        else begin
            spi_active <= (!spi_active) ? spi_io_regs_en : spi_active;
            //in_shift_count <= (spi_active && new_bit_avail) ? in_shift_count + 1 : in_shift_count;
            in_shift_count <= (spi_active && read_merger_out) ? in_shift_count + 1 : in_shift_count;
        end
    end
    
endmodule
