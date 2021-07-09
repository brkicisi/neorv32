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
  if {[string compare $quartus(project) "de1-soc-test-setup"]} {
    puts "Project de1-soc-test-setup is not open"
    set make_assignments 0
  }
} else {
  # Only open if not already open
  if {[project_exists de1-soc-test-setup]} {
    project_open -revision de1-soc-test-setup de1-soc-test-setup
  } else {
    project_new -revision de1-soc-test-setup de1-soc-test-setup
  }
  set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
  set_global_assignment -name FAMILY "Cyclone V"
  set_global_assignment -name DEVICE 5CSEMA5F31C6
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

  set_location_assignment PIN_AF14 -to clk_i
  set_location_assignment PIN_AA14 -to rstn_i
  
  # connect to gpio pins
  # set_location_assignment PIN_AJ19 -to gpio_o[7]
  # set_location_assignment PIN_AK19 -to gpio_o[6]
  # set_location_assignment PIN_AK18 -to gpio_o[5]
  # set_location_assignment PIN_AK16 -to gpio_o[4]
  # set_location_assignment PIN_Y18 -to gpio_o[3]
  # set_location_assignment PIN_AD17 -to gpio_o[2]
  # set_location_assignment PIN_Y17 -to gpio_o[1]
  # set_location_assignment PIN_AC18 -to gpio_o[0]
  
  # connect gpio to LEDs
  set_location_assignment PIN_W20 -to gpio_o[7]
  set_location_assignment PIN_Y19 -to gpio_o[6]
  set_location_assignment PIN_W19 -to gpio_o[5]
  set_location_assignment PIN_W17 -to gpio_o[4]
  set_location_assignment PIN_V18 -to gpio_o[3]
  set_location_assignment PIN_V17 -to gpio_o[2]
  set_location_assignment PIN_W16 -to gpio_o[1]
  set_location_assignment PIN_V16 -to gpio_o[0]

  # Send uart to uart to usb header
  # This causes a quartus error
  # set_location_assignment PIN_C25 -to uart0_txd_o
  # set_location_assignment PIN_B25 -to uart0_rxd_i

  # Sending uart rx to gpio_0[8] and tx to gpio_0[9]
  # This follows what the de0-nano example does
  set_location_assignment PIN_AJ16 -to uart0_txd_o
  set_location_assignment PIN_AJ17 -to uart0_rxd_i



  set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

  # Commit assignments
  export_assignments
}
