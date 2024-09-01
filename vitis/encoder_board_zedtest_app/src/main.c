#include "xparameters.h"
#include "xgpiops.h"
#include "xil_io.h"
#include "xil_printf.h"
#include "axi_spi_interface.h"
#include "sleep.h"
#include "math.h"

// SLCR
#define SLCR_BASE_ADDR					 	XPAR_PS7_SLCR_0_S_AXI_BASEADDR
#define SLCR_LOCK_REG_OFFSET				0x00000004
#define SLCR_UNLOCK_REG_OFFSET				0x00000008
#define SLCR_LOCKSTA_REG_OFFSET				0x0000000C
#define SLCR_FPGA_RST_CTRL_REG_OFFSET		0x00000240

#define	SLCR_UNLOCK_CODE					0xDF0D
#define SLCR_LOCK_CODE						0x767B
#define SLCR_FCLK0_ASSERT_RESET				0x00000001
#define SLCR_FCLK0_DEASSERT_RESET			0xFFFFFFFE
// ----------------------------------------------------

// AXI_SPI_INTERFACE
#define ASPI_INTERFACE_BASE_ADDR			XPAR_AXI_SPI_INTERFACE_0_S00_AXI_BASEADDR
#define ASPI_SLV_REG0_OFFSET				AXI_SPI_INTERFACE_S00_AXI_SLV_REG0_OFFSET
#define ASPI_SLV_REG1_OFFSET				AXI_SPI_INTERFACE_S00_AXI_SLV_REG1_OFFSET
#define ASPI_SLV_REG2_OFFSET				AXI_SPI_INTERFACE_S00_AXI_SLV_REG2_OFFSET
#define ASPI_SLV_REG3_OFFSET				AXI_SPI_INTERFACE_S00_AXI_SLV_REG3_OFFSET

#define ASPI_FB_DELAY_WIDTH					4
#define ASPI_FB_MAX_DELAY_VAL				(pow(2, ASPI_FB_DELAY_WIDTH)-1)
#define ASPI_FB_DELAY_MASK					((0xffffffff << (ASPI_FB_DELAY_WIDTH+3)) | 0x7)
//#define ASPI_FB_DELAY_LOCK					0xf000000f										// This value is compared with to determine if fb_spi_clk signal is locked with slave
#define ASPI_FB_DELAY_LOCK					0x80000000
//#define ASPI_FB_LOCK_REG					15

#define ASPI_ASSERT_RESET					0x00000001
#define ASPI_DEC_TRANSFER_START				0x00000002
#define ASPI_BUSY_MASK						0x80000000
#define ASPI_DEC_CTRL_REG_ADDR				0x00000001
#define ASPI_DEC_STAT_REG_ADDR				0x00000000
#define ASPI_DEC_INPUT_ADDR					0x00000002										// Decoder input register address | Decoder reads its inputs from this register
#define ASPI_DEC_OUTPUT_ADDR				0x00000003										// Decoder output register address | Decoder writes its outputs to this register
#define ASPI_DEC_CTRL_VAL					0x80000032										// First 4 LSBs point to the input register to decoder (2). Second 4 LSBs point to the output register of decoder (3)
// ----------------------------------------------------

// General defines
#define MAX_DATA							8
#define DELAY_U								2000000
#define DELAY_SEC							2
#define RESET_DELAY							2
#define SPI_TRANS_DELAY						1000000
#define AXI_TRANS_DELAY						1000000

// ----------------------------------------
// AXI_SPI interface register config
// reset_n = ~slv_reg0[0];
// start = slv_reg0[1];
// fb_sclk_delay = slv_reg0[2 +: SPI_CLK_FB_DELAY_WIDTH];
// write_address = slv_reg1[SPI_WR_ADDR_WIDTH-1:0];
// read_address = slv_reg1[SPI_RD_ADDR_WIDTH-1:SPI_WR_ADDR_WIDTH];
// write_data = slv_reg2;
// slv_reg3 = read_data;
// slv_reg0[32] = busy;
// ----------------------------------------

// metrics
u32 total_transactions = 0;
u32 failed_transactions = 0;
float failure_rate = 0.0;

