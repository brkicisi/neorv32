# make a local copy of original "./../../rtl/templates/processor/neorv32_ProcessorTop_Test.vhd" file
# and modify the default clock frequency: set to 50MHz
set shell_script "cp -f ./../../../rtl/templates/processor/neorv32_ProcessorTop_Test.vhd . && sed -i '/CLOCK_FREQUENCY/c\CLOCK_FREQUENCY => 50000000,' neorv32_ProcessorTop_Test.vhd"
exec bash -c $shell_script

# Copyright (C) 2020  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions
# and other software and tools, and any partner logic
# functions, and any output files from any of the foregoing
# (including device programming or simulation files), and any
# associated documentation or information are expressly subject
# to the terms and conditions of the Intel Program License
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: de0_nano_test.tcl
# Generated on: Sat Apr 10 16:57:48 2021

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
  if {[string compare $quartus(project) "de10-lite-test-setup"]} {
    puts "Project de10-lite-test-setup is not open"
    set make_assignments 0
  }
} else {
  # Only open if not already open
  if {[project_exists de10-lite-test-setup]} {
    project_open -revision de10-lite-test-setup de10-lite-test-setup
  } else {
    project_new -revision de10-lite-test-setup de10-lite-test-setup
  }
  set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
  # "MAX 10 (DA/DF/DC/SA/SC)"
  set_global_assignment -name FAMILY "MAX 10"
  set_global_assignment -name DEVICE 10M50DAF484C7G
  set_global_assignment -name TOP_LEVEL_ENTITY neorv32_ProcessorTop_Test
  set_global_assignment -name ORIGINAL_QUARTUS_VERSION 20.1.0
  set_global_assignment -name PROJECT_CREATION_TIME_DATE "16:40:53  APRIL 10, 2021"
  set_global_assignment -name LAST_QUARTUS_VERSION "20.1.0 Lite Edition"
  set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
  set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
  set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
  set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1

  # core VHDL files
  set core_src_dir [glob ./../../../rtl/core/*.vhd]
  foreach core_src_file $core_src_dir {
    set_global_assignment -name VHDL_FILE $core_src_file -library neorv32
  }

  # top entity: use local modified copy of the original test setup
  set_global_assignment -name VHDL_FILE "neorv32_ProcessorTop_Test.vhd"

  set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
  set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
  set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
  set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
  set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top

  set_location_assignment PIN_P11 -to clk_i
  set_location_assignment PIN_W7 -to gpio_o[7]
  set_location_assignment PIN_V7 -to gpio_o[6]
  set_location_assignment PIN_W8 -to gpio_o[5]
  set_location_assignment PIN_V8 -to gpio_o[4]
  set_location_assignment PIN_W9 -to gpio_o[3]
  set_location_assignment PIN_V9 -to gpio_o[2]
  set_location_assignment PIN_W10 -to gpio_o[1]
  set_location_assignment PIN_V10 -to gpio_o[0]
  set_location_assignment PIN_F16 -to rstn_i
  # gpio[8]
  set_location_assignment PIN_W6 -to uart0_txd_o
  # gpio[9]
  set_location_assignment PIN_V5 -to uart0_rxd_i

  set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

  # Commit assignments
  export_assignments
}
