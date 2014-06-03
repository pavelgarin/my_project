//
///////////////////////////////////////////////////////////////////////////////////////////
// Copyright © 2010-2013, Xilinx, Inc.
// This file contains confidential and proprietary information of Xilinx, Inc. and is
// protected under U.S. and international copyright and other intellectual property laws.
///////////////////////////////////////////////////////////////////////////////////////////
//
// Disclaimer:
// This disclaimer is not a license and does not grant any rights to the materials
// distributed herewith. Except as otherwise provided in a valid license issued to
// you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
// MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
// DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
// INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT,
// OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable
// (whether in contract or tort, including negligence, or under any other theory
// of liability) for any loss or damage of any kind or nature related to, arising
// under or in connection with these materials, including for any direct, or any
// indirect, special, incidental, or consequential loss or damage (including loss
// of data, profits, goodwill, or any type of loss or damage suffered as a result
// of any action brought by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-safe, or for use in any
// application requiring fail-safe performance, such as life-support or safety
// devices or systems, Class III medical devices, nuclear facilities, applications
// related to the deployment of airbags, or any other applications that could lead
// to death, personal injury, or severe property or environmental damage
// (individually and collectively, "Critical Applications"). Customer assumes the
// sole risk and liability of any use of Xilinx products in Critical Applications,
// subject only to applicable laws and regulations governing limitations on product
// liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
//
///////////////////////////////////////////////////////////////////////////////////////////
//
//
// Definition of a program memory for KCPSM6 including generic parameters for the 
// convenient selection of device family, program memory size and the ability to include 
// the JTAG Loader hardware for rapid software development.
//
// This file is primarily for use during code development and it is recommended that the 
// appropriate simplified program memory definition be used in a final production design. 
//
//
//    Generic                  Values             Comments
//    Parameter                Supported
//  
//    C_FAMILY                 "S6"               Spartan-6 device
//                             "V6"               Virtex-6 device
//                             "7S"               7-Series device 
//                                                  (Artix-7, Kintex-7, Virtex-7 or Zynq)
//
//    C_RAM_SIZE_KWORDS        1, 2 or 4          Size of program memory in K-instructions
//
//    C_JTAG_LOADER_ENABLE     0 or 1             Set to '1' to include JTAG Loader
//
// Notes
//
// If your design contains MULTIPLE KCPSM6 instances then only one should have the 
// JTAG Loader enabled at a time (i.e. make sure that C_JTAG_LOADER_ENABLE is only set to 
// '1' on one instance of the program memory). Advanced users may be interested to know 
// that it is possible to connect JTAG Loader to multiple memories and then to use the 
// JTAG Loader utility to specify which memory contents are to be modified. However, 
// this scheme does require some effort to set up and the additional connectivity of the 
// multiple BRAMs can impact the placement, routing and performance of the complete 
// design. Please contact the author at Xilinx for more detailed information. 
//
// Regardless of the size of program memory specified by C_RAM_SIZE_KWORDS, the complete 
// 12-bit address bus is connected to KCPSM6. This enables the generic to be modified 
// without requiring changes to the fundamental hardware definition. However, when the 
// program memory is 1K then only the lower 10-bits of the address are actually used and 
// the valid address range is 000 to 3FF hex. Likewise, for a 2K program only the lower 
// 11-bits of the address are actually used and the valid address range is 000 to 7FF hex.
//
// Programs are stored in Block Memory (BRAM) and the number of BRAM used depends on the 
// size of the program and the device family. 
//
// In a Spartan-6 device a BRAM is capable of holding 1K instructions. Hence a 2K program 
// will require 2 BRAMs to be used and a 4K program will require 4 BRAMs to be used. It 
// should be noted that a 4K program is not such a natural fit in a Spartan-6 device and 
// the implementation also requires a small amount of logic resulting in slightly lower 
// performance. A Spartan-6 BRAM can also be split into two 9k-bit memories suggesting 
// that a program containing up to 512 instructions could be implemented. However, there 
// is a silicon errata which makes this unsuitable and therefore it is not supported by 
// this file.
//
// In a Virtex-6 or any 7-Series device a BRAM is capable of holding 2K instructions so 
// obviously a 2K program requires only a single BRAM. Each BRAM can also be divided into 
// 2 smaller memories supporting programs of 1K in half of a 36k-bit BRAM (generally 
// reported as being an 18k-bit BRAM). For a program of 4K instructions, 2 BRAMs are used.
//
//
// Program defined by 'E:\KCPSM6_Release8_31March14\all_kcpsm6_syntax.psm'.
//
// Generated by KCPSM6 Assembler: 16 May 2014 - 12:27:15. 
//
// Assembler used ROM_form template: ROM_form_JTAGLoader_14March13.v
//
//
`timescale 1ps/1ps
module all_kcpsm6_syntax (address, instruction, enable, rdl, clk);
//
parameter integer C_JTAG_LOADER_ENABLE = 1;                        
parameter         C_FAMILY = "S6";                        
parameter integer C_RAM_SIZE_KWORDS = 1;                        
//
input         clk;        
input  [11:0] address;        
input         enable;        
output [17:0] instruction;        
output        rdl;
//
//
wire [15:0] address_a;
wire        pipe_a11;
wire [35:0] data_in_a;
wire [35:0] data_out_a;
wire [35:0] data_out_a_l;
wire [35:0] data_out_a_h;
wire [35:0] data_out_a_ll;
wire [35:0] data_out_a_lh;
wire [35:0] data_out_a_hl;
wire [35:0] data_out_a_hh;
wire [15:0] address_b;
wire [35:0] data_in_b;
wire [35:0] data_in_b_l;
wire [35:0] data_in_b_ll;
wire [35:0] data_in_b_hl;
wire [35:0] data_out_b;
wire [35:0] data_out_b_l;
wire [35:0] data_out_b_ll;
wire [35:0] data_out_b_hl;
wire [35:0] data_in_b_h;
wire [35:0] data_in_b_lh;
wire [35:0] data_in_b_hh;
wire [35:0] data_out_b_h;
wire [35:0] data_out_b_lh;
wire [35:0] data_out_b_hh;
wire        enable_b;
wire        clk_b;
wire [7:0]  we_b;
wire [3:0]  we_b_l;
wire [3:0]  we_b_h;
//
wire [11:0] jtag_addr;
wire        jtag_we;
wire        jtag_clk;
wire [17:0] jtag_din;
wire [17:0] jtag_dout;
wire [17:0] jtag_dout_1;
wire [0:0]  jtag_en;
//
wire [0:0]  picoblaze_reset;
wire [0:0]  rdl_bus;
//
parameter integer BRAM_ADDRESS_WIDTH = addr_width_calc(C_RAM_SIZE_KWORDS);
//
//
function integer addr_width_calc;
  input integer size_in_k;
    if (size_in_k == 1) begin addr_width_calc = 10; end
      else if (size_in_k == 2) begin addr_width_calc = 11; end
      else if (size_in_k == 4) begin addr_width_calc = 12; end
      else begin
        if (C_RAM_SIZE_KWORDS != 1 && C_RAM_SIZE_KWORDS != 2 && C_RAM_SIZE_KWORDS != 4) begin
          //#0;
          $display("Invalid BlockRAM size. Please set to 1, 2 or 4 K words..\n");
          $finish;
        end
    end
endfunction
//
//
generate
  if (C_RAM_SIZE_KWORDS == 1) begin : ram_1k_generate 
    //
    if (C_FAMILY == "S6") begin: s6 
      //
      assign address_a[13:0] = {address[9:0], 4'b0000};
      assign instruction = {data_out_a[33:32], data_out_a[15:0]};
      assign data_in_a = {34'b0000000000000000000000000000000000, address[11:10]};
      assign jtag_dout = {data_out_b[33:32], data_out_b[15:0]};
      //
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b = {2'b00, data_out_b[33:32], 16'b0000000000000000, data_out_b[15:0]};
        assign address_b[13:0] = 14'b00000000000000;
        assign we_b[3:0] = 4'b0000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
      end // no_loader;
      //
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b = {2'b00, jtag_din[17:16], 16'b0000000000000000, jtag_din[15:0]};
        assign address_b[13:0] = {jtag_addr[9:0], 4'b0000};
        assign we_b[3:0] = {jtag_we, jtag_we, jtag_we, jtag_we};
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
      end // loader;
      // 
      RAMB16BWER #(.DATA_WIDTH_A        (18),
                   .DOA_REG             (0),
                   .EN_RSTRAM_A         ("FALSE"),
                   .INIT_A              (9'b000000000),
                   .RST_PRIORITY_A      ("CE"),
                   .SRVAL_A             (9'b000000000),
                   .WRITE_MODE_A        ("WRITE_FIRST"),
                   .DATA_WIDTH_B        (18),
                   .DOB_REG             (0),
                   .EN_RSTRAM_B         ("FALSE"),
                   .INIT_B              (9'b000000000),
                   .RST_PRIORITY_B      ("CE"),
                   .SRVAL_B             (9'b000000000),
                   .WRITE_MODE_B        ("WRITE_FIRST"),
                   .RSTTYPE             ("SYNC"),
                   .INIT_FILE           ("NONE"),
                   .SIM_COLLISION_CHECK ("ALL"),
                   .SIM_DEVICE          ("SPARTAN6"),
                   .INIT_00             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_01             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_02             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_03             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_04             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_05             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_06             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_07             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_08             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_09             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_0A             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_0B             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_0C             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_0D             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_0E             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_0F             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_10             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_11             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_12             (256'h144B14A3141314D2149714C5140B142A0FE0147B04C0FFFFEA7B200020002000),
                   .INIT_13             (256'h24C0159C1590157F151B150D150B150A150915081507150017FE1B001A00140F),
                   .INIT_14             (256'h54D254C5542A4FE0547B44C037FE3B0F3AFF340F344B34D234C5342A2FE0347B),
                   .INIT_15             (256'h77FE7B007A00740F744B74D274C5742A6FE0747B64C057FE5B005A00540F544B),
                   .INIT_16             (256'hF4C5F42AEFE0F47BE4C0D7FEDB00DA00D40FD44BD4D2D4C5D42ACFE0D47BC4C0),
                   .INIT_17             (256'h1B001A00140F144B14D214C5142A0FE0147B04C0F8FDFB00FA00F40FF44BF4D2),
                   .INIT_18             (256'h942A8FE0947B84C038FD3B003A00340F344B34D234C5342A2FE0347B24C017FE),
                   .INIT_19             (256'hBA00B40FB44BB4D2B4C5B42AAFE0B47BA4C097FE9B009A00940F944B94D294C5),
                   .INIT_1A             (256'hF47BE4C0D87FD8FEDB00DA00D40FD44BD4D2D4C5D42ACFE0D47BC4C0B8FDBB00),
                   .INIT_1B             (256'h44004F0444044F0744074F064406F8FDFB00FA00F40FF44BF4D2F4C5F42AEFE0),
                   .INIT_1C             (256'h200E2B2627E44F0C440C4F0844084F0A440A4F0F440F4F0E440E4F0244024F00),
                   .INIT_1D             (256'h67E4E000E345EB26E7E4200023452B2627E4A000A345AB26A7E42000297D2064),
                   .INIT_1E             (256'hC7E40FFF03450B2607E4800083458B2687E4000003450B2607E4600063456B26),
                   .INIT_1F             (256'hF408F426F43FF43F5000D0001000900050004FFF43454B2647E4C000C345CB26),
                   .INIT_20             (256'hC4B0DF2AD480D426D43FD43FA4E0A4B0BF2AB408B426B43FB43FE4E0E4B0FF2A),
                   .INIT_21             (256'h150E14051310120C111B100F4F80448084E084B09F2A94809426943F943FC4E0),
                   .INIT_22             (256'hBD24BBBAB7BDBA5B4FE04BA06FE06BA090009001800080016FE064C070017000),
                   .INIT_23             (256'hB692B4E2B202B732B612B772B202B732B692B682B542BFE6BA56B248B6D8B0C4),
                   .INIT_24             (256'hB692B202B742B6E2B612B692B6C2B6C2B692B722B622B202B732B272B6B2B632),
                   .INIT_25             (256'hB3FBB342B312B302B322B202B792B612B4D2B202B362B312B2E2B612B652B642),
                   .INIT_26             (256'hB05BB09BB07BB08BB08BB00BB04BB6FBB7FBB07BB7DBB6DBB66BB4FBB5BBB06B),
                   .INIT_27             (256'h140F1424144B14D21F7B14E7142A147BB00BB02BB03BB02BB00BB09BB09BB01B),
                   .INIT_28             (256'h147414201464146114681420146E1465144B142014741475144217FE1B001A00),
                   .INIT_29             (256'h140D142E1474146914201474146E1465146D1465146C1470146D14691420146F),
                   .INIT_2A             (256'h147D146D1466144F145B1406143F140014351431143A14371432143A14321431),
                   .INIT_2B             (256'h1403140214001409140914011405140914071408140814001404146F147F1407),
                   .INIT_2C             (256'h2000200020002000200020002000200020002000200020002000200014001402),
                   .INIT_2D             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_2E             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_2F             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_30             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_31             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_32             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_33             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_34             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_35             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_36             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_37             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_38             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_39             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_3A             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_3B             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_3C             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_3D             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_3E             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INIT_3F             (256'h2000200020002000200020002000200020002000200020002000200020002000),
                   .INITP_00            (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                   .INITP_01            (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                   .INITP_02            (256'h5555500000000000000000000000000000000000000003AAAAAAAAAAAAAAAAAA),
                   .INITP_03            (256'hAAFFBFFFFFFFEABFFFFFFFEAA955555555555555555555555555555555555555),
                   .INITP_04            (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5F00050002AAA0002A),
                   .INITP_05            (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                   .INITP_06            (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                   .INITP_07            (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA))
       kcpsm6_rom( .ADDRA               (address_a[13:0]),
                   .ENA                 (enable),
                   .CLKA                (clk),
                   .DOA                 (data_out_a[31:0]),
                   .DOPA                (data_out_a[35:32]), 
                   .DIA                 (data_in_a[31:0]),
                   .DIPA                (data_in_a[35:32]), 
                   .WEA                 (4'b0000),
                   .REGCEA              (1'b0),
                   .RSTA                (1'b0),
                   .ADDRB               (address_b[13:0]),
                   .ENB                 (enable_b),
                   .CLKB                (clk_b),
                   .DOB                 (data_out_b[31:0]),
                   .DOPB                (data_out_b[35:32]), 
                   .DIB                 (data_in_b[31:0]),
                   .DIPB                (data_in_b[35:32]), 
                   .WEB                 (we_b[3:0]),
                   .REGCEB              (1'b0),
                   .RSTB                (1'b0));
    end // s6;
    // 
    //
    if (C_FAMILY == "V6") begin: v6 
      //
      assign address_a[13:0] = {address[9:0], 4'b1111};
      assign instruction = data_out_a[17:0];
      assign data_in_a[17:0] = {16'b0000000000000000, address[11:10]};
      assign jtag_dout = data_out_b[17:0];
      //
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b[17:0] = data_out_b[17:0];
        assign address_b[13:0] = 14'b11111111111111;
        assign we_b[3:0] = 4'b0000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
      end // no_loader;
      //
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b[17:0] = jtag_din[17:0];
        assign address_b[13:0] = {jtag_addr[9:0], 4'b1111};
        assign we_b[3:0] = {jtag_we, jtag_we, jtag_we, jtag_we};
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
      end // loader;
      // 
      RAMB18E1 #(.READ_WIDTH_A              (18),
                 .WRITE_WIDTH_A             (18),
                 .DOA_REG                   (0),
                 .INIT_A                    (18'b000000000000000000),
                 .RSTREG_PRIORITY_A         ("REGCE"),
                 .SRVAL_A                   (18'b000000000000000000),
                 .WRITE_MODE_A              ("WRITE_FIRST"),
                 .READ_WIDTH_B              (18),
                 .WRITE_WIDTH_B             (18),
                 .DOB_REG                   (0),
                 .INIT_B                    (18'b000000000000000000),
                 .RSTREG_PRIORITY_B         ("REGCE"),
                 .SRVAL_B                   (18'b000000000000000000),
                 .WRITE_MODE_B              ("WRITE_FIRST"),
                 .INIT_FILE                 ("NONE"),
                 .SIM_COLLISION_CHECK       ("ALL"),
                 .RAM_MODE                  ("TDP"),
                 .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
                 .SIM_DEVICE                ("VIRTEX6"),
                 .INIT_00                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_01                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_02                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_03                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_04                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_05                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_06                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_07                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_08                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_09                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_10                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_11                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_12                   (256'h144B14A3141314D2149714C5140B142A0FE0147B04C0FFFFEA7B200020002000),
                 .INIT_13                   (256'h24C0159C1590157F151B150D150B150A150915081507150017FE1B001A00140F),
                 .INIT_14                   (256'h54D254C5542A4FE0547B44C037FE3B0F3AFF340F344B34D234C5342A2FE0347B),
                 .INIT_15                   (256'h77FE7B007A00740F744B74D274C5742A6FE0747B64C057FE5B005A00540F544B),
                 .INIT_16                   (256'hF4C5F42AEFE0F47BE4C0D7FEDB00DA00D40FD44BD4D2D4C5D42ACFE0D47BC4C0),
                 .INIT_17                   (256'h1B001A00140F144B14D214C5142A0FE0147B04C0F8FDFB00FA00F40FF44BF4D2),
                 .INIT_18                   (256'h942A8FE0947B84C038FD3B003A00340F344B34D234C5342A2FE0347B24C017FE),
                 .INIT_19                   (256'hBA00B40FB44BB4D2B4C5B42AAFE0B47BA4C097FE9B009A00940F944B94D294C5),
                 .INIT_1A                   (256'hF47BE4C0D87FD8FEDB00DA00D40FD44BD4D2D4C5D42ACFE0D47BC4C0B8FDBB00),
                 .INIT_1B                   (256'h44004F0444044F0744074F064406F8FDFB00FA00F40FF44BF4D2F4C5F42AEFE0),
                 .INIT_1C                   (256'h200E2B2627E44F0C440C4F0844084F0A440A4F0F440F4F0E440E4F0244024F00),
                 .INIT_1D                   (256'h67E4E000E345EB26E7E4200023452B2627E4A000A345AB26A7E42000297D2064),
                 .INIT_1E                   (256'hC7E40FFF03450B2607E4800083458B2687E4000003450B2607E4600063456B26),
                 .INIT_1F                   (256'hF408F426F43FF43F5000D0001000900050004FFF43454B2647E4C000C345CB26),
                 .INIT_20                   (256'hC4B0DF2AD480D426D43FD43FA4E0A4B0BF2AB408B426B43FB43FE4E0E4B0FF2A),
                 .INIT_21                   (256'h150E14051310120C111B100F4F80448084E084B09F2A94809426943F943FC4E0),
                 .INIT_22                   (256'hBD24BBBAB7BDBA5B4FE04BA06FE06BA090009001800080016FE064C070017000),
                 .INIT_23                   (256'hB692B4E2B202B732B612B772B202B732B692B682B542BFE6BA56B248B6D8B0C4),
                 .INIT_24                   (256'hB692B202B742B6E2B612B692B6C2B6C2B692B722B622B202B732B272B6B2B632),
                 .INIT_25                   (256'hB3FBB342B312B302B322B202B792B612B4D2B202B362B312B2E2B612B652B642),
                 .INIT_26                   (256'hB05BB09BB07BB08BB08BB00BB04BB6FBB7FBB07BB7DBB6DBB66BB4FBB5BBB06B),
                 .INIT_27                   (256'h140F1424144B14D21F7B14E7142A147BB00BB02BB03BB02BB00BB09BB09BB01B),
                 .INIT_28                   (256'h147414201464146114681420146E1465144B142014741475144217FE1B001A00),
                 .INIT_29                   (256'h140D142E1474146914201474146E1465146D1465146C1470146D14691420146F),
                 .INIT_2A                   (256'h147D146D1466144F145B1406143F140014351431143A14371432143A14321431),
                 .INIT_2B                   (256'h1403140214001409140914011405140914071408140814001404146F147F1407),
                 .INIT_2C                   (256'h2000200020002000200020002000200020002000200020002000200014001402),
                 .INIT_2D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_2E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_2F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_30                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_31                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_32                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_33                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_34                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_35                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_36                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_37                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_38                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_39                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INITP_00                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_01                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_02                  (256'h5555500000000000000000000000000000000000000003AAAAAAAAAAAAAAAAAA),
                 .INITP_03                  (256'hAAFFBFFFFFFFEABFFFFFFFEAA955555555555555555555555555555555555555),
                 .INITP_04                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5F00050002AAA0002A),
                 .INITP_05                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_06                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_07                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA))
     kcpsm6_rom( .ADDRARDADDR               (address_a[13:0]),
                 .ENARDEN                   (enable),
                 .CLKARDCLK                 (clk),
                 .DOADO                     (data_out_a[15:0]),
                 .DOPADOP                   (data_out_a[17:16]), 
                 .DIADI                     (data_in_a[15:0]),
                 .DIPADIP                   (data_in_a[17:16]), 
                 .WEA                       (2'b00),
                 .REGCEAREGCE               (1'b0),
                 .RSTRAMARSTRAM             (1'b0),
                 .RSTREGARSTREG             (1'b0),
                 .ADDRBWRADDR               (address_b[13:0]),
                 .ENBWREN                   (enable_b),
                 .CLKBWRCLK                 (clk_b),
                 .DOBDO                     (data_out_b[15:0]),
                 .DOPBDOP                   (data_out_b[17:16]), 
                 .DIBDI                     (data_in_b[15:0]),
                 .DIPBDIP                   (data_in_b[17:16]), 
                 .WEBWE                     (we_b[3:0]),
                 .REGCEB                    (1'b0),
                 .RSTRAMB                   (1'b0),
                 .RSTREGB                   (1'b0));
    end // v6;  
    // 
    //
    if (C_FAMILY == "7S") begin: akv7 
      //
      assign address_a[13:0] = {address[9:0], 4'b1111};
      assign instruction = data_out_a[17:0];
      assign data_in_a[17:0] = {16'b0000000000000000, address[11:10]};
      assign jtag_dout = data_out_b[17:0];
      //
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b[17:0] = data_out_b[17:0];
        assign address_b[13:0] = 14'b11111111111111;
        assign we_b[3:0] = 4'b0000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
      end // no_loader;
      //
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b[17:0] = jtag_din[17:0];
        assign address_b[13:0] = {jtag_addr[9:0], 4'b1111};
        assign we_b[3:0] = {jtag_we, jtag_we, jtag_we, jtag_we};
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
      end // loader;
      // 
      RAMB18E1 #(.READ_WIDTH_A              (18),
                 .WRITE_WIDTH_A             (18),
                 .DOA_REG                   (0),
                 .INIT_A                    (18'b000000000000000000),
                 .RSTREG_PRIORITY_A         ("REGCE"),
                 .SRVAL_A                   (18'b000000000000000000),
                 .WRITE_MODE_A              ("WRITE_FIRST"),
                 .READ_WIDTH_B              (18),
                 .WRITE_WIDTH_B             (18),
                 .DOB_REG                   (0),
                 .INIT_B                    (18'b000000000000000000),
                 .RSTREG_PRIORITY_B         ("REGCE"),
                 .SRVAL_B                   (18'b000000000000000000),
                 .WRITE_MODE_B              ("WRITE_FIRST"),
                 .INIT_FILE                 ("NONE"),
                 .SIM_COLLISION_CHECK       ("ALL"),
                 .RAM_MODE                  ("TDP"),
                 .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
                 .SIM_DEVICE                ("7SERIES"),
                 .INIT_00                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_01                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_02                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_03                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_04                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_05                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_06                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_07                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_08                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_09                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_10                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_11                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_12                   (256'h144B14A3141314D2149714C5140B142A0FE0147B04C0FFFFEA7B200020002000),
                 .INIT_13                   (256'h24C0159C1590157F151B150D150B150A150915081507150017FE1B001A00140F),
                 .INIT_14                   (256'h54D254C5542A4FE0547B44C037FE3B0F3AFF340F344B34D234C5342A2FE0347B),
                 .INIT_15                   (256'h77FE7B007A00740F744B74D274C5742A6FE0747B64C057FE5B005A00540F544B),
                 .INIT_16                   (256'hF4C5F42AEFE0F47BE4C0D7FEDB00DA00D40FD44BD4D2D4C5D42ACFE0D47BC4C0),
                 .INIT_17                   (256'h1B001A00140F144B14D214C5142A0FE0147B04C0F8FDFB00FA00F40FF44BF4D2),
                 .INIT_18                   (256'h942A8FE0947B84C038FD3B003A00340F344B34D234C5342A2FE0347B24C017FE),
                 .INIT_19                   (256'hBA00B40FB44BB4D2B4C5B42AAFE0B47BA4C097FE9B009A00940F944B94D294C5),
                 .INIT_1A                   (256'hF47BE4C0D87FD8FEDB00DA00D40FD44BD4D2D4C5D42ACFE0D47BC4C0B8FDBB00),
                 .INIT_1B                   (256'h44004F0444044F0744074F064406F8FDFB00FA00F40FF44BF4D2F4C5F42AEFE0),
                 .INIT_1C                   (256'h200E2B2627E44F0C440C4F0844084F0A440A4F0F440F4F0E440E4F0244024F00),
                 .INIT_1D                   (256'h67E4E000E345EB26E7E4200023452B2627E4A000A345AB26A7E42000297D2064),
                 .INIT_1E                   (256'hC7E40FFF03450B2607E4800083458B2687E4000003450B2607E4600063456B26),
                 .INIT_1F                   (256'hF408F426F43FF43F5000D0001000900050004FFF43454B2647E4C000C345CB26),
                 .INIT_20                   (256'hC4B0DF2AD480D426D43FD43FA4E0A4B0BF2AB408B426B43FB43FE4E0E4B0FF2A),
                 .INIT_21                   (256'h150E14051310120C111B100F4F80448084E084B09F2A94809426943F943FC4E0),
                 .INIT_22                   (256'hBD24BBBAB7BDBA5B4FE04BA06FE06BA090009001800080016FE064C070017000),
                 .INIT_23                   (256'hB692B4E2B202B732B612B772B202B732B692B682B542BFE6BA56B248B6D8B0C4),
                 .INIT_24                   (256'hB692B202B742B6E2B612B692B6C2B6C2B692B722B622B202B732B272B6B2B632),
                 .INIT_25                   (256'hB3FBB342B312B302B322B202B792B612B4D2B202B362B312B2E2B612B652B642),
                 .INIT_26                   (256'hB05BB09BB07BB08BB08BB00BB04BB6FBB7FBB07BB7DBB6DBB66BB4FBB5BBB06B),
                 .INIT_27                   (256'h140F1424144B14D21F7B14E7142A147BB00BB02BB03BB02BB00BB09BB09BB01B),
                 .INIT_28                   (256'h147414201464146114681420146E1465144B142014741475144217FE1B001A00),
                 .INIT_29                   (256'h140D142E1474146914201474146E1465146D1465146C1470146D14691420146F),
                 .INIT_2A                   (256'h147D146D1466144F145B1406143F140014351431143A14371432143A14321431),
                 .INIT_2B                   (256'h1403140214001409140914011405140914071408140814001404146F147F1407),
                 .INIT_2C                   (256'h2000200020002000200020002000200020002000200020002000200014001402),
                 .INIT_2D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_2E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_2F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_30                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_31                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_32                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_33                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_34                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_35                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_36                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_37                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_38                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_39                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INITP_00                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_01                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_02                  (256'h5555500000000000000000000000000000000000000003AAAAAAAAAAAAAAAAAA),
                 .INITP_03                  (256'hAAFFBFFFFFFFEABFFFFFFFEAA955555555555555555555555555555555555555),
                 .INITP_04                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5F00050002AAA0002A),
                 .INITP_05                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_06                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_07                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA))
     kcpsm6_rom( .ADDRARDADDR               (address_a[13:0]),
                 .ENARDEN                   (enable),
                 .CLKARDCLK                 (clk),
                 .DOADO                     (data_out_a[15:0]),
                 .DOPADOP                   (data_out_a[17:16]), 
                 .DIADI                     (data_in_a[15:0]),
                 .DIPADIP                   (data_in_a[17:16]), 
                 .WEA                       (2'b00),
                 .REGCEAREGCE               (1'b0),
                 .RSTRAMARSTRAM             (1'b0),
                 .RSTREGARSTREG             (1'b0),
                 .ADDRBWRADDR               (address_b[13:0]),
                 .ENBWREN                   (enable_b),
                 .CLKBWRCLK                 (clk_b),
                 .DOBDO                     (data_out_b[15:0]),
                 .DOPBDOP                   (data_out_b[17:16]), 
                 .DIBDI                     (data_in_b[15:0]),
                 .DIPBDIP                   (data_in_b[17:16]), 
                 .WEBWE                     (we_b[3:0]),
                 .REGCEB                    (1'b0),
                 .RSTRAMB                   (1'b0),
                 .RSTREGB                   (1'b0));
    end // akv7;  
    // 
  end // ram_1k_generate;
endgenerate
//  
generate
  if (C_RAM_SIZE_KWORDS == 2) begin : ram_2k_generate 
    //
    if (C_FAMILY == "S6") begin: s6 
      //
      assign address_a[13:0] = {address[10:0], 3'b000};
      assign instruction = {data_out_a_h[32], data_out_a_h[7:0], data_out_a_l[32], data_out_a_l[7:0]};
      assign data_in_a = {35'b00000000000000000000000000000000000, address[11]};
      assign jtag_dout = {data_out_b_h[32], data_out_b_h[7:0], data_out_b_l[32], data_out_b_l[7:0]};
      //
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b_l = {3'b000, data_out_b_l[32], 24'b000000000000000000000000, data_out_b_l[7:0]};
        assign data_in_b_h = {3'b000, data_out_b_h[32], 24'b000000000000000000000000, data_out_b_h[7:0]};
        assign address_b[13:0] = 14'b00000000000000;
        assign we_b[3:0] = 4'b0000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
      end // no_loader;
      //
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b_h = {3'b000, jtag_din[17], 24'b000000000000000000000000, jtag_din[16:9]};
        assign data_in_b_l = {3'b000, jtag_din[8],  24'b000000000000000000000000, jtag_din[7:0]};
        assign address_b[13:0] = {jtag_addr[10:0], 3'b000};
        assign we_b[3:0] = {jtag_we, jtag_we, jtag_we, jtag_we};
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
      end // loader;
      // 
      RAMB16BWER #(.DATA_WIDTH_A        (9),
                   .DOA_REG             (0),
                   .EN_RSTRAM_A         ("FALSE"),
                   .INIT_A              (9'b000000000),
                   .RST_PRIORITY_A      ("CE"),
                   .SRVAL_A             (9'b000000000),
                   .WRITE_MODE_A        ("WRITE_FIRST"),
                   .DATA_WIDTH_B        (9),
                   .DOB_REG             (0),
                   .EN_RSTRAM_B         ("FALSE"),
                   .INIT_B              (9'b000000000),
                   .RST_PRIORITY_B      ("CE"),
                   .SRVAL_B             (9'b000000000),
                   .WRITE_MODE_B        ("WRITE_FIRST"),
                   .RSTTYPE             ("SYNC"),
                   .INIT_FILE           ("NONE"),
                   .SIM_COLLISION_CHECK ("ALL"),
                   .SIM_DEVICE          ("SPARTAN6"),
                   .INIT_00             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_01             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_02             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_03             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_04             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_05             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_06             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_07             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_08             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_09             (256'hC09C907F1B0D0B0A09080700FE00000F4BA313D297C50B2AE07BC0FF7B000000),
                   .INIT_0A             (256'hFE00000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0FE0FFF0F4BD2C52AE07B),
                   .INIT_0B             (256'h00000F4BD2C52AE07BC0FD00000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0),
                   .INIT_0C             (256'h000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0FD00000F4BD2C52AE07BC0FE),
                   .INIT_0D             (256'h00040407070606FD00000F4BD2C52AE07BC07FFE00000F4BD2C52AE07BC0FD00),
                   .INIT_0E             (256'hE4004526E4004526E4004526E4007D640E26E40C0C08080A0A0F0F0E0E020200),
                   .INIT_0F             (256'h08263F3F0000000000FF4526E4004526E4FF4526E4004526E4004526E4004526),
                   .INIT_10             (256'h0E05100C1B0F8080E0B02A80263F3FE0B02A80263F3FE0B02A08263F3FE0B02A),
                   .INIT_11             (256'h92E2023212720232928242E65648D8C424BABD5BE0A0E0A000010001E0C00100),
                   .INIT_12             (256'hFB42120222029212D2026212E2125242920242E21292C2C2922222023272B232),
                   .INIT_13             (256'h0F244BD27BE72A7B0B2B3B2B0B9B9B1B5B9B7B8B8B0B4BFBFB7BDBDB6BFBBB6B),
                   .INIT_14             (256'h0D2E746920746E656D656C706D69206F7420646168206E654B20747542FE0000),
                   .INIT_15             (256'h030200090901050907080800046F7F077D6D664F5B063F0035313A37323A3231),
                   .INIT_16             (256'h0000000000000000000000000000000000000000000000000000000000000002),
                   .INIT_17             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_18             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_19             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1A             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1B             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1C             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1D             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1E             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1F             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_20             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_21             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_22             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_23             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_24             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_25             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_26             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_27             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_28             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_29             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2A             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2B             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2C             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2D             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2E             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2F             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_30             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_31             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_32             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_33             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_34             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_35             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_36             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_37             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_38             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_39             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3A             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3B             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3C             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3D             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3E             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3F             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_00            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_01            (256'h007BFBBBBBBA7555548108110260440981102604C09813027FFC009000000000),
                   .INITP_02            (256'h00000000000000000000000000000006080000A2FA3020481530EF08AA204081),
                   .INITP_03            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_04            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_05            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_06            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_07            (256'h0000000000000000000000000000000000000000000000000000000000000000))
     kcpsm6_rom_l( .ADDRA               (address_a[13:0]),
                   .ENA                 (enable),
                   .CLKA                (clk),
                   .DOA                 (data_out_a_l[31:0]),
                   .DOPA                (data_out_a_l[35:32]), 
                   .DIA                 (data_in_a[31:0]),
                   .DIPA                (data_in_a[35:32]), 
                   .WEA                 (4'b0000),
                   .REGCEA              (1'b0),
                   .RSTA                (1'b0),
                   .ADDRB               (address_b[13:0]),
                   .ENB                 (enable_b),
                   .CLKB                (clk_b),
                   .DOB                 (data_out_b_l[31:0]),
                   .DOPB                (data_out_b_l[35:32]), 
                   .DIB                 (data_in_b_l[31:0]),
                   .DIPB                (data_in_b_l[35:32]), 
                   .WEB                 (we_b[3:0]),
                   .REGCEB              (1'b0),
                   .RSTB                (1'b0));
      // 
      RAMB16BWER #(.DATA_WIDTH_A        (9),
                   .DOA_REG             (0),
                   .EN_RSTRAM_A         ("FALSE"),
                   .INIT_A              (9'b000000000),
                   .RST_PRIORITY_A      ("CE"),
                   .SRVAL_A             (9'b000000000),
                   .WRITE_MODE_A        ("WRITE_FIRST"),
                   .DATA_WIDTH_B        (9),
                   .DOB_REG             (0),
                   .EN_RSTRAM_B         ("FALSE"),
                   .INIT_B              (9'b000000000),
                   .RST_PRIORITY_B      ("CE"),
                   .SRVAL_B             (9'b000000000),
                   .WRITE_MODE_B        ("WRITE_FIRST"),
                   .RSTTYPE             ("SYNC"),
                   .INIT_FILE           ("NONE"),
                   .SIM_COLLISION_CHECK ("ALL"),
                   .SIM_DEVICE          ("SPARTAN6"),
                   .INIT_00             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_01             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_02             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_03             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_04             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_05             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_06             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_07             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_08             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_09             (256'h120A0A0A0A0A0A0A0A0A0A0A0B0D0D0A0A0A0A0A0A0A0A0A070A02FF75101010),
                   .INIT_0A             (256'h3B3D3D3A3A3A3A3A373A322B2D2D2A2A2A2A2A272A221B1D1D1A1A1A1A1A171A),
                   .INIT_0B             (256'h8D8D8A8A8A8A8A878A827C7D7D7A7A7A7A7A777A726B6D6D6A6A6A6A6A676A62),
                   .INIT_0C             (256'hDDDADADADADAD7DAD2CBCDCDCACACACACAC7CAC29C9D9D9A9A9A9A9A979A928B),
                   .INIT_0D             (256'hA2A7A2A7A2A7A2FCFDFDFAFAFAFAFAF7FAF2ECECEDEDEAEAEAEAEAE7EAE2DCDD),
                   .INIT_0E             (256'hB3F0F1F5F390919593D0D1D5D3101410101513A7A2A7A2A7A2A7A2A7A2A7A2A7),
                   .INIT_0F             (256'h7A7A7A7AA8E888C828A7A1A5A3E0E1E5E387818583C0C1C5C300010503B0B1B5),
                   .INIT_10             (256'h0A0A09090808A7A242424F4A4A4A4A62626F6A6A6A6A52525F5A5A5A5A72727F),
                   .INIT_11             (256'h5B5A595B5B5B595B5B5B5A5F5D595B585E5D5B5D2725373548484040B7B2B8B8),
                   .INIT_12             (256'h5959595959595B5B5A595959595B5B5B5B595B5B5B5B5B5B5B5B5B595B595B5B),
                   .INIT_13             (256'h0A0A0A0A0F0A0A0A5858585858585858585858585858585B5B585B5B5B5A5A58),
                   .INIT_14             (256'h0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0B0D0D),
                   .INIT_15             (256'h0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A),
                   .INIT_16             (256'h1010101010101010101010101010101010101010101010101010101010100A0A),
                   .INIT_17             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_18             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_19             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1A             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1B             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1C             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1D             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1E             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1F             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_20             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_21             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_22             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_23             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_24             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_25             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_26             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_27             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_28             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_29             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2A             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2B             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2C             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2D             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2E             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2F             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_30             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_31             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_32             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_33             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_34             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_35             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_36             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_37             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_38             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_39             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3A             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3B             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3C             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3D             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3E             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3F             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INITP_00            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_01            (256'hFFFFFFFFFFFFE000000000000000000000000000000000000000001FFFFFFFFF),
                   .INITP_02            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30001FC07),
                   .INITP_03            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_04            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_05            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_06            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_07            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
     kcpsm6_rom_h( .ADDRA               (address_a[13:0]),
                   .ENA                 (enable),
                   .CLKA                (clk),
                   .DOA                 (data_out_a_h[31:0]),
                   .DOPA                (data_out_a_h[35:32]), 
                   .DIA                 (data_in_a[31:0]),
                   .DIPA                (data_in_a[35:32]), 
                   .WEA                 (4'b0000),
                   .REGCEA              (1'b0),
                   .RSTA                (1'b0),
                   .ADDRB               (address_b[13:0]),
                   .ENB                 (enable_b),
                   .CLKB                (clk_b),
                   .DOB                 (data_out_b_h[31:0]),
                   .DOPB                (data_out_b_h[35:32]), 
                   .DIB                 (data_in_b_h[31:0]),
                   .DIPB                (data_in_b_h[35:32]), 
                   .WEB                 (we_b[3:0]),
                   .REGCEB              (1'b0),
                   .RSTB                (1'b0));
    end // s6;
    // 
    // 
    if (C_FAMILY == "V6") begin: v6 
      //
      assign address_a = {1'b1, address[10:0], 4'b1111};
      assign instruction = {data_out_a[33:32], data_out_a[15:0]};
      assign data_in_a = {35'b00000000000000000000000000000000000, address[11]};
      assign jtag_dout = {data_out_b[33:32], data_out_b[15:0]};
      //
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b = {2'b00, data_out_b[33:32], 16'b0000000000000000, data_out_b[15:0]};
        assign address_b = 16'b1111111111111111;
        assign we_b = 8'b00000000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
      end // no_loader;
      //
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b = {2'b00, jtag_din[17:16], 16'b0000000000000000, jtag_din[15:0]};
        assign address_b = {1'b1, jtag_addr[10:0], 4'b1111};
        assign we_b = {jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we};
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
      end // loader;
      // 
      RAMB36E1 #(.READ_WIDTH_A              (18),
                 .WRITE_WIDTH_A             (18),
                 .DOA_REG                   (0),
                 .INIT_A                    (36'h000000000),
                 .RSTREG_PRIORITY_A         ("REGCE"),
                 .SRVAL_A                   (36'h000000000),
                 .WRITE_MODE_A              ("WRITE_FIRST"),
                 .READ_WIDTH_B              (18),
                 .WRITE_WIDTH_B             (18),
                 .DOB_REG                   (0),
                 .INIT_B                    (36'h000000000),
                 .RSTREG_PRIORITY_B         ("REGCE"),
                 .SRVAL_B                   (36'h000000000),
                 .WRITE_MODE_B              ("WRITE_FIRST"),
                 .INIT_FILE                 ("NONE"),
                 .SIM_COLLISION_CHECK       ("ALL"),
                 .RAM_MODE                  ("TDP"),
                 .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
                 .EN_ECC_READ               ("FALSE"),
                 .EN_ECC_WRITE              ("FALSE"),
                 .RAM_EXTENSION_A           ("NONE"),
                 .RAM_EXTENSION_B           ("NONE"),
                 .SIM_DEVICE                ("VIRTEX6"),
                 .INIT_00                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_01                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_02                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_03                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_04                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_05                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_06                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_07                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_08                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_09                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_10                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_11                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_12                   (256'h144B14A3141314D2149714C5140B142A0FE0147B04C0FFFFEA7B200020002000),
                 .INIT_13                   (256'h24C0159C1590157F151B150D150B150A150915081507150017FE1B001A00140F),
                 .INIT_14                   (256'h54D254C5542A4FE0547B44C037FE3B0F3AFF340F344B34D234C5342A2FE0347B),
                 .INIT_15                   (256'h77FE7B007A00740F744B74D274C5742A6FE0747B64C057FE5B005A00540F544B),
                 .INIT_16                   (256'hF4C5F42AEFE0F47BE4C0D7FEDB00DA00D40FD44BD4D2D4C5D42ACFE0D47BC4C0),
                 .INIT_17                   (256'h1B001A00140F144B14D214C5142A0FE0147B04C0F8FDFB00FA00F40FF44BF4D2),
                 .INIT_18                   (256'h942A8FE0947B84C038FD3B003A00340F344B34D234C5342A2FE0347B24C017FE),
                 .INIT_19                   (256'hBA00B40FB44BB4D2B4C5B42AAFE0B47BA4C097FE9B009A00940F944B94D294C5),
                 .INIT_1A                   (256'hF47BE4C0D87FD8FEDB00DA00D40FD44BD4D2D4C5D42ACFE0D47BC4C0B8FDBB00),
                 .INIT_1B                   (256'h44004F0444044F0744074F064406F8FDFB00FA00F40FF44BF4D2F4C5F42AEFE0),
                 .INIT_1C                   (256'h200E2B2627E44F0C440C4F0844084F0A440A4F0F440F4F0E440E4F0244024F00),
                 .INIT_1D                   (256'h67E4E000E345EB26E7E4200023452B2627E4A000A345AB26A7E42000297D2064),
                 .INIT_1E                   (256'hC7E40FFF03450B2607E4800083458B2687E4000003450B2607E4600063456B26),
                 .INIT_1F                   (256'hF408F426F43FF43F5000D0001000900050004FFF43454B2647E4C000C345CB26),
                 .INIT_20                   (256'hC4B0DF2AD480D426D43FD43FA4E0A4B0BF2AB408B426B43FB43FE4E0E4B0FF2A),
                 .INIT_21                   (256'h150E14051310120C111B100F4F80448084E084B09F2A94809426943F943FC4E0),
                 .INIT_22                   (256'hBD24BBBAB7BDBA5B4FE04BA06FE06BA090009001800080016FE064C070017000),
                 .INIT_23                   (256'hB692B4E2B202B732B612B772B202B732B692B682B542BFE6BA56B248B6D8B0C4),
                 .INIT_24                   (256'hB692B202B742B6E2B612B692B6C2B6C2B692B722B622B202B732B272B6B2B632),
                 .INIT_25                   (256'hB3FBB342B312B302B322B202B792B612B4D2B202B362B312B2E2B612B652B642),
                 .INIT_26                   (256'hB05BB09BB07BB08BB08BB00BB04BB6FBB7FBB07BB7DBB6DBB66BB4FBB5BBB06B),
                 .INIT_27                   (256'h140F1424144B14D21F7B14E7142A147BB00BB02BB03BB02BB00BB09BB09BB01B),
                 .INIT_28                   (256'h147414201464146114681420146E1465144B142014741475144217FE1B001A00),
                 .INIT_29                   (256'h140D142E1474146914201474146E1465146D1465146C1470146D14691420146F),
                 .INIT_2A                   (256'h147D146D1466144F145B1406143F140014351431143A14371432143A14321431),
                 .INIT_2B                   (256'h1403140214001409140914011405140914071408140814001404146F147F1407),
                 .INIT_2C                   (256'h2000200020002000200020002000200020002000200020002000200014001402),
                 .INIT_2D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_2E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_2F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_30                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_31                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_32                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_33                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_34                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_35                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_36                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_37                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_38                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_39                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_40                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_41                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_42                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_43                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_44                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_45                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_46                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_47                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_48                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_49                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_50                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_51                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_52                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_53                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_54                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_55                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_56                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_57                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_58                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_59                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_60                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_61                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_62                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_63                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_64                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_65                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_66                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_67                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_68                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_69                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_70                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_71                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_72                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_73                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_74                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_75                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_76                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_77                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_78                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_79                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INITP_00                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_01                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_02                  (256'h5555500000000000000000000000000000000000000003AAAAAAAAAAAAAAAAAA),
                 .INITP_03                  (256'hAAFFBFFFFFFFEABFFFFFFFEAA955555555555555555555555555555555555555),
                 .INITP_04                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5F00050002AAA0002A),
                 .INITP_05                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_06                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_07                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_08                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_09                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0A                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0B                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0C                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0D                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0E                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0F                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA))
     kcpsm6_rom( .ADDRARDADDR               (address_a),
                 .ENARDEN                   (enable),
                 .CLKARDCLK                 (clk),
                 .DOADO                     (data_out_a[31:0]),
                 .DOPADOP                   (data_out_a[35:32]), 
                 .DIADI                     (data_in_a[31:0]),
                 .DIPADIP                   (data_in_a[35:32]), 
                 .WEA                       (4'b0000),
                 .REGCEAREGCE               (1'b0),
                 .RSTRAMARSTRAM             (1'b0),
                 .RSTREGARSTREG             (1'b0),
                 .ADDRBWRADDR               (address_b),
                 .ENBWREN                   (enable_b),
                 .CLKBWRCLK                 (clk_b),
                 .DOBDO                     (data_out_b[31:0]),
                 .DOPBDOP                   (data_out_b[35:32]), 
                 .DIBDI                     (data_in_b[31:0]),
                 .DIPBDIP                   (data_in_b[35:32]), 
                 .WEBWE                     (we_b),
                 .REGCEB                    (1'b0),
                 .RSTRAMB                   (1'b0),
                 .RSTREGB                   (1'b0),
                 .CASCADEINA                (1'b0),
                 .CASCADEINB                (1'b0),
                 .CASCADEOUTA               (),
                 .CASCADEOUTB               (),
                 .DBITERR                   (),
                 .ECCPARITY                 (),
                 .RDADDRECC                 (),
                 .SBITERR                   (),
                 .INJECTDBITERR             (1'b0),       
                 .INJECTSBITERR             (1'b0));   
    end // v6;  
    // 
    // 
    if (C_FAMILY == "7S") begin: akv7 
      //
      assign address_a = {1'b1, address[10:0], 4'b1111};
      assign instruction = {data_out_a[33:32], data_out_a[15:0]};
      assign data_in_a = {35'b00000000000000000000000000000000000, address[11]};
      assign jtag_dout = {data_out_b[33:32], data_out_b[15:0]};
      //
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b = {2'b00, data_out_b[33:32], 16'b0000000000000000, data_out_b[15:0]};
        assign address_b = 16'b1111111111111111;
        assign we_b = 8'b00000000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
      end // no_loader;
      //
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b = {2'b00, jtag_din[17:16], 16'b0000000000000000, jtag_din[15:0]};
        assign address_b = {1'b1, jtag_addr[10:0], 4'b1111};
        assign we_b = {jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we};
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
      end // loader;
      // 
      RAMB36E1 #(.READ_WIDTH_A              (18),
                 .WRITE_WIDTH_A             (18),
                 .DOA_REG                   (0),
                 .INIT_A                    (36'h000000000),
                 .RSTREG_PRIORITY_A         ("REGCE"),
                 .SRVAL_A                   (36'h000000000),
                 .WRITE_MODE_A              ("WRITE_FIRST"),
                 .READ_WIDTH_B              (18),
                 .WRITE_WIDTH_B             (18),
                 .DOB_REG                   (0),
                 .INIT_B                    (36'h000000000),
                 .RSTREG_PRIORITY_B         ("REGCE"),
                 .SRVAL_B                   (36'h000000000),
                 .WRITE_MODE_B              ("WRITE_FIRST"),
                 .INIT_FILE                 ("NONE"),
                 .SIM_COLLISION_CHECK       ("ALL"),
                 .RAM_MODE                  ("TDP"),
                 .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
                 .EN_ECC_READ               ("FALSE"),
                 .EN_ECC_WRITE              ("FALSE"),
                 .RAM_EXTENSION_A           ("NONE"),
                 .RAM_EXTENSION_B           ("NONE"),
                 .SIM_DEVICE                ("7SERIES"),
                 .INIT_00                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_01                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_02                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_03                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_04                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_05                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_06                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_07                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_08                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_09                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_0F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_10                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_11                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_12                   (256'h144B14A3141314D2149714C5140B142A0FE0147B04C0FFFFEA7B200020002000),
                 .INIT_13                   (256'h24C0159C1590157F151B150D150B150A150915081507150017FE1B001A00140F),
                 .INIT_14                   (256'h54D254C5542A4FE0547B44C037FE3B0F3AFF340F344B34D234C5342A2FE0347B),
                 .INIT_15                   (256'h77FE7B007A00740F744B74D274C5742A6FE0747B64C057FE5B005A00540F544B),
                 .INIT_16                   (256'hF4C5F42AEFE0F47BE4C0D7FEDB00DA00D40FD44BD4D2D4C5D42ACFE0D47BC4C0),
                 .INIT_17                   (256'h1B001A00140F144B14D214C5142A0FE0147B04C0F8FDFB00FA00F40FF44BF4D2),
                 .INIT_18                   (256'h942A8FE0947B84C038FD3B003A00340F344B34D234C5342A2FE0347B24C017FE),
                 .INIT_19                   (256'hBA00B40FB44BB4D2B4C5B42AAFE0B47BA4C097FE9B009A00940F944B94D294C5),
                 .INIT_1A                   (256'hF47BE4C0D87FD8FEDB00DA00D40FD44BD4D2D4C5D42ACFE0D47BC4C0B8FDBB00),
                 .INIT_1B                   (256'h44004F0444044F0744074F064406F8FDFB00FA00F40FF44BF4D2F4C5F42AEFE0),
                 .INIT_1C                   (256'h200E2B2627E44F0C440C4F0844084F0A440A4F0F440F4F0E440E4F0244024F00),
                 .INIT_1D                   (256'h67E4E000E345EB26E7E4200023452B2627E4A000A345AB26A7E42000297D2064),
                 .INIT_1E                   (256'hC7E40FFF03450B2607E4800083458B2687E4000003450B2607E4600063456B26),
                 .INIT_1F                   (256'hF408F426F43FF43F5000D0001000900050004FFF43454B2647E4C000C345CB26),
                 .INIT_20                   (256'hC4B0DF2AD480D426D43FD43FA4E0A4B0BF2AB408B426B43FB43FE4E0E4B0FF2A),
                 .INIT_21                   (256'h150E14051310120C111B100F4F80448084E084B09F2A94809426943F943FC4E0),
                 .INIT_22                   (256'hBD24BBBAB7BDBA5B4FE04BA06FE06BA090009001800080016FE064C070017000),
                 .INIT_23                   (256'hB692B4E2B202B732B612B772B202B732B692B682B542BFE6BA56B248B6D8B0C4),
                 .INIT_24                   (256'hB692B202B742B6E2B612B692B6C2B6C2B692B722B622B202B732B272B6B2B632),
                 .INIT_25                   (256'hB3FBB342B312B302B322B202B792B612B4D2B202B362B312B2E2B612B652B642),
                 .INIT_26                   (256'hB05BB09BB07BB08BB08BB00BB04BB6FBB7FBB07BB7DBB6DBB66BB4FBB5BBB06B),
                 .INIT_27                   (256'h140F1424144B14D21F7B14E7142A147BB00BB02BB03BB02BB00BB09BB09BB01B),
                 .INIT_28                   (256'h147414201464146114681420146E1465144B142014741475144217FE1B001A00),
                 .INIT_29                   (256'h140D142E1474146914201474146E1465146D1465146C1470146D14691420146F),
                 .INIT_2A                   (256'h147D146D1466144F145B1406143F140014351431143A14371432143A14321431),
                 .INIT_2B                   (256'h1403140214001409140914011405140914071408140814001404146F147F1407),
                 .INIT_2C                   (256'h2000200020002000200020002000200020002000200020002000200014001402),
                 .INIT_2D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_2E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_2F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_30                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_31                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_32                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_33                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_34                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_35                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_36                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_37                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_38                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_39                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_3F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_40                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_41                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_42                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_43                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_44                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_45                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_46                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_47                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_48                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_49                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_4F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_50                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_51                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_52                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_53                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_54                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_55                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_56                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_57                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_58                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_59                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_5F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_60                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_61                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_62                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_63                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_64                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_65                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_66                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_67                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_68                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_69                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_6F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_70                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_71                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_72                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_73                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_74                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_75                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_76                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_77                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_78                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_79                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7A                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7B                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7C                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7D                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7E                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INIT_7F                   (256'h2000200020002000200020002000200020002000200020002000200020002000),
                 .INITP_00                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_01                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_02                  (256'h5555500000000000000000000000000000000000000003AAAAAAAAAAAAAAAAAA),
                 .INITP_03                  (256'hAAFFBFFFFFFFEABFFFFFFFEAA955555555555555555555555555555555555555),
                 .INITP_04                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5F00050002AAA0002A),
                 .INITP_05                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_06                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_07                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_08                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_09                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0A                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0B                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0C                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0D                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0E                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
                 .INITP_0F                  (256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA))
     kcpsm6_rom( .ADDRARDADDR               (address_a),
                 .ENARDEN                   (enable),
                 .CLKARDCLK                 (clk),
                 .DOADO                     (data_out_a[31:0]),
                 .DOPADOP                   (data_out_a[35:32]), 
                 .DIADI                     (data_in_a[31:0]),
                 .DIPADIP                   (data_in_a[35:32]), 
                 .WEA                       (4'b0000),
                 .REGCEAREGCE               (1'b0),
                 .RSTRAMARSTRAM             (1'b0),
                 .RSTREGARSTREG             (1'b0),
                 .ADDRBWRADDR               (address_b),
                 .ENBWREN                   (enable_b),
                 .CLKBWRCLK                 (clk_b),
                 .DOBDO                     (data_out_b[31:0]),
                 .DOPBDOP                   (data_out_b[35:32]), 
                 .DIBDI                     (data_in_b[31:0]),
                 .DIPBDIP                   (data_in_b[35:32]), 
                 .WEBWE                     (we_b),
                 .REGCEB                    (1'b0),
                 .RSTRAMB                   (1'b0),
                 .RSTREGB                   (1'b0),
                 .CASCADEINA                (1'b0),
                 .CASCADEINB                (1'b0),
                 .CASCADEOUTA               (),
                 .CASCADEOUTB               (),
                 .DBITERR                   (),
                 .ECCPARITY                 (),
                 .RDADDRECC                 (),
                 .SBITERR                   (),
                 .INJECTDBITERR             (1'b0),       
                 .INJECTSBITERR             (1'b0));   
    end // akv7;  
    // 
  end // ram_2k_generate;
endgenerate              
//
generate
  if (C_RAM_SIZE_KWORDS == 4) begin : ram_4k_generate 
    if (C_FAMILY == "S6") begin: s6 
      //
      assign address_a[13:0] = {address[10:0], 3'b000};
      assign data_in_a = 36'b000000000000000000000000000000000000;
      //
      FD s6_a11_flop ( .D      (address[11]),
                       .Q      (pipe_a11),
                       .C      (clk));
      //
      LUT6_2 # (       .INIT   (64'hFF00F0F0CCCCAAAA))
       s6_4k_mux0_lut( .I0     (data_out_a_ll[0]),
                       .I1     (data_out_a_hl[0]),
                       .I2     (data_out_a_ll[1]),
                       .I3     (data_out_a_hl[1]),
                       .I4     (pipe_a11),
                       .I5     (1'b1),
                       .O5     (instruction[0]),
                       .O6     (instruction[1]));
      //
      LUT6_2 # (       .INIT   (64'hFF00F0F0CCCCAAAA))
       s6_4k_mux2_lut( .I0     (data_out_a_ll[2]),
                       .I1     (data_out_a_hl[2]),
                       .I2     (data_out_a_ll[3]),
                       .I3     (data_out_a_hl[3]),
                       .I4     (pipe_a11),
                       .I5     (1'b1),
                       .O5     (instruction[2]),
                       .O6     (instruction[3]));
      //
      LUT6_2 # (       .INIT   (64'hFF00F0F0CCCCAAAA))
       s6_4k_mux4_lut( .I0     (data_out_a_ll[4]),
                       .I1     (data_out_a_hl[4]),
                       .I2     (data_out_a_ll[5]),
                       .I3     (data_out_a_hl[5]),
                       .I4     (pipe_a11),
                       .I5     (1'b1),
                       .O5     (instruction[4]),
                       .O6     (instruction[5]));
      //
      LUT6_2 # (       .INIT   (64'hFF00F0F0CCCCAAAA))
       s6_4k_mux6_lut( .I0     (data_out_a_ll[6]),
                       .I1     (data_out_a_hl[6]),
                       .I2     (data_out_a_ll[7]),
                       .I3     (data_out_a_hl[7]),
                       .I4     (pipe_a11),
                       .I5     (1'b1),
                       .O5     (instruction[6]),
                       .O6     (instruction[7]));
      //
      LUT6_2 # (       .INIT   (64'hFF00F0F0CCCCAAAA))
       s6_4k_mux8_lut( .I0     (data_out_a_ll[32]),
                       .I1     (data_out_a_hl[32]),
                       .I2     (data_out_a_lh[0]),
                       .I3     (data_out_a_hh[0]),
                       .I4     (pipe_a11),
                       .I5     (1'b1),
                       .O5     (instruction[8]),
                       .O6     (instruction[9]));
      //
      LUT6_2 # (       .INIT   (64'hFF00F0F0CCCCAAAA))
      s6_4k_mux10_lut( .I0     (data_out_a_lh[1]),
                       .I1     (data_out_a_hh[1]),
                       .I2     (data_out_a_lh[2]),
                       .I3     (data_out_a_hh[2]),
                       .I4     (pipe_a11),
                       .I5     (1'b1),
                       .O5     (instruction[10]),
                       .O6     (instruction[11]));
      //
      LUT6_2 # (       .INIT   (64'hFF00F0F0CCCCAAAA))
      s6_4k_mux12_lut( .I0     (data_out_a_lh[3]),
                       .I1     (data_out_a_hh[3]),
                       .I2     (data_out_a_lh[4]),
                       .I3     (data_out_a_hh[4]),
                       .I4     (pipe_a11),
                       .I5     (1'b1),
                       .O5     (instruction[12]),
                       .O6     (instruction[13]));
      //
      LUT6_2 # (       .INIT   (64'hFF00F0F0CCCCAAAA))
      s6_4k_mux14_lut( .I0     (data_out_a_lh[5]),
                       .I1     (data_out_a_hh[5]),
                       .I2     (data_out_a_lh[6]),
                       .I3     (data_out_a_hh[6]),
                       .I4     (pipe_a11),
                       .I5     (1'b1),
                       .O5     (instruction[14]),
                       .O6     (instruction[15]));
      //
      LUT6_2 # (       .INIT   (64'hFF00F0F0CCCCAAAA))
      s6_4k_mux16_lut( .I0     (data_out_a_lh[7]),
                       .I1     (data_out_a_hh[7]),
                       .I2     (data_out_a_lh[32]),
                       .I3     (data_out_a_hh[32]),
                       .I4     (pipe_a11),
                       .I5     (1'b1),
                       .O5     (instruction[16]),
                       .O6     (instruction[17]));
      //
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b_ll = {3'b000, data_out_b_ll[32], 24'b000000000000000000000000, data_out_b_ll[7:0]};
        assign data_in_b_lh = {3'b000, data_out_b_lh[32], 24'b000000000000000000000000, data_out_b_lh[7:0]};
        assign data_in_b_hl = {3'b000, data_out_b_hl[32], 24'b000000000000000000000000, data_out_b_hl[7:0]};
        assign data_in_b_hh = {3'b000, data_out_b_hh[32], 24'b000000000000000000000000, data_out_b_hh[7:0]};
        assign address_b[13:0] = 14'b00000000000000;
        assign we_b_l[3:0] = 4'b0000;
        assign we_b_h[3:0] = 4'b0000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
        assign jtag_dout = {data_out_b_h[32], data_out_b_h[7:0], data_out_b_l[32], data_out_b_l[7:0]};
      end // no_loader;
      //
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b_lh = {3'b000, jtag_din[17], 24'b000000000000000000000000, jtag_din[16:9]};
        assign data_in_b_ll = {3'b000, jtag_din[8],  24'b000000000000000000000000, jtag_din[7:0]};
        assign data_in_b_hh = {3'b000, jtag_din[17], 24'b000000000000000000000000, jtag_din[16:9]};
        assign data_in_b_hl = {3'b000, jtag_din[8],  24'b000000000000000000000000, jtag_din[7:0]};
        assign address_b[13:0] = {jtag_addr[10:0], 3'b000};
        //
        LUT6_2 # (         .INIT   (64'h8000000020000000))
        s6_4k_jtag_we_lut( .I0     (jtag_we),
                           .I1     (jtag_addr[11]),
                           .I2     (1'b1),
                           .I3     (1'b1),
                           .I4     (1'b1),
                           .I5     (1'b1),
                           .O5     (jtag_we_l),
                           .O6     (jtag_we_h));
        //
        assign we_b_l[3:0] = {jtag_we_l, jtag_we_l, jtag_we_l, jtag_we_l};
        assign we_b_h[3:0] = {jtag_we_h, jtag_we_h, jtag_we_h, jtag_we_h};
        //
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
        //
        LUT6_2 # (            .INIT   (64'hFF00F0F0CCCCAAAA))
         s6_4k_jtag_mux0_lut( .I0     (data_out_b_ll[0]),
                              .I1     (data_out_b_hl[0]),
                              .I2     (data_out_b_ll[1]),
                              .I3     (data_out_b_hl[1]),
                              .I4     (jtag_addr[11]),
                              .I5     (1'b1),
                              .O5     (jtag_dout[0]),
                              .O6     (jtag_dout[1]));
        //
        LUT6_2 # (            .INIT   (64'hFF00F0F0CCCCAAAA))
         s6_4k_jtag_mux2_lut( .I0     (data_out_b_ll[2]),
                              .I1     (data_out_b_hl[2]),
                              .I2     (data_out_b_ll[3]),
                              .I3     (data_out_b_hl[3]),
                              .I4     (jtag_addr[11]),
                              .I5     (1'b1),
                              .O5     (jtag_dout[2]),
                              .O6     (jtag_dout[3]));
        //
        LUT6_2 # (            .INIT   (64'hFF00F0F0CCCCAAAA))
         s6_4k_jtag_mux4_lut( .I0     (data_out_b_ll[4]),
                              .I1     (data_out_b_hl[4]),
                              .I2     (data_out_b_ll[5]),
                              .I3     (data_out_b_hl[5]),
                              .I4     (jtag_addr[11]),
                              .I5     (1'b1),
                              .O5     (jtag_dout[4]),
                              .O6     (jtag_dout[5]));
        //
        LUT6_2 # (            .INIT   (64'hFF00F0F0CCCCAAAA))
         s6_4k_jtag_mux6_lut( .I0     (data_out_b_ll[6]),
                              .I1     (data_out_b_hl[6]),
                              .I2     (data_out_b_ll[7]),
                              .I3     (data_out_b_hl[7]),
                              .I4     (jtag_addr[11]),
                              .I5     (1'b1),
                              .O5     (jtag_dout[6]),
                              .O6     (jtag_dout[7]));
        //
        LUT6_2 # (            .INIT   (64'hFF00F0F0CCCCAAAA))
         s6_4k_jtag_mux8_lut( .I0     (data_out_b_ll[32]),
                              .I1     (data_out_b_hl[32]),
                              .I2     (data_out_b_lh[0]),
                              .I3     (data_out_b_hh[0]),
                              .I4     (jtag_addr[11]),
                              .I5     (1'b1),
                              .O5     (jtag_dout[8]),
                              .O6     (jtag_dout[9]));
        //
        LUT6_2 # (            .INIT   (64'hFF00F0F0CCCCAAAA))
        s6_4k_jtag_mux10_lut( .I0     (data_out_b_lh[1]),
                              .I1     (data_out_b_hh[1]),
                              .I2     (data_out_b_lh[2]),
                              .I3     (data_out_b_hh[2]),
                              .I4     (jtag_addr[11]),
                              .I5     (1'b1),
                              .O5     (jtag_dout[10]),
                              .O6     (jtag_dout[11]));
        //
        LUT6_2 # (            .INIT   (64'hFF00F0F0CCCCAAAA))
        s6_4k_jtag_mux12_lut( .I0     (data_out_b_lh[3]),
                              .I1     (data_out_b_hh[3]),
                              .I2     (data_out_b_lh[4]),
                              .I3     (data_out_b_hh[4]),
                              .I4     (jtag_addr[11]),
                              .I5     (1'b1),
                              .O5     (jtag_dout[12]),
                              .O6     (jtag_dout[13]));
        //
        LUT6_2 # (            .INIT   (64'hFF00F0F0CCCCAAAA))
        s6_4k_jtag_mux14_lut( .I0     (data_out_b_lh[5]),
                              .I1     (data_out_b_hh[5]),
                              .I2     (data_out_b_lh[6]),
                              .I3     (data_out_b_hh[6]),
                              .I4     (jtag_addr[11]),
                              .I5     (1'b1),
                              .O5     (jtag_dout[14]),
                              .O6     (jtag_dout[15]));
        //
        LUT6_2 # (            .INIT   (64'hFF00F0F0CCCCAAAA))
        s6_4k_jtag_mux16_lut( .I0     (data_out_b_lh[7]),
                              .I1     (data_out_b_hh[7]),
                              .I2     (data_out_b_lh[32]),
                              .I3     (data_out_b_hh[32]),
                              .I4     (jtag_addr[11]),
                              .I5     (1'b1),
                              .O5     (jtag_dout[16]),
                              .O6     (jtag_dout[17]));
        //
      end // loader;
      // 
      RAMB16BWER #(.DATA_WIDTH_A        (9),
                   .DOA_REG             (0),
                   .EN_RSTRAM_A         ("FALSE"),
                   .INIT_A              (9'b000000000),
                   .RST_PRIORITY_A      ("CE"),
                   .SRVAL_A             (9'b000000000),
                   .WRITE_MODE_A        ("WRITE_FIRST"),
                   .DATA_WIDTH_B        (9),
                   .DOB_REG             (0),
                   .EN_RSTRAM_B         ("FALSE"),
                   .INIT_B              (9'b000000000),
                   .RST_PRIORITY_B      ("CE"),
                   .SRVAL_B             (9'b000000000),
                   .WRITE_MODE_B        ("WRITE_FIRST"),
                   .RSTTYPE             ("SYNC"),
                   .INIT_FILE           ("NONE"),
                   .SIM_COLLISION_CHECK ("ALL"),
                   .SIM_DEVICE          ("SPARTAN6"),
                   .INIT_00             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_01             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_02             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_03             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_04             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_05             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_06             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_07             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_08             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_09             (256'hC09C907F1B0D0B0A09080700FE00000F4BA313D297C50B2AE07BC0FF7B000000),
                   .INIT_0A             (256'hFE00000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0FE0FFF0F4BD2C52AE07B),
                   .INIT_0B             (256'h00000F4BD2C52AE07BC0FD00000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0),
                   .INIT_0C             (256'h000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0FD00000F4BD2C52AE07BC0FE),
                   .INIT_0D             (256'h00040407070606FD00000F4BD2C52AE07BC07FFE00000F4BD2C52AE07BC0FD00),
                   .INIT_0E             (256'hE4004526E4004526E4004526E4007D640E26E40C0C08080A0A0F0F0E0E020200),
                   .INIT_0F             (256'h08263F3F0000000000FF4526E4004526E4FF4526E4004526E4004526E4004526),
                   .INIT_10             (256'h0E05100C1B0F8080E0B02A80263F3FE0B02A80263F3FE0B02A08263F3FE0B02A),
                   .INIT_11             (256'h92E2023212720232928242E65648D8C424BABD5BE0A0E0A000010001E0C00100),
                   .INIT_12             (256'hFB42120222029212D2026212E2125242920242E21292C2C2922222023272B232),
                   .INIT_13             (256'h0F244BD27BE72A7B0B2B3B2B0B9B9B1B5B9B7B8B8B0B4BFBFB7BDBDB6BFBBB6B),
                   .INIT_14             (256'h0D2E746920746E656D656C706D69206F7420646168206E654B20747542FE0000),
                   .INIT_15             (256'h030200090901050907080800046F7F077D6D664F5B063F0035313A37323A3231),
                   .INIT_16             (256'h0000000000000000000000000000000000000000000000000000000000000002),
                   .INIT_17             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_18             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_19             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1A             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1B             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1C             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1D             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1E             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1F             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_20             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_21             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_22             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_23             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_24             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_25             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_26             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_27             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_28             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_29             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2A             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2B             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2C             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2D             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2E             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2F             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_30             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_31             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_32             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_33             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_34             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_35             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_36             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_37             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_38             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_39             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3A             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3B             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3C             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3D             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3E             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3F             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_00            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_01            (256'h007BFBBBBBBA7555548108110260440981102604C09813027FFC009000000000),
                   .INITP_02            (256'h00000000000000000000000000000006080000A2FA3020481530EF08AA204081),
                   .INITP_03            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_04            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_05            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_06            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_07            (256'h0000000000000000000000000000000000000000000000000000000000000000))
    kcpsm6_rom_ll( .ADDRA               (address_a[13:0]),
                   .ENA                 (enable),
                   .CLKA                (clk),
                   .DOA                 (data_out_a_ll[31:0]),
                   .DOPA                (data_out_a_ll[35:32]), 
                   .DIA                 (data_in_a[31:0]),
                   .DIPA                (data_in_a[35:32]), 
                   .WEA                 (4'b0000),
                   .REGCEA              (1'b0),
                   .RSTA                (1'b0),
                   .ADDRB               (address_b[13:0]),
                   .ENB                 (enable_b),
                   .CLKB                (clk_b),
                   .DOB                 (data_out_b_ll[31:0]),
                   .DOPB                (data_out_b_ll[35:32]), 
                   .DIB                 (data_in_b_ll[31:0]),
                   .DIPB                (data_in_b_ll[35:32]), 
                   .WEB                 (we_b_l[3:0]),
                   .REGCEB              (1'b0),
                   .RSTB                (1'b0));
      // 
      RAMB16BWER #(.DATA_WIDTH_A        (9),
                   .DOA_REG             (0),
                   .EN_RSTRAM_A         ("FALSE"),
                   .INIT_A              (9'b000000000),
                   .RST_PRIORITY_A      ("CE"),
                   .SRVAL_A             (9'b000000000),
                   .WRITE_MODE_A        ("WRITE_FIRST"),
                   .DATA_WIDTH_B        (9),
                   .DOB_REG             (0),
                   .EN_RSTRAM_B         ("FALSE"),
                   .INIT_B              (9'b000000000),
                   .RST_PRIORITY_B      ("CE"),
                   .SRVAL_B             (9'b000000000),
                   .WRITE_MODE_B        ("WRITE_FIRST"),
                   .RSTTYPE             ("SYNC"),
                   .INIT_FILE           ("NONE"),
                   .SIM_COLLISION_CHECK ("ALL"),
                   .SIM_DEVICE          ("SPARTAN6"),
                   .INIT_00             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_01             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_02             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_03             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_04             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_05             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_06             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_07             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_08             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_09             (256'h120A0A0A0A0A0A0A0A0A0A0A0B0D0D0A0A0A0A0A0A0A0A0A070A02FF75101010),
                   .INIT_0A             (256'h3B3D3D3A3A3A3A3A373A322B2D2D2A2A2A2A2A272A221B1D1D1A1A1A1A1A171A),
                   .INIT_0B             (256'h8D8D8A8A8A8A8A878A827C7D7D7A7A7A7A7A777A726B6D6D6A6A6A6A6A676A62),
                   .INIT_0C             (256'hDDDADADADADAD7DAD2CBCDCDCACACACACAC7CAC29C9D9D9A9A9A9A9A979A928B),
                   .INIT_0D             (256'hA2A7A2A7A2A7A2FCFDFDFAFAFAFAFAF7FAF2ECECEDEDEAEAEAEAEAE7EAE2DCDD),
                   .INIT_0E             (256'hB3F0F1F5F390919593D0D1D5D3101410101513A7A2A7A2A7A2A7A2A7A2A7A2A7),
                   .INIT_0F             (256'h7A7A7A7AA8E888C828A7A1A5A3E0E1E5E387818583C0C1C5C300010503B0B1B5),
                   .INIT_10             (256'h0A0A09090808A7A242424F4A4A4A4A62626F6A6A6A6A52525F5A5A5A5A72727F),
                   .INIT_11             (256'h5B5A595B5B5B595B5B5B5A5F5D595B585E5D5B5D2725373548484040B7B2B8B8),
                   .INIT_12             (256'h5959595959595B5B5A595959595B5B5B5B595B5B5B5B5B5B5B5B5B595B595B5B),
                   .INIT_13             (256'h0A0A0A0A0F0A0A0A5858585858585858585858585858585B5B585B5B5B5A5A58),
                   .INIT_14             (256'h0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0B0D0D),
                   .INIT_15             (256'h0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A),
                   .INIT_16             (256'h1010101010101010101010101010101010101010101010101010101010100A0A),
                   .INIT_17             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_18             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_19             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1A             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1B             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1C             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1D             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1E             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1F             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_20             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_21             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_22             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_23             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_24             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_25             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_26             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_27             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_28             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_29             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2A             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2B             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2C             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2D             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2E             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2F             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_30             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_31             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_32             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_33             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_34             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_35             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_36             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_37             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_38             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_39             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3A             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3B             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3C             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3D             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3E             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3F             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INITP_00            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_01            (256'hFFFFFFFFFFFFE000000000000000000000000000000000000000001FFFFFFFFF),
                   .INITP_02            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30001FC07),
                   .INITP_03            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_04            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_05            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_06            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_07            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
    kcpsm6_rom_lh( .ADDRA               (address_a[13:0]),
                   .ENA                 (enable),
                   .CLKA                (clk),
                   .DOA                 (data_out_a_lh[31:0]),
                   .DOPA                (data_out_a_lh[35:32]), 
                   .DIA                 (data_in_a[31:0]),
                   .DIPA                (data_in_a[35:32]), 
                   .WEA                 (4'b0000),
                   .REGCEA              (1'b0),
                   .RSTA                (1'b0),
                   .ADDRB               (address_b[13:0]),
                   .ENB                 (enable_b),
                   .CLKB                (clk_b),
                   .DOB                 (data_out_b_lh[31:0]),
                   .DOPB                (data_out_b_lh[35:32]), 
                   .DIB                 (data_in_b_lh[31:0]),
                   .DIPB                (data_in_b_lh[35:32]), 
                   .WEB                 (we_b_l[3:0]),
                   .REGCEB              (1'b0),
                   .RSTB                (1'b0));
      // 
      RAMB16BWER #(.DATA_WIDTH_A        (9),
                   .DOA_REG             (0),
                   .EN_RSTRAM_A         ("FALSE"),
                   .INIT_A              (9'b000000000),
                   .RST_PRIORITY_A      ("CE"),
                   .SRVAL_A             (9'b000000000),
                   .WRITE_MODE_A        ("WRITE_FIRST"),
                   .DATA_WIDTH_B        (9),
                   .DOB_REG             (0),
                   .EN_RSTRAM_B         ("FALSE"),
                   .INIT_B              (9'b000000000),
                   .RST_PRIORITY_B      ("CE"),
                   .SRVAL_B             (9'b000000000),
                   .WRITE_MODE_B        ("WRITE_FIRST"),
                   .RSTTYPE             ("SYNC"),
                   .INIT_FILE           ("NONE"),
                   .SIM_COLLISION_CHECK ("ALL"),
                   .SIM_DEVICE          ("SPARTAN6"),
                   .INIT_00             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_01             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_02             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_03             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_04             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_05             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_06             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_07             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_08             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_09             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_0A             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_0B             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_0C             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_0D             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_0E             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_0F             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_10             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_11             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_12             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_13             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_14             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_15             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_16             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_17             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_18             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_19             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1A             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1B             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1C             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1D             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1E             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_1F             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_20             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_21             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_22             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_23             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_24             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_25             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_26             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_27             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_28             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_29             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2A             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2B             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2C             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2D             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2E             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_2F             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_30             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_31             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_32             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_33             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_34             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_35             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_36             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_37             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_38             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_39             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3A             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3B             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3C             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3D             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3E             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INIT_3F             (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_00            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_01            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_02            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_03            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_04            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_05            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_06            (256'h0000000000000000000000000000000000000000000000000000000000000000),
                   .INITP_07            (256'h0000000000000000000000000000000000000000000000000000000000000000))
    kcpsm6_rom_hl( .ADDRA               (address_a[13:0]),
                   .ENA                 (enable),
                   .CLKA                (clk),
                   .DOA                 (data_out_a_hl[31:0]),
                   .DOPA                (data_out_a_hl[35:32]), 
                   .DIA                 (data_in_a[31:0]),
                   .DIPA                (data_in_a[35:32]), 
                   .WEA                 (4'b0000),
                   .REGCEA              (1'b0),
                   .RSTA                (1'b0),
                   .ADDRB               (address_b[13:0]),
                   .ENB                 (enable_b),
                   .CLKB                (clk_b),
                   .DOB                 (data_out_b_hl[31:0]),
                   .DOPB                (data_out_b_hl[35:32]), 
                   .DIB                 (data_in_b_hl[31:0]),
                   .DIPB                (data_in_b_hl[35:32]), 
                   .WEB                 (we_b_h[3:0]),
                   .REGCEB              (1'b0),
                   .RSTB                (1'b0));
      // 
      RAMB16BWER #(.DATA_WIDTH_A        (9),
                   .DOA_REG             (0),
                   .EN_RSTRAM_A         ("FALSE"),
                   .INIT_A              (9'b000000000),
                   .RST_PRIORITY_A      ("CE"),
                   .SRVAL_A             (9'b000000000),
                   .WRITE_MODE_A        ("WRITE_FIRST"),
                   .DATA_WIDTH_B        (9),
                   .DOB_REG             (0),
                   .EN_RSTRAM_B         ("FALSE"),
                   .INIT_B              (9'b000000000),
                   .RST_PRIORITY_B      ("CE"),
                   .SRVAL_B             (9'b000000000),
                   .WRITE_MODE_B        ("WRITE_FIRST"),
                   .RSTTYPE             ("SYNC"),
                   .INIT_FILE           ("NONE"),
                   .SIM_COLLISION_CHECK ("ALL"),
                   .SIM_DEVICE          ("SPARTAN6"),
                   .INIT_00             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_01             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_02             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_03             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_04             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_05             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_06             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_07             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_08             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_09             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_0A             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_0B             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_0C             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_0D             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_0E             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_0F             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_10             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_11             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_12             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_13             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_14             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_15             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_16             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_17             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_18             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_19             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1A             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1B             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1C             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1D             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1E             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_1F             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_20             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_21             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_22             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_23             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_24             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_25             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_26             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_27             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_28             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_29             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2A             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2B             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2C             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2D             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2E             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_2F             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_30             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_31             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_32             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_33             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_34             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_35             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_36             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_37             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_38             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_39             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3A             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3B             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3C             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3D             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3E             (256'h1010101010101010101010101010101010101010101010101010101010101010),
                   .INIT_3F             (256'h2810101010101010101010101010101010101010101010101010101010101010),
                   .INITP_00            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_01            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_02            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_03            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_04            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_05            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_06            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                   .INITP_07            (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
    kcpsm6_rom_hh( .ADDRA               (address_a[13:0]),
                   .ENA                 (enable),
                   .CLKA                (clk),
                   .DOA                 (data_out_a_hh[31:0]),
                   .DOPA                (data_out_a_hh[35:32]), 
                   .DIA                 (data_in_a[31:0]),
                   .DIPA                (data_in_a[35:32]), 
                   .WEA                 (4'b0000),
                   .REGCEA              (1'b0),
                   .RSTA                (1'b0),
                   .ADDRB               (address_b[13:0]),
                   .ENB                 (enable_b),
                   .CLKB                (clk_b),
                   .DOB                 (data_out_b_hh[31:0]),
                   .DOPB                (data_out_b_hh[35:32]), 
                   .DIB                 (data_in_b_hh[31:0]),
                   .DIPB                (data_in_b_hh[35:32]), 
                   .WEB                 (we_b_h[3:0]),
                   .REGCEB              (1'b0),
                   .RSTB                (1'b0));
      //
    end // s6;
    //
    //
    if (C_FAMILY == "V6") begin: v6 
      //
      assign address_a = {1'b1, address[11:0], 3'b111};
      assign instruction = {data_out_a_h[32], data_out_a_h[7:0], data_out_a_l[32], data_out_a_l[7:0]};
      assign data_in_a = 36'b00000000000000000000000000000000000;
      assign jtag_dout = {data_out_b_h[32], data_out_b_h[7:0], data_out_b_l[32], data_out_b_l[7:0]};
      //
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b_l = {3'b000, data_out_b_l[32], 24'b000000000000000000000000, data_out_b_l[7:0]};
        assign data_in_b_h = {3'b000, data_out_b_h[32], 24'b000000000000000000000000, data_out_b_h[7:0]};
        assign address_b = 16'b1111111111111111;
        assign we_b = 8'b00000000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
      end // no_loader;
      //
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b_h = {3'b000, jtag_din[17], 24'b000000000000000000000000, jtag_din[16:9]};
        assign data_in_b_l = {3'b000, jtag_din[8],  24'b000000000000000000000000, jtag_din[7:0]};
        assign address_b = {1'b1, jtag_addr[11:0], 3'b111};
        assign we_b = {jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we};
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
      end // loader;
      // 
      RAMB36E1 #(.READ_WIDTH_A              (9),
                 .WRITE_WIDTH_A             (9),
                 .DOA_REG                   (0),
                 .INIT_A                    (36'h000000000),
                 .RSTREG_PRIORITY_A         ("REGCE"),
                 .SRVAL_A                   (36'h000000000),
                 .WRITE_MODE_A              ("WRITE_FIRST"),
                 .READ_WIDTH_B              (9),
                 .WRITE_WIDTH_B             (9),
                 .DOB_REG                   (0),
                 .INIT_B                    (36'h000000000),
                 .RSTREG_PRIORITY_B         ("REGCE"),
                 .SRVAL_B                   (36'h000000000),
                 .WRITE_MODE_B              ("WRITE_FIRST"),
                 .INIT_FILE                 ("NONE"),
                 .SIM_COLLISION_CHECK       ("ALL"),
                 .RAM_MODE                  ("TDP"),
                 .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
                 .EN_ECC_READ               ("FALSE"),
                 .EN_ECC_WRITE              ("FALSE"),
                 .RAM_EXTENSION_A           ("NONE"),
                 .RAM_EXTENSION_B           ("NONE"),
                 .SIM_DEVICE                ("VIRTEX6"),
                 .INIT_00                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_01                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_02                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_03                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_04                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_05                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_06                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_07                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_08                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_09                   (256'hC09C907F1B0D0B0A09080700FE00000F4BA313D297C50B2AE07BC0FF7B000000),
                 .INIT_0A                   (256'hFE00000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0FE0FFF0F4BD2C52AE07B),
                 .INIT_0B                   (256'h00000F4BD2C52AE07BC0FD00000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0),
                 .INIT_0C                   (256'h000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0FD00000F4BD2C52AE07BC0FE),
                 .INIT_0D                   (256'h00040407070606FD00000F4BD2C52AE07BC07FFE00000F4BD2C52AE07BC0FD00),
                 .INIT_0E                   (256'hE4004526E4004526E4004526E4007D640E26E40C0C08080A0A0F0F0E0E020200),
                 .INIT_0F                   (256'h08263F3F0000000000FF4526E4004526E4FF4526E4004526E4004526E4004526),
                 .INIT_10                   (256'h0E05100C1B0F8080E0B02A80263F3FE0B02A80263F3FE0B02A08263F3FE0B02A),
                 .INIT_11                   (256'h92E2023212720232928242E65648D8C424BABD5BE0A0E0A000010001E0C00100),
                 .INIT_12                   (256'hFB42120222029212D2026212E2125242920242E21292C2C2922222023272B232),
                 .INIT_13                   (256'h0F244BD27BE72A7B0B2B3B2B0B9B9B1B5B9B7B8B8B0B4BFBFB7BDBDB6BFBBB6B),
                 .INIT_14                   (256'h0D2E746920746E656D656C706D69206F7420646168206E654B20747542FE0000),
                 .INIT_15                   (256'h030200090901050907080800046F7F077D6D664F5B063F0035313A37323A3231),
                 .INIT_16                   (256'h0000000000000000000000000000000000000000000000000000000000000002),
                 .INIT_17                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_18                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_19                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_20                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_21                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_22                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_23                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_24                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_25                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_26                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_27                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_28                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_29                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_30                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_31                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_32                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_33                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_34                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_35                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_36                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_37                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_38                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_39                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_40                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_41                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_42                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_43                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_44                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_45                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_46                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_47                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_48                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_49                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_50                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_51                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_52                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_53                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_54                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_55                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_56                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_57                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_58                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_59                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_60                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_61                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_62                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_63                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_64                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_65                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_66                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_67                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_68                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_69                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_70                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_71                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_72                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_73                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_74                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_75                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_76                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_77                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_78                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_79                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_00                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_01                  (256'h007BFBBBBBBA7555548108110260440981102604C09813027FFC009000000000),
                 .INITP_02                  (256'h00000000000000000000000000000006080000A2FA3020481530EF08AA204081),
                 .INITP_03                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_04                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_05                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_06                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_07                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_08                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_09                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0A                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0B                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0C                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0D                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0E                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0F                  (256'h0000000000000000000000000000000000000000000000000000000000000000))
   kcpsm6_rom_l( .ADDRARDADDR               (address_a),
                 .ENARDEN                   (enable),
                 .CLKARDCLK                 (clk),
                 .DOADO                     (data_out_a_l[31:0]),
                 .DOPADOP                   (data_out_a_l[35:32]), 
                 .DIADI                     (data_in_a[31:0]),
                 .DIPADIP                   (data_in_a[35:32]), 
                 .WEA                       (4'b0000),
                 .REGCEAREGCE               (1'b0),
                 .RSTRAMARSTRAM             (1'b0),
                 .RSTREGARSTREG             (1'b0),
                 .ADDRBWRADDR               (address_b),
                 .ENBWREN                   (enable_b),
                 .CLKBWRCLK                 (clk_b),
                 .DOBDO                     (data_out_b_l[31:0]),
                 .DOPBDOP                   (data_out_b_l[35:32]), 
                 .DIBDI                     (data_in_b_l[31:0]),
                 .DIPBDIP                   (data_in_b_l[35:32]), 
                 .WEBWE                     (we_b),
                 .REGCEB                    (1'b0),
                 .RSTRAMB                   (1'b0),
                 .RSTREGB                   (1'b0),
                 .CASCADEINA                (1'b0),
                 .CASCADEINB                (1'b0),
                 .CASCADEOUTA               (),
                 .CASCADEOUTB               (),
                 .DBITERR                   (),
                 .ECCPARITY                 (),
                 .RDADDRECC                 (),
                 .SBITERR                   (),
                 .INJECTDBITERR             (1'b0),      
                 .INJECTSBITERR             (1'b0));   
      //
      RAMB36E1 #(.READ_WIDTH_A              (9),
                 .WRITE_WIDTH_A             (9),
                 .DOA_REG                   (0),
                 .INIT_A                    (36'h000000000),
                 .RSTREG_PRIORITY_A         ("REGCE"),
                 .SRVAL_A                   (36'h000000000),
                 .WRITE_MODE_A              ("WRITE_FIRST"),
                 .READ_WIDTH_B              (9),
                 .WRITE_WIDTH_B             (9),
                 .DOB_REG                   (0),
                 .INIT_B                    (36'h000000000),
                 .RSTREG_PRIORITY_B         ("REGCE"),
                 .SRVAL_B                   (36'h000000000),
                 .WRITE_MODE_B              ("WRITE_FIRST"),
                 .INIT_FILE                 ("NONE"),
                 .SIM_COLLISION_CHECK       ("ALL"),
                 .RAM_MODE                  ("TDP"),
                 .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
                 .EN_ECC_READ               ("FALSE"),
                 .EN_ECC_WRITE              ("FALSE"),
                 .RAM_EXTENSION_A           ("NONE"),
                 .RAM_EXTENSION_B           ("NONE"),
                 .SIM_DEVICE                ("VIRTEX6"),
                 .INIT_00                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_01                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_02                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_03                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_04                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_05                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_06                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_07                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_08                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_09                   (256'h120A0A0A0A0A0A0A0A0A0A0A0B0D0D0A0A0A0A0A0A0A0A0A070A02FF75101010),
                 .INIT_0A                   (256'h3B3D3D3A3A3A3A3A373A322B2D2D2A2A2A2A2A272A221B1D1D1A1A1A1A1A171A),
                 .INIT_0B                   (256'h8D8D8A8A8A8A8A878A827C7D7D7A7A7A7A7A777A726B6D6D6A6A6A6A6A676A62),
                 .INIT_0C                   (256'hDDDADADADADAD7DAD2CBCDCDCACACACACAC7CAC29C9D9D9A9A9A9A9A979A928B),
                 .INIT_0D                   (256'hA2A7A2A7A2A7A2FCFDFDFAFAFAFAFAF7FAF2ECECEDEDEAEAEAEAEAE7EAE2DCDD),
                 .INIT_0E                   (256'hB3F0F1F5F390919593D0D1D5D3101410101513A7A2A7A2A7A2A7A2A7A2A7A2A7),
                 .INIT_0F                   (256'h7A7A7A7AA8E888C828A7A1A5A3E0E1E5E387818583C0C1C5C300010503B0B1B5),
                 .INIT_10                   (256'h0A0A09090808A7A242424F4A4A4A4A62626F6A6A6A6A52525F5A5A5A5A72727F),
                 .INIT_11                   (256'h5B5A595B5B5B595B5B5B5A5F5D595B585E5D5B5D2725373548484040B7B2B8B8),
                 .INIT_12                   (256'h5959595959595B5B5A595959595B5B5B5B595B5B5B5B5B5B5B5B5B595B595B5B),
                 .INIT_13                   (256'h0A0A0A0A0F0A0A0A5858585858585858585858585858585B5B585B5B5B5A5A58),
                 .INIT_14                   (256'h0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0B0D0D),
                 .INIT_15                   (256'h0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A),
                 .INIT_16                   (256'h1010101010101010101010101010101010101010101010101010101010100A0A),
                 .INIT_17                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_18                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_19                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_20                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_21                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_22                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_23                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_24                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_25                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_26                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_27                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_28                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_29                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_30                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_31                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_32                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_33                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_34                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_35                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_36                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_37                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_38                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_39                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_40                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_41                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_42                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_43                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_44                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_45                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_46                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_47                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_48                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_49                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_50                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_51                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_52                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_53                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_54                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_55                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_56                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_57                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_58                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_59                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_60                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_61                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_62                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_63                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_64                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_65                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_66                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_67                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_68                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_69                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_70                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_71                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_72                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_73                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_74                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_75                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_76                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_77                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_78                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_79                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7F                   (256'h2810101010101010101010101010101010101010101010101010101010101010),
                 .INITP_00                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_01                  (256'hFFFFFFFFFFFFE000000000000000000000000000000000000000001FFFFFFFFF),
                 .INITP_02                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30001FC07),
                 .INITP_03                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_04                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_05                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_06                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_07                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_08                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_09                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0A                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0B                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0C                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0D                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0E                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0F                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
   kcpsm6_rom_h( .ADDRARDADDR               (address_a),
                 .ENARDEN                   (enable),
                 .CLKARDCLK                 (clk),
                 .DOADO                     (data_out_a_h[31:0]),
                 .DOPADOP                   (data_out_a_h[35:32]), 
                 .DIADI                     (data_in_a[31:0]),
                 .DIPADIP                   (data_in_a[35:32]), 
                 .WEA                       (4'b0000),
                 .REGCEAREGCE               (1'b0),
                 .RSTRAMARSTRAM             (1'b0),
                 .RSTREGARSTREG             (1'b0),
                 .ADDRBWRADDR               (address_b),
                 .ENBWREN                   (enable_b),
                 .CLKBWRCLK                 (clk_b),
                 .DOBDO                     (data_out_b_h[31:0]),
                 .DOPBDOP                   (data_out_b_h[35:32]), 
                 .DIBDI                     (data_in_b_h[31:0]),
                 .DIPBDIP                   (data_in_b_h[35:32]), 
                 .WEBWE                     (we_b),
                 .REGCEB                    (1'b0),
                 .RSTRAMB                   (1'b0),
                 .RSTREGB                   (1'b0),
                 .CASCADEINA                (1'b0),
                 .CASCADEINB                (1'b0),
                 .CASCADEOUTA               (),
                 .CASCADEOUTB               (),
                 .DBITERR                   (),
                 .ECCPARITY                 (),
                 .RDADDRECC                 (),
                 .SBITERR                   (),
                 .INJECTDBITERR             (1'b0),      
                 .INJECTSBITERR             (1'b0));  
    end // v6;  
    //
    //
    if (C_FAMILY == "7S") begin: akv7 
      //
      assign address_a = {1'b1, address[11:0], 3'b111};
      assign instruction = {data_out_a_h[32], data_out_a_h[7:0], data_out_a_l[32], data_out_a_l[7:0]};
      assign data_in_a = 36'b00000000000000000000000000000000000;
      assign jtag_dout = {data_out_b_h[32], data_out_b_h[7:0], data_out_b_l[32], data_out_b_l[7:0]};
      //
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b_l = {3'b000, data_out_b_l[32], 24'b000000000000000000000000, data_out_b_l[7:0]};
        assign data_in_b_h = {3'b000, data_out_b_h[32], 24'b000000000000000000000000, data_out_b_h[7:0]};
        assign address_b = 16'b1111111111111111;
        assign we_b = 8'b00000000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
      end // no_loader;
      //
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b_h = {3'b000, jtag_din[17], 24'b000000000000000000000000, jtag_din[16:9]};
        assign data_in_b_l = {3'b000, jtag_din[8],  24'b000000000000000000000000, jtag_din[7:0]};
        assign address_b = {1'b1, jtag_addr[11:0], 3'b111};
        assign we_b = {jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we};
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
      end // loader;
      // 
      RAMB36E1 #(.READ_WIDTH_A              (9),
                 .WRITE_WIDTH_A             (9),
                 .DOA_REG                   (0),
                 .INIT_A                    (36'h000000000),
                 .RSTREG_PRIORITY_A         ("REGCE"),
                 .SRVAL_A                   (36'h000000000),
                 .WRITE_MODE_A              ("WRITE_FIRST"),
                 .READ_WIDTH_B              (9),
                 .WRITE_WIDTH_B             (9),
                 .DOB_REG                   (0),
                 .INIT_B                    (36'h000000000),
                 .RSTREG_PRIORITY_B         ("REGCE"),
                 .SRVAL_B                   (36'h000000000),
                 .WRITE_MODE_B              ("WRITE_FIRST"),
                 .INIT_FILE                 ("NONE"),
                 .SIM_COLLISION_CHECK       ("ALL"),
                 .RAM_MODE                  ("TDP"),
                 .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
                 .EN_ECC_READ               ("FALSE"),
                 .EN_ECC_WRITE              ("FALSE"),
                 .RAM_EXTENSION_A           ("NONE"),
                 .RAM_EXTENSION_B           ("NONE"),
                 .SIM_DEVICE                ("7SERIES"),
                 .INIT_00                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_01                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_02                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_03                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_04                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_05                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_06                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_07                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_08                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_09                   (256'hC09C907F1B0D0B0A09080700FE00000F4BA313D297C50B2AE07BC0FF7B000000),
                 .INIT_0A                   (256'hFE00000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0FE0FFF0F4BD2C52AE07B),
                 .INIT_0B                   (256'h00000F4BD2C52AE07BC0FD00000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0),
                 .INIT_0C                   (256'h000F4BD2C52AE07BC0FE00000F4BD2C52AE07BC0FD00000F4BD2C52AE07BC0FE),
                 .INIT_0D                   (256'h00040407070606FD00000F4BD2C52AE07BC07FFE00000F4BD2C52AE07BC0FD00),
                 .INIT_0E                   (256'hE4004526E4004526E4004526E4007D640E26E40C0C08080A0A0F0F0E0E020200),
                 .INIT_0F                   (256'h08263F3F0000000000FF4526E4004526E4FF4526E4004526E4004526E4004526),
                 .INIT_10                   (256'h0E05100C1B0F8080E0B02A80263F3FE0B02A80263F3FE0B02A08263F3FE0B02A),
                 .INIT_11                   (256'h92E2023212720232928242E65648D8C424BABD5BE0A0E0A000010001E0C00100),
                 .INIT_12                   (256'hFB42120222029212D2026212E2125242920242E21292C2C2922222023272B232),
                 .INIT_13                   (256'h0F244BD27BE72A7B0B2B3B2B0B9B9B1B5B9B7B8B8B0B4BFBFB7BDBDB6BFBBB6B),
                 .INIT_14                   (256'h0D2E746920746E656D656C706D69206F7420646168206E654B20747542FE0000),
                 .INIT_15                   (256'h030200090901050907080800046F7F077D6D664F5B063F0035313A37323A3231),
                 .INIT_16                   (256'h0000000000000000000000000000000000000000000000000000000000000002),
                 .INIT_17                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_18                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_19                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_1F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_20                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_21                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_22                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_23                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_24                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_25                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_26                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_27                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_28                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_29                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_2F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_30                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_31                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_32                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_33                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_34                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_35                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_36                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_37                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_38                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_39                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_3F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_40                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_41                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_42                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_43                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_44                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_45                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_46                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_47                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_48                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_49                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_4F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_50                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_51                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_52                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_53                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_54                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_55                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_56                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_57                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_58                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_59                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_5F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_60                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_61                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_62                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_63                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_64                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_65                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_66                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_67                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_68                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_69                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_6F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_70                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_71                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_72                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_73                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_74                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_75                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_76                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_77                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_78                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_79                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INIT_7F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_00                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_01                  (256'h007BFBBBBBBA7555548108110260440981102604C09813027FFC009000000000),
                 .INITP_02                  (256'h00000000000000000000000000000006080000A2FA3020481530EF08AA204081),
                 .INITP_03                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_04                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_05                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_06                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_07                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_08                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_09                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0A                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0B                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0C                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0D                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0E                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
                 .INITP_0F                  (256'h0000000000000000000000000000000000000000000000000000000000000000))
   kcpsm6_rom_l( .ADDRARDADDR               (address_a),
                 .ENARDEN                   (enable),
                 .CLKARDCLK                 (clk),
                 .DOADO                     (data_out_a_l[31:0]),
                 .DOPADOP                   (data_out_a_l[35:32]), 
                 .DIADI                     (data_in_a[31:0]),
                 .DIPADIP                   (data_in_a[35:32]), 
                 .WEA                       (4'b0000),
                 .REGCEAREGCE               (1'b0),
                 .RSTRAMARSTRAM             (1'b0),
                 .RSTREGARSTREG             (1'b0),
                 .ADDRBWRADDR               (address_b),
                 .ENBWREN                   (enable_b),
                 .CLKBWRCLK                 (clk_b),
                 .DOBDO                     (data_out_b_l[31:0]),
                 .DOPBDOP                   (data_out_b_l[35:32]), 
                 .DIBDI                     (data_in_b_l[31:0]),
                 .DIPBDIP                   (data_in_b_l[35:32]), 
                 .WEBWE                     (we_b),
                 .REGCEB                    (1'b0),
                 .RSTRAMB                   (1'b0),
                 .RSTREGB                   (1'b0),
                 .CASCADEINA                (1'b0),
                 .CASCADEINB                (1'b0),
                 .CASCADEOUTA               (),
                 .CASCADEOUTB               (),
                 .DBITERR                   (),
                 .ECCPARITY                 (),
                 .RDADDRECC                 (),
                 .SBITERR                   (),
                 .INJECTDBITERR             (1'b0),      
                 .INJECTSBITERR             (1'b0));   
      //
      RAMB36E1 #(.READ_WIDTH_A              (9),
                 .WRITE_WIDTH_A             (9),
                 .DOA_REG                   (0),
                 .INIT_A                    (36'h000000000),
                 .RSTREG_PRIORITY_A         ("REGCE"),
                 .SRVAL_A                   (36'h000000000),
                 .WRITE_MODE_A              ("WRITE_FIRST"),
                 .READ_WIDTH_B              (9),
                 .WRITE_WIDTH_B             (9),
                 .DOB_REG                   (0),
                 .INIT_B                    (36'h000000000),
                 .RSTREG_PRIORITY_B         ("REGCE"),
                 .SRVAL_B                   (36'h000000000),
                 .WRITE_MODE_B              ("WRITE_FIRST"),
                 .INIT_FILE                 ("NONE"),
                 .SIM_COLLISION_CHECK       ("ALL"),
                 .RAM_MODE                  ("TDP"),
                 .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
                 .EN_ECC_READ               ("FALSE"),
                 .EN_ECC_WRITE              ("FALSE"),
                 .RAM_EXTENSION_A           ("NONE"),
                 .RAM_EXTENSION_B           ("NONE"),
                 .SIM_DEVICE                ("7SERIES"),
                 .INIT_00                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_01                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_02                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_03                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_04                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_05                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_06                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_07                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_08                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_09                   (256'h120A0A0A0A0A0A0A0A0A0A0A0B0D0D0A0A0A0A0A0A0A0A0A070A02FF75101010),
                 .INIT_0A                   (256'h3B3D3D3A3A3A3A3A373A322B2D2D2A2A2A2A2A272A221B1D1D1A1A1A1A1A171A),
                 .INIT_0B                   (256'h8D8D8A8A8A8A8A878A827C7D7D7A7A7A7A7A777A726B6D6D6A6A6A6A6A676A62),
                 .INIT_0C                   (256'hDDDADADADADAD7DAD2CBCDCDCACACACACAC7CAC29C9D9D9A9A9A9A9A979A928B),
                 .INIT_0D                   (256'hA2A7A2A7A2A7A2FCFDFDFAFAFAFAFAF7FAF2ECECEDEDEAEAEAEAEAE7EAE2DCDD),
                 .INIT_0E                   (256'hB3F0F1F5F390919593D0D1D5D3101410101513A7A2A7A2A7A2A7A2A7A2A7A2A7),
                 .INIT_0F                   (256'h7A7A7A7AA8E888C828A7A1A5A3E0E1E5E387818583C0C1C5C300010503B0B1B5),
                 .INIT_10                   (256'h0A0A09090808A7A242424F4A4A4A4A62626F6A6A6A6A52525F5A5A5A5A72727F),
                 .INIT_11                   (256'h5B5A595B5B5B595B5B5B5A5F5D595B585E5D5B5D2725373548484040B7B2B8B8),
                 .INIT_12                   (256'h5959595959595B5B5A595959595B5B5B5B595B5B5B5B5B5B5B5B5B595B595B5B),
                 .INIT_13                   (256'h0A0A0A0A0F0A0A0A5858585858585858585858585858585B5B585B5B5B5A5A58),
                 .INIT_14                   (256'h0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0B0D0D),
                 .INIT_15                   (256'h0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A),
                 .INIT_16                   (256'h1010101010101010101010101010101010101010101010101010101010100A0A),
                 .INIT_17                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_18                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_19                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_1F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_20                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_21                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_22                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_23                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_24                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_25                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_26                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_27                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_28                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_29                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_2F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_30                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_31                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_32                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_33                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_34                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_35                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_36                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_37                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_38                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_39                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_3F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_40                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_41                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_42                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_43                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_44                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_45                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_46                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_47                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_48                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_49                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_4F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_50                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_51                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_52                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_53                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_54                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_55                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_56                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_57                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_58                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_59                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_5F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_60                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_61                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_62                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_63                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_64                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_65                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_66                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_67                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_68                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_69                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_6F                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_70                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_71                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_72                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_73                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_74                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_75                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_76                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_77                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_78                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_79                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7A                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7B                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7C                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7D                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7E                   (256'h1010101010101010101010101010101010101010101010101010101010101010),
                 .INIT_7F                   (256'h2810101010101010101010101010101010101010101010101010101010101010),
                 .INITP_00                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_01                  (256'hFFFFFFFFFFFFE000000000000000000000000000000000000000001FFFFFFFFF),
                 .INITP_02                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30001FC07),
                 .INITP_03                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_04                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_05                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_06                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_07                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_08                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_09                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0A                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0B                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0C                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0D                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0E                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
                 .INITP_0F                  (256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
   kcpsm6_rom_h( .ADDRARDADDR               (address_a),
                 .ENARDEN                   (enable),
                 .CLKARDCLK                 (clk),
                 .DOADO                     (data_out_a_h[31:0]),
                 .DOPADOP                   (data_out_a_h[35:32]), 
                 .DIADI                     (data_in_a[31:0]),
                 .DIPADIP                   (data_in_a[35:32]), 
                 .WEA                       (4'b0000),
                 .REGCEAREGCE               (1'b0),
                 .RSTRAMARSTRAM             (1'b0),
                 .RSTREGARSTREG             (1'b0),
                 .ADDRBWRADDR               (address_b),
                 .ENBWREN                   (enable_b),
                 .CLKBWRCLK                 (clk_b),
                 .DOBDO                     (data_out_b_h[31:0]),
                 .DOPBDOP                   (data_out_b_h[35:32]), 
                 .DIBDI                     (data_in_b_h[31:0]),
                 .DIPBDIP                   (data_in_b_h[35:32]), 
                 .WEBWE                     (we_b),
                 .REGCEB                    (1'b0),
                 .RSTRAMB                   (1'b0),
                 .RSTREGB                   (1'b0),
                 .CASCADEINA                (1'b0),
                 .CASCADEINB                (1'b0),
                 .CASCADEOUTA               (),
                 .CASCADEOUTB               (),
                 .DBITERR                   (),
                 .ECCPARITY                 (),
                 .RDADDRECC                 (),
                 .SBITERR                   (),
                 .INJECTDBITERR             (1'b0),      
                 .INJECTSBITERR             (1'b0));  
    end // akv7;  
    //
  end // ram_4k_generate;
endgenerate      
//
// JTAG Loader 
//
generate
  if (C_JTAG_LOADER_ENABLE == 1) begin: instantiate_loader
    jtag_loader_6  #(  .C_FAMILY              (C_FAMILY),
                       .C_NUM_PICOBLAZE       (1),
                       .C_JTAG_LOADER_ENABLE  (C_JTAG_LOADER_ENABLE),        
                       .C_BRAM_MAX_ADDR_WIDTH (BRAM_ADDRESS_WIDTH),        
                       .C_ADDR_WIDTH_0        (BRAM_ADDRESS_WIDTH))
    jtag_loader_6_inst(.picoblaze_reset       (rdl_bus),
                       .jtag_en               (jtag_en),
                       .jtag_din              (jtag_din),
                       .jtag_addr             (jtag_addr[BRAM_ADDRESS_WIDTH-1 : 0]),
                       .jtag_clk              (jtag_clk),
                       .jtag_we               (jtag_we),
                       .jtag_dout_0           (jtag_dout),
                       .jtag_dout_1           (jtag_dout),  // ports 1-7 are not used
                       .jtag_dout_2           (jtag_dout),  // in a 1 device debug 
                       .jtag_dout_3           (jtag_dout),  // session.  However, Synplify
                       .jtag_dout_4           (jtag_dout),  // etc require all ports are
                       .jtag_dout_5           (jtag_dout),  // connected
                       .jtag_dout_6           (jtag_dout),
                       .jtag_dout_7           (jtag_dout));  
    
  end //instantiate_loader
endgenerate 
//
//
endmodule
//
//
//
//
///////////////////////////////////////////////////////////////////////////////////////////
//
// JTAG Loader 
//
///////////////////////////////////////////////////////////////////////////////////////////
//
//
// JTAG Loader 6 - Version 6.00
//
// Kris Chaplin - 4th February 2010
// Nick Sawyer  - 3rd March 2011 - Initial conversion to Verilog
// Ken Chapman  - 16th August 2011 - Revised coding style
//
`timescale 1ps/1ps
module jtag_loader_6 (picoblaze_reset, jtag_en, jtag_din, jtag_addr, jtag_clk, jtag_we, jtag_dout_0, jtag_dout_1, jtag_dout_2, jtag_dout_3, jtag_dout_4, jtag_dout_5, jtag_dout_6, jtag_dout_7);
//
parameter integer C_JTAG_LOADER_ENABLE = 1;
parameter         C_FAMILY = "V6";
parameter integer C_NUM_PICOBLAZE = 1;
parameter integer C_BRAM_MAX_ADDR_WIDTH = 10;
parameter integer C_PICOBLAZE_INSTRUCTION_DATA_WIDTH = 18;
parameter integer C_JTAG_CHAIN = 2;
parameter [4:0]   C_ADDR_WIDTH_0 = 10;
parameter [4:0]   C_ADDR_WIDTH_1 = 10;
parameter [4:0]   C_ADDR_WIDTH_2 = 10;
parameter [4:0]   C_ADDR_WIDTH_3 = 10;
parameter [4:0]   C_ADDR_WIDTH_4 = 10;
parameter [4:0]   C_ADDR_WIDTH_5 = 10;
parameter [4:0]   C_ADDR_WIDTH_6 = 10;
parameter [4:0]   C_ADDR_WIDTH_7 = 10;
//
output [C_NUM_PICOBLAZE-1:0]                    picoblaze_reset;
output [C_NUM_PICOBLAZE-1:0]                    jtag_en;
output [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_din;
output [C_BRAM_MAX_ADDR_WIDTH-1:0]              jtag_addr;
output                                          jtag_clk ;
output                                          jtag_we;  
input  [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_0;
input  [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_1;
input  [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_2;
input  [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_3;
input  [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_4;
input  [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_5;
input  [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_6;
input  [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_7;
//
//
wire   [2:0]                                    num_picoblaze;        
wire   [4:0]                                    picoblaze_instruction_data_width; 
//
wire                                            drck;
wire                                            shift_clk;
wire                                            shift_din;
wire                                            shift_dout;
wire                                            shift;
wire                                            capture;
//
reg                                             control_reg_ce;
reg    [C_NUM_PICOBLAZE-1:0]                    bram_ce;
wire   [C_NUM_PICOBLAZE-1:0]                    bus_zero;
wire   [C_NUM_PICOBLAZE-1:0]                    jtag_en_int;
wire   [7:0]                                    jtag_en_expanded;
reg    [C_BRAM_MAX_ADDR_WIDTH-1:0]              jtag_addr_int;
reg    [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_din_int;
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] control_din;
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] control_dout;
reg    [7:0]                                    control_dout_int;
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] bram_dout_int;
reg                                             jtag_we_int;
wire                                            jtag_clk_int;
wire                                            bram_ce_valid;
reg                                             din_load;
//                                                
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_0_masked;
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_1_masked;
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_2_masked;
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_3_masked;
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_4_masked;
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_5_masked;
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_6_masked;
wire   [C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0] jtag_dout_7_masked;
reg    [C_NUM_PICOBLAZE-1:0]                    picoblaze_reset_int;
//
initial picoblaze_reset_int = 0;
//
genvar i;
//
generate
  for (i = 0; i <= C_NUM_PICOBLAZE-1; i = i+1)
    begin : npzero_loop
      assign bus_zero[i] = 1'b0;
    end
endgenerate
//
generate
  //
  if (C_JTAG_LOADER_ENABLE == 1)
    begin : jtag_loader_gen
      //
      // Insert BSCAN primitive for target device architecture.
      //
      if (C_FAMILY == "S6")
        begin : BSCAN_SPARTAN6_gen
          BSCAN_SPARTAN6 # (.JTAG_CHAIN (C_JTAG_CHAIN))
          BSCAN_BLOCK_inst (.CAPTURE    (capture),
                            .DRCK       (drck),
                            .RESET      (),
                            .RUNTEST    (),
                            .SEL        (bram_ce_valid),
                            .SHIFT      (shift),
                            .TCK        (),
                            .TDI        (shift_din),
                            .TMS        (),
                            .UPDATE     (jtag_clk_int),
                            .TDO        (shift_dout)); 
            
        end 
      //
      if (C_FAMILY == "V6")
        begin : BSCAN_VIRTEX6_gen
          BSCAN_VIRTEX6 # ( .JTAG_CHAIN   (C_JTAG_CHAIN),
                            .DISABLE_JTAG ("FALSE"))
          BSCAN_BLOCK_inst (.CAPTURE      (capture),
                            .DRCK         (drck),
                            .RESET        (),
                            .RUNTEST      (),
                            .SEL          (bram_ce_valid),
                            .SHIFT        (shift),
                            .TCK          (),
                            .TDI          (shift_din),
                            .TMS          (),
                            .UPDATE       (jtag_clk_int),
                            .TDO          (shift_dout));
        end 
      //
      if (C_FAMILY == "7S")
        begin : BSCAN_7SERIES_gen
          BSCANE2 # (       .JTAG_CHAIN   (C_JTAG_CHAIN),
                            .DISABLE_JTAG ("FALSE"))
          BSCAN_BLOCK_inst (.CAPTURE      (capture),
                            .DRCK         (drck),
                            .RESET        (),
                            .RUNTEST      (),
                            .SEL          (bram_ce_valid),
                            .SHIFT        (shift),
                            .TCK          (),
                            .TDI          (shift_din),
                            .TMS          (),
                            .UPDATE       (jtag_clk_int),
                            .TDO          (shift_dout));
        end 
      //
      // Insert clock buffer to ensure reliable shift operations.
      //
      BUFG upload_clock (.I (drck), .O (shift_clk));
      //        
      //
      // Shift Register 
      //
      always @ (posedge shift_clk) begin
        if (shift == 1'b1) begin
          control_reg_ce <= shift_din;
        end
      end
      // 
      always @ (posedge shift_clk) begin
        if (shift == 1'b1) begin
          bram_ce[0] <= control_reg_ce;
        end
      end 
      //
      for (i = 0; i <= C_NUM_PICOBLAZE-2; i = i+1)
      begin : loop0 
        if (C_NUM_PICOBLAZE > 1) begin
          always @ (posedge shift_clk) begin
            if (shift == 1'b1) begin
              bram_ce[i+1] <= bram_ce[i];
            end
          end
        end 
      end
      // 
      always @ (posedge shift_clk) begin
        if (shift == 1'b1) begin
          jtag_we_int <= bram_ce[C_NUM_PICOBLAZE-1];
        end
      end
      // 
      always @ (posedge shift_clk) begin 
        if (shift == 1'b1) begin
          jtag_addr_int[0] <= jtag_we_int;
        end
      end
      //
      for (i = 0; i <= C_BRAM_MAX_ADDR_WIDTH-2; i = i+1)
      begin : loop1
        always @ (posedge shift_clk) begin
          if (shift == 1'b1) begin
            jtag_addr_int[i+1] <= jtag_addr_int[i];
          end
        end 
      end
      // 
      always @ (posedge shift_clk) begin 
        if (din_load == 1'b1) begin
          jtag_din_int[0] <= bram_dout_int[0];
        end
        else if (shift == 1'b1) begin
          jtag_din_int[0] <= jtag_addr_int[C_BRAM_MAX_ADDR_WIDTH-1];
        end
      end       
      //
      for (i = 0; i <= C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-2; i = i+1)
      begin : loop2
        always @ (posedge shift_clk) begin
          if (din_load == 1'b1) begin
            jtag_din_int[i+1] <= bram_dout_int[i+1];
          end
          if (shift == 1'b1) begin
            jtag_din_int[i+1] <= jtag_din_int[i];
          end
        end 
      end
      //
      assign shift_dout = jtag_din_int[C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1];
      //
      //
      always @ (bram_ce or din_load or capture or bus_zero or control_reg_ce) begin
        if ( bram_ce == bus_zero ) begin
          din_load <= capture & control_reg_ce;
        end else begin
          din_load <= capture;
        end
      end
      //
      //
      // Control Registers 
      //
      assign num_picoblaze = C_NUM_PICOBLAZE-3'h1;
      assign picoblaze_instruction_data_width = C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-5'h01;
      //
      always @ (posedge jtag_clk_int) begin
        if (bram_ce_valid == 1'b1 && jtag_we_int == 1'b0 && control_reg_ce == 1'b1) begin
          case (jtag_addr_int[3:0]) 
            0 : // 0 = version - returns (7:4) illustrating number of PB
                // and [3:0] picoblaze instruction data width
                control_dout_int <= {num_picoblaze, picoblaze_instruction_data_width};
            1 : // 1 = PicoBlaze 0 reset / status
                if (C_NUM_PICOBLAZE >= 1) begin 
                  control_dout_int <= {picoblaze_reset_int[0], 2'b00, C_ADDR_WIDTH_0-5'h01};
                end else begin
                  control_dout_int <= 8'h00;
                end
            2 : // 2 = PicoBlaze 1 reset / status
                if (C_NUM_PICOBLAZE >= 2) begin 
                  control_dout_int <= {picoblaze_reset_int[1], 2'b00, C_ADDR_WIDTH_1-5'h01};
                end else begin
                  control_dout_int <= 8'h00;
                end
            3 : // 3 = PicoBlaze 2 reset / status
                if (C_NUM_PICOBLAZE >= 3) begin 
                  control_dout_int <= {picoblaze_reset_int[2], 2'b00, C_ADDR_WIDTH_2-5'h01};
                end else begin
                  control_dout_int <= 8'h00;
                end
            4 : // 4 = PicoBlaze 3 reset / status
                if (C_NUM_PICOBLAZE >= 4) begin 
                  control_dout_int <= {picoblaze_reset_int[3], 2'b00, C_ADDR_WIDTH_3-5'h01};
                end else begin
                  control_dout_int <= 8'h00;
                end
            5:  // 5 = PicoBlaze 4 reset / status
                if (C_NUM_PICOBLAZE >= 5) begin 
                  control_dout_int <= {picoblaze_reset_int[4], 2'b00, C_ADDR_WIDTH_4-5'h01};
                end else begin
                  control_dout_int <= 8'h00;
                end
            6 : // 6 = PicoBlaze 5 reset / status
                if (C_NUM_PICOBLAZE >= 6) begin 
                  control_dout_int <= {picoblaze_reset_int[5], 2'b00, C_ADDR_WIDTH_5-5'h01};
                end else begin
                  control_dout_int <= 8'h00;
                end
            7 : // 7 = PicoBlaze 6 reset / status
                if (C_NUM_PICOBLAZE >= 7) begin 
                  control_dout_int <= {picoblaze_reset_int[6], 2'b00, C_ADDR_WIDTH_6-5'h01};
                end else begin
                  control_dout_int <= 8'h00;
                end
            8 : // 8 = PicoBlaze 7 reset / status
                if (C_NUM_PICOBLAZE >= 8) begin 
                  control_dout_int <= {picoblaze_reset_int[7], 2'b00, C_ADDR_WIDTH_7-5'h01};
                end else begin
                  control_dout_int <= 8'h00;
                end
            15 : control_dout_int <= C_BRAM_MAX_ADDR_WIDTH -1;
            default : control_dout_int <= 8'h00;
            //
          endcase
        end else begin
          control_dout_int <= 8'h00;
        end
      end 
      //
      assign control_dout[C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-8] = control_dout_int;
      //
      always @ (posedge jtag_clk_int) begin
        if (bram_ce_valid == 1'b1 && jtag_we_int == 1'b1 && control_reg_ce == 1'b1) begin
          picoblaze_reset_int[C_NUM_PICOBLAZE-1:0] <= control_din[C_NUM_PICOBLAZE-1:0];
        end
      end     
      //
      //
      // Assignments 
      //
      if (C_PICOBLAZE_INSTRUCTION_DATA_WIDTH > 8) begin
        assign control_dout[C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-9:0] = 10'h000;
      end
      //
      // Qualify the blockram CS signal with bscan select output
      assign jtag_en_int = (bram_ce_valid) ? bram_ce : bus_zero;
      //
      assign jtag_en_expanded[C_NUM_PICOBLAZE-1:0] = jtag_en_int; 
      //
      for (i = 7; i >= C_NUM_PICOBLAZE; i = i-1)
        begin : loop4 
          if (C_NUM_PICOBLAZE < 8) begin : jtag_en_expanded_gen
            assign jtag_en_expanded[i] = 1'b0;
          end
        end
      //
      assign bram_dout_int = control_dout | jtag_dout_0_masked | jtag_dout_1_masked | jtag_dout_2_masked | jtag_dout_3_masked | jtag_dout_4_masked | jtag_dout_5_masked | jtag_dout_6_masked | jtag_dout_7_masked;
      //
      assign control_din = jtag_din_int;
      //
      assign jtag_dout_0_masked = (jtag_en_expanded[0]) ? jtag_dout_0 : 18'h00000;
      assign jtag_dout_1_masked = (jtag_en_expanded[1]) ? jtag_dout_1 : 18'h00000;
      assign jtag_dout_2_masked = (jtag_en_expanded[2]) ? jtag_dout_2 : 18'h00000;
      assign jtag_dout_3_masked = (jtag_en_expanded[3]) ? jtag_dout_3 : 18'h00000;
      assign jtag_dout_4_masked = (jtag_en_expanded[4]) ? jtag_dout_4 : 18'h00000;
      assign jtag_dout_5_masked = (jtag_en_expanded[5]) ? jtag_dout_5 : 18'h00000;
      assign jtag_dout_6_masked = (jtag_en_expanded[6]) ? jtag_dout_6 : 18'h00000;
      assign jtag_dout_7_masked = (jtag_en_expanded[7]) ? jtag_dout_7 : 18'h00000;
      //       
      assign jtag_en = jtag_en_int;
      assign jtag_din = jtag_din_int;
      assign jtag_addr = jtag_addr_int;
      assign jtag_clk = jtag_clk_int;
      assign jtag_we = jtag_we_int;
      assign picoblaze_reset = picoblaze_reset_int;
      //
    end
endgenerate
   //
endmodule
//
///////////////////////////////////////////////////////////////////////////////////////////
//
//  END OF FILE all_kcpsm6_syntax.v
//
///////////////////////////////////////////////////////////////////////////////////////////
//