void init() {
	u32 fpga_rst_ctrl;											// Holds the state of FPGA_RST_CTRL register
	// Let proc wakeup
	sleep(3);
	xil_printf("\r\n Initializing PL");
	// Assert PL reset
	fpga_rst_ctrl = Xil_In32(SLCR_BASE_ADDR + SLCR_FPGA_RST_CTRL_REG_OFFSET);
	Xil_Out32(SLCR_BASE_ADDR + SLCR_UNLOCK_REG_OFFSET, SLCR_UNLOCK_CODE);
	fpga_rst_ctrl |= SLCR_FCLK0_ASSERT_RESET;
	xil_printf("\r\n Asserting PL reset with val 0x%x", fpga_rst_ctrl);
	Xil_Out32(SLCR_BASE_ADDR + SLCR_FPGA_RST_CTRL_REG_OFFSET, fpga_rst_ctrl);
	xil_printf("\r\n FPGA_RST_CTRL_REG = 0x%x", Xil_In32(SLCR_BASE_ADDR + SLCR_FPGA_RST_CTRL_REG_OFFSET));
	sleep(3);
	// De-assert PL reset
	fpga_rst_ctrl &= SLCR_FCLK0_DEASSERT_RESET;
	xil_printf("\r\n De-asserting PL reset with val 0x%x", fpga_rst_ctrl);
	Xil_Out32(SLCR_BASE_ADDR + SLCR_FPGA_RST_CTRL_REG_OFFSET, SLCR_FCLK0_DEASSERT_RESET);
	fpga_rst_ctrl = Xil_In32(SLCR_BASE_ADDR + SLCR_FPGA_RST_CTRL_REG_OFFSET);
	xil_printf("\r\n FPGA_RST_CTRL_REG = 0x%x", fpga_rst_ctrl);
	Xil_Out32(SLCR_BASE_ADDR + SLCR_LOCK_REG_OFFSET, 0x767B);
	sleep(3);
}

void aspi_reset() {
	u32 enc_ctrl = AXI_SPI_INTERFACE_mReadReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET);
	enc_ctrl &= 0x00000004;
	enc_ctrl |= ASPI_ASSERT_RESET;
	xil_printf("\r\n Asserting reset on encoder and decoder");
	AXI_SPI_INTERFACE_mWriteReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET, enc_ctrl);
	sleep(RESET_DELAY);
	xil_printf("\r\n De-asserting reset on encoder and decoder");
	enc_ctrl &= ~ASPI_ASSERT_RESET;
	AXI_SPI_INTERFACE_mWriteReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET, enc_ctrl);
	xil_printf("\r\n Reset complete \n");
	sleep(RESET_DELAY);
}

void aspi_free_run() {
	u32 enc_ctrl = AXI_SPI_INTERFACE_mReadReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET);
	xil_printf("\r\n Asserting Free run");
	enc_ctrl &= 0xffffffffb;
	enc_ctrl |= 0x000000004;
	AXI_SPI_INTERFACE_mWriteReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET, enc_ctrl);
	xil_printf("\r\n Free running \n");
	sleep(RESET_DELAY);
}

// Returns the read data from decoder.
u32 aspi_transfer(u8 dec_rd_addr, u8 dec_wr_addr, u32 wr_data) {
	u32 enc_ctrl = 0;
	u32 dec_regs_addr = 0;
	u32 read_data = 0;

	enc_ctrl = AXI_SPI_INTERFACE_mReadReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET);
	dec_regs_addr |= ((dec_rd_addr << 4) | dec_wr_addr);

	//xil_printf("\r\n\n ASPI_TRANSFER: rd_addr = 0x%x | wr_addr = 0x%x | regs_addr = 0x%x ; to slv_reg_1", dec_rd_addr, dec_wr_addr, dec_regs_addr);
	AXI_SPI_INTERFACE_mWriteReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG1_OFFSET, dec_regs_addr);
	usleep(AXI_TRANS_DELAY);
	//xil_printf("\r\n ASPI_TRANSFER: wr_data = 0x%x ; to slv_reg_2", wr_data);
	AXI_SPI_INTERFACE_mWriteReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG2_OFFSET, wr_data);
	usleep(AXI_TRANS_DELAY);
	//xil_printf("\r\n ASPI_TRANSFER: setting transaction start signals in slv_reg_0");
	enc_ctrl |= ASPI_DEC_TRANSFER_START;
	AXI_SPI_INTERFACE_mWriteReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET, enc_ctrl);
	usleep(AXI_TRANS_DELAY);
	//xil_printf("\r\n ASPI_TRANSFER: De-asserting start signal to start SPI transaction");
	enc_ctrl &= ~ASPI_DEC_TRANSFER_START;
	AXI_SPI_INTERFACE_mWriteReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET, enc_ctrl);
	usleep(AXI_TRANS_DELAY);
	while(ASPI_BUSY_MASK & AXI_SPI_INTERFACE_mReadReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET)) usleep(SPI_TRANS_DELAY);; //xil_printf("\r\n Busy ... 0x%x", AXI_SPI_INTERFACE_mReadReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET));
	//xil_printf("\r\n ASPI_TRANSFER: Transaction complete");
	usleep(SPI_TRANS_DELAY);
	read_data = AXI_SPI_INTERFACE_mReadReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG3_OFFSET);
	usleep(AXI_TRANS_DELAY);
	total_transactions++;

	return read_data;
}

