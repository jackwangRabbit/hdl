// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2017 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsabilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************
// too bad- we have to do this!

`timescale 1ns/100ps

module util_ccat #(

  parameter   CHANNEL_DATA_WIDTH     = 1,
  parameter   NUM_OF_CHANNELS    = 8) (

  input       [(CHANNEL_DATA_WIDTH-1):0]  data_0,
  input       [(CHANNEL_DATA_WIDTH-1):0]  data_1,
  input       [(CHANNEL_DATA_WIDTH-1):0]  data_2,
  input       [(CHANNEL_DATA_WIDTH-1):0]  data_3,
  input       [(CHANNEL_DATA_WIDTH-1):0]  data_4,
  input       [(CHANNEL_DATA_WIDTH-1):0]  data_5,
  input       [(CHANNEL_DATA_WIDTH-1):0]  data_6,
  input       [(CHANNEL_DATA_WIDTH-1):0]  data_7,

  output      [((NUM_OF_CHANNELS*CHANNEL_DATA_WIDTH)-1):0]  ccat_data);

  localparam  NUM_OF_CHANNELS_M   = 8;

  // internal signals

  wire    [((NUM_OF_CHANNELS_M*CHANNEL_DATA_WIDTH)-1):0]   data_s;

  // concatenate

  assign data_s[((CHANNEL_DATA_WIDTH*1)-1):(CHANNEL_DATA_WIDTH*0)] = data_0;
  assign data_s[((CHANNEL_DATA_WIDTH*2)-1):(CHANNEL_DATA_WIDTH*1)] = data_1;
  assign data_s[((CHANNEL_DATA_WIDTH*3)-1):(CHANNEL_DATA_WIDTH*2)] = data_2;
  assign data_s[((CHANNEL_DATA_WIDTH*4)-1):(CHANNEL_DATA_WIDTH*3)] = data_3;
  assign data_s[((CHANNEL_DATA_WIDTH*5)-1):(CHANNEL_DATA_WIDTH*4)] = data_4;
  assign data_s[((CHANNEL_DATA_WIDTH*6)-1):(CHANNEL_DATA_WIDTH*5)] = data_5;
  assign data_s[((CHANNEL_DATA_WIDTH*7)-1):(CHANNEL_DATA_WIDTH*6)] = data_6;
  assign data_s[((CHANNEL_DATA_WIDTH*8)-1):(CHANNEL_DATA_WIDTH*7)] = data_7;

  assign ccat_data = data_s[((NUM_OF_CHANNELS*CHANNEL_DATA_WIDTH)-1):0];

endmodule

// ***************************************************************************
// ***************************************************************************