void aspi_set_fb_delay(u8 delay) {
	u32 enc_ctrl = AXI_SPI_INTERFACE_mReadReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET);
	enc_ctrl = (enc_ctrl & ASPI_FB_DELAY_MASK) | (delay << 3);
	AXI_SPI_INTERFACE_mWriteReg(ASPI_INTERFACE_BASE_ADDR, ASPI_SLV_REG0_OFFSET, enc_ctrl);
	usleep(AXI_TRANS_DELAY);
	xil_printf("\r\n New spi_clk feedback delay = %d | enc_ctrl = 0x%x", delay, enc_ctrl);
}

// Retruns the the number of tries attempted.
// If the returned value is positive, then lock was achieved.
// The delay value at which lock was achieved can be retrieved
// by subtracting the returned value from ASPI_FB_MAX_DELAY_VAL.
u8 aspi_get_fb_lock() {
	u8 locked = ASPI_FB_MAX_DELAY_VAL;
	u8 delay = 0;
	u32 rd_data = 0;
	xil_printf("\r\n\n Finding fb_spi_clk lock...");
	aspi_set_fb_delay(delay);
	//aspi_transfer(0, ASPI_FB_LOCK_REG, ASPI_FB_DELAY_LOCK);
	//rd_data = aspi_transfer(ASPI_FB_LOCK_REG, 0, 0);
	rd_data = aspi_transfer(0, 0, 0);
	xil_printf("\r\n read_data = 0x%x", rd_data);
	rd_data = rd_data & (0xf << 28);
	while (rd_data != ASPI_FB_DELAY_LOCK) {
		if (locked != 0) {
			++delay;
			aspi_set_fb_delay(delay);
			//rd_data = aspi_transfer(ASPI_FB_LOCK_REG, 0, 0);
			rd_data = aspi_transfer(0, 0, 0);
			xil_printf("\r\n read_data = 0x%x", rd_data);
			rd_data = rd_data & (0xf << 28);
			--locked;
		}
		else {
			locked = ASPI_FB_MAX_DELAY_VAL+1;
			break;
		}
	}

	return locked;
}

int main() {
	u8 i;
	u8 exit = 0;
	s8 fb_delay = 0;
	u32 valid_data[] = {1, 1, 2, 2, 3, 3, 4, 4};
	u32 enc_data_clean[] = {15, 51, 60, 85};				// Clean Encoded values corresponding to valid data
	u32 enc_data_fliped[] = {7, 179, 124, 117};				// Flipped values are 1 (3), 2 (7), 3 (6), 4 (5) ; where number inside the () indicate the flipped bit
	u32 dec_data[MAX_DATA] = {0};							// Decoded data read from decoder will be stored here
	u32 wr_data = 0;
	u32 rd_data = 0;

	// Dont perform init() -> It resets peripherals by pulling FCLK0_RSTN low, but this messes with
	// the AXI peripherals. If there are pending axi transactions in queue, the PS will hang.
	//init();

	sleep(DELAY_SEC);
	// Reset encoder and decoder
	//aspi_reset();
	//aspi_free_run();
	aspi_reset();
	/*
	// Find fb_sclk lock
	fb_delay = ASPI_FB_MAX_DELAY_VAL - aspi_get_fb_lock();
	if (fb_delay < 0) {
		xil_printf("\r\n Failed to obtain fb_sclk lock \n");
		exit = 1;
	}
	else {
		xil_printf("\r\n Obtained fb_sclk lock at delay_val = %d", fb_delay);
		// Write 0x00000032 to decoder reg_bank register 0.
		wr_data = ASPI_DEC_CTRL_VAL;
		rd_data = aspi_transfer(0, ASPI_DEC_CTRL_REG_ADDR, wr_data);
		// Read back the data stored in decoders control register (should be the same data that was writen = 0x00000032)
		//aspi_get_fb_lock();
		rd_data = aspi_transfer(ASPI_DEC_CTRL_REG_ADDR, 0, 0);
		xil_printf("\r\n Control Reg = 0x%x", rd_data);
	}
	*/

	aspi_set_fb_delay(0);

	// Start AXI_SPI transaction loop
	while (exit != 1) {
		//aspi_get_fb_lock();

		// Write 0x00000032 to decoder reg_bank register 0.
		//wr_data = ASPI_DEC_CTRL_VAL;
		//wr_data = 0xa5a5a5a5;
		wr_data = 0x85a5a5a5;
		//rd_data = aspi_transfer(0, ASPI_DEC_CTRL_REG_ADDR, wr_data);
		//rd_data = aspi_transfer(10, 5, wr_data);
		rd_data = aspi_transfer(15, 15, wr_data);
		// Read back the data stored in decoders control register (should be the same data that was writen = 0x00000032)
		//rd_data = aspi_transfer(ASPI_DEC_CTRL_REG_ADDR, 0, 0);
		//rd_data = aspi_transfer(5, 0, 0);
		xil_printf("\r\n Control Reg = 0x%x", rd_data);

		//aspi_reset();
		//aspi_set_fb_delay(3);

		//aspi_get_fb_lock();
		//wr_data = 0x3c3c3c3c;
		//rd_data = aspi_transfer(3, 12, wr_data);
		wr_data = 0x8c3c3c37;
		rd_data = aspi_transfer(15, 15, wr_data);
		// Read back the data stored in decoders control register (should be the same data that was writen = 0x00000032)
		//rd_data = aspi_transfer(ASPI_DEC_CTRL_REG_ADDR, 0, 0);
		//rd_data = aspi_transfer(12, 0, 0);
		xil_printf("\r\n Control Reg = 0x%x", rd_data);

		//aspi_reset();
		//aspi_set_fb_delay(3);

		wr_data = 0x8bababab;
		rd_data = aspi_transfer(15, 15, wr_data);
		xil_printf("\r\n Control Reg = 0x%x", rd_data);

		//aspi_reset();
		//aspi_set_fb_delay(3);

		wr_data = 0x8d8d8d8d;
		rd_data = aspi_transfer(15, 15, wr_data);
		xil_printf("\r\n Control Reg = 0x%x", rd_data);

		//aspi_reset();
		//aspi_set_fb_delay(3);

		wr_data = 0xcccccccc;
		rd_data = aspi_transfer(15, 15, wr_data);
		xil_printf("\r\n Control Reg = 0x%x", rd_data);

		/*
		for (i = 0; i < MAX_DATA+1; i++) {
			if (i == MAX_DATA) wr_data = 0;
			else wr_data = (i%2 == 0) ? enc_data_clean[i>>1] : enc_data_fliped[i>>1];
			// Write encoded data
			xil_printf("\r\n\n Encoded data = 0x%x | i = %d", wr_data, i);
			//aspi_get_fb_lock();
			rd_data = aspi_transfer(ASPI_DEC_OUTPUT_ADDR, ASPI_DEC_INPUT_ADDR, wr_data);
			xil_printf("\r\n Read data = 0x%x | i = %d", rd_data, i);
			if (i != 0) {
				dec_data[i-1] = rd_data;
				xil_printf("\r\n Decoded data = 0x%x | Valid data = 0x%x | i = %d", dec_data[i-1], valid_data[i-1], i);
			}
			// Compare decoded data with valid data
			if (i != 0 && dec_data[i-1] != valid_data[i-1]) {
				xil_printf("\r\n\n Testcase %d failed", i-1);
				failed_transactions++;
				//exit = 1;
				//break;
			}
			sleep(DELAY_SEC);
		}

		// If all testcases passed, print the decoder status register (errors corrected)
		//aspi_get_fb_lock();
		rd_data = aspi_transfer(ASPI_DEC_STAT_REG_ADDR, 0, 0);
		//if (rd_data != 4) failed_transactions++;

		xil_printf("\r\n Total_transactions = %d | Failed_transactions = %d \n", total_transactions, failed_transactions);
		*/
		sleep(DELAY_SEC);
	}
	return 0;
}
