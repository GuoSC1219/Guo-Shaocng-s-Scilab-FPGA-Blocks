
################################################################
# This is a generated script based on design: fir_block
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2023.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source fir_block_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder, sub_fir_adder

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xczu28dr-ffvg1517-2-e
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name fir_block

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:fir_compiler:7.2\
xilinx.com:ip:xlconstant:1.1\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
sub_fir_adder\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: fir_31
proc create_hier_cell_fir_31 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_31() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir31_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir31_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir31_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_30
proc create_hier_cell_fir_30 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_30() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir30_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir30_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir30_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_29
proc create_hier_cell_fir_29 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_29() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir29_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir29_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir29_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_28
proc create_hier_cell_fir_28 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_28() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir28_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir28_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {26} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir28_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_27
proc create_hier_cell_fir_27 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_27() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir27_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir27_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir27_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_26
proc create_hier_cell_fir_26 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_26() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir26_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir26_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir26_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_25
proc create_hier_cell_fir_25 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_25() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir25_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir25_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir25_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_24
proc create_hier_cell_fir_24 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_24() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir24_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir24_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir24_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_23
proc create_hier_cell_fir_23 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_23() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir23_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir23_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir23_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_22
proc create_hier_cell_fir_22 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_22() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir22_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir22_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir22_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_21
proc create_hier_cell_fir_21 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_21() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir21_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir21_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir21_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_20
proc create_hier_cell_fir_20 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_20() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir20_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir20_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir20_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_19
proc create_hier_cell_fir_19 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_19() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir19_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir19_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir19_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_18
proc create_hier_cell_fir_18 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_18() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir18_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir18_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir18_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_17
proc create_hier_cell_fir_17 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_17() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir17_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir17_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir17_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_16
proc create_hier_cell_fir_16 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_16() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir16_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir16_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir16_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_15
proc create_hier_cell_fir_15 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_15() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir15_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir15_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir15_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_14
proc create_hier_cell_fir_14 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_14() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir14_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir14_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir14_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_13
proc create_hier_cell_fir_13 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_13() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir13_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir13_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir13_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_12
proc create_hier_cell_fir_12 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_12() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir12_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir12_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir12_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_11
proc create_hier_cell_fir_11 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_11() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir11_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir11_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir11_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_10
proc create_hier_cell_fir_10 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_10() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir10_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir10_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir10_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_09
proc create_hier_cell_fir_09 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_09() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir09_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir09_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir09_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_08
proc create_hier_cell_fir_08 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_08() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir08_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir08_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir08_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_07
proc create_hier_cell_fir_07 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_07() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir07_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir07_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir07_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_06
proc create_hier_cell_fir_06 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_06() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir06_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {26} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir06_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir06_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_05
proc create_hier_cell_fir_05 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_05() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir05_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir05_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir05_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_04
proc create_hier_cell_fir_04 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_04() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir04_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir04_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir04_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_03
proc create_hier_cell_fir_03 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_03() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir03_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir03_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir03_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_02
proc create_hier_cell_fir_02 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_02() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir02_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir02_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir02_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_01
proc create_hier_cell_fir_01 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_01() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir01_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_Fanout {false} \
    CONFIG.Coefficient_File $fircoe_source/fir01_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Control_Broadcast_Fanout {false} \
    CONFIG.Control_Column_Fanout {false} \
    CONFIG.Control_LUT_Pipeline {false} \
    CONFIG.Control_Path_Fanout {false} \
    CONFIG.Data_Path_Broadcast {false} \
    CONFIG.Data_Path_Fanout {false} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Disable_Half_Band_Centre_Tap {false} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Inter_Column_Pipe_Length {4} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.No_BRAM_Read_First_Mode {false} \
    CONFIG.No_SRL_Attributes {false} \
    CONFIG.Number_Channels {1} \
    CONFIG.Optimal_Column_Lengths {false} \
    CONFIG.Optimization_Goal {Area} \
    CONFIG.Optimization_List {None} \
    CONFIG.Optimization_Selection {None} \
    CONFIG.Other {false} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Pre_Adder_Pipeline {false} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir01_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fir_00
proc create_hier_cell_fir_00 { parentCell nameHier fircoe_source } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_fir_00() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 15 -to 0 din_0
  create_bd_pin -dir I -from 15 -to 0 din_1
  create_bd_pin -dir I -from 15 -to 0 din_2
  create_bd_pin -dir O -from 31 -to 0 Dout_0

  # Create instance: fir_0, and set properties
  set fir_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_0 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir00_1.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_0


  # Create instance: fir_1, and set properties
  set fir_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_1 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir00_2.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {29} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_1


  # Create instance: fir_2, and set properties
  set fir_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_2 ]
  set_property -dict [list \
    CONFIG.Clock_Frequency {300.0} \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir00_3.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Non_Symmetric} \
    CONFIG.Coefficient_Width {18} \
    CONFIG.ColumnConfig {11} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Decimation_Rate {1} \
    CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
    CONFIG.Filter_Type {Interpolated} \
    CONFIG.Interpolation_Rate {1} \
    CONFIG.Number_Channels {1} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {27} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
    CONFIG.Sample_Frequency {0.001} \
    CONFIG.Zero_Pack_Factor {4} \
  ] $fir_2


  # Create instance: sub_fir_adder, and set properties
  set block_name sub_fir_adder
  set block_cell_name sub_fir_adder
  if { [catch {set sub_fir_adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sub_fir_adder eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins clk] [get_bd_pins fir_0/aclk] [get_bd_pins fir_1/aclk] [get_bd_pins fir_2/aclk] [get_bd_pins sub_fir_adder/clk]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fir_1/s_axis_data_tdata]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fir_2/s_axis_data_tdata]
  connect_bd_net -net fir_0_m_axis_data_tdata [get_bd_pins fir_0/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din0]
  connect_bd_net -net fir_1_m_axis_data_tdata [get_bd_pins fir_1/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din1]
  connect_bd_net -net fir_2_m_axis_data_tdata [get_bd_pins fir_2/m_axis_data_tdata] [get_bd_pins sub_fir_adder/Din2]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_pins din_0] [get_bd_pins fir_0/s_axis_data_tdata]
  connect_bd_net -net sub_fir_adder_Dout [get_bd_pins sub_fir_adder/Dout] [get_bd_pins Dout_0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_0/s_axis_data_tvalid] [get_bd_pins fir_1/s_axis_data_tvalid] [get_bd_pins fir_2/s_axis_data_tvalid]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clk [ create_bd_port -dir I -type clk clk ]
  set Dout_00 [ create_bd_port -dir O -from 31 -to 0 Dout_00 ]
  set din_00_1 [ create_bd_port -dir I -from 15 -to 0 din_00_1 ]
  set din_00_0 [ create_bd_port -dir I -from 15 -to 0 din_00_0 ]
  set din_00_2 [ create_bd_port -dir I -from 15 -to 0 din_00_2 ]
  set Dout_01 [ create_bd_port -dir O -from 31 -to 0 Dout_01 ]
  set din_01_0 [ create_bd_port -dir I -from 15 -to 0 din_01_0 ]
  set din_01_1 [ create_bd_port -dir I -from 15 -to 0 din_01_1 ]
  set din_01_2 [ create_bd_port -dir I -from 15 -to 0 din_01_2 ]
  set Dout_02 [ create_bd_port -dir O -from 31 -to 0 Dout_02 ]
  set din_02_0 [ create_bd_port -dir I -from 15 -to 0 din_02_0 ]
  set din_02_1 [ create_bd_port -dir I -from 15 -to 0 din_02_1 ]
  set din_02_2 [ create_bd_port -dir I -from 15 -to 0 din_02_2 ]
  set Dout_03 [ create_bd_port -dir O -from 31 -to 0 Dout_03 ]
  set din_03_0 [ create_bd_port -dir I -from 15 -to 0 din_03_0 ]
  set din_03_1 [ create_bd_port -dir I -from 15 -to 0 din_03_1 ]
  set din_03_2 [ create_bd_port -dir I -from 15 -to 0 din_03_2 ]
  set Dout_04 [ create_bd_port -dir O -from 31 -to 0 Dout_04 ]
  set din_04_0 [ create_bd_port -dir I -from 15 -to 0 din_04_0 ]
  set din_04_1 [ create_bd_port -dir I -from 15 -to 0 din_04_1 ]
  set din_04_2 [ create_bd_port -dir I -from 15 -to 0 din_04_2 ]
  set Dout_05 [ create_bd_port -dir O -from 31 -to 0 Dout_05 ]
  set din_05_0 [ create_bd_port -dir I -from 15 -to 0 din_05_0 ]
  set din_05_1 [ create_bd_port -dir I -from 15 -to 0 din_05_1 ]
  set din_05_2 [ create_bd_port -dir I -from 15 -to 0 din_05_2 ]
  set Dout_06 [ create_bd_port -dir O -from 31 -to 0 Dout_06 ]
  set din_06_0 [ create_bd_port -dir I -from 15 -to 0 din_06_0 ]
  set din_06_1 [ create_bd_port -dir I -from 15 -to 0 din_06_1 ]
  set din_06_2 [ create_bd_port -dir I -from 15 -to 0 din_06_2 ]
  set Dout_07 [ create_bd_port -dir O -from 31 -to 0 Dout_07 ]
  set din_07_0 [ create_bd_port -dir I -from 15 -to 0 din_07_0 ]
  set din_07_1 [ create_bd_port -dir I -from 15 -to 0 din_07_1 ]
  set din_07_2 [ create_bd_port -dir I -from 15 -to 0 din_07_2 ]
  set Dout_08 [ create_bd_port -dir O -from 31 -to 0 Dout_08 ]
  set din_08_0 [ create_bd_port -dir I -from 15 -to 0 din_08_0 ]
  set din_08_1 [ create_bd_port -dir I -from 15 -to 0 din_08_1 ]
  set din_08_2 [ create_bd_port -dir I -from 15 -to 0 din_08_2 ]
  set Dout_09 [ create_bd_port -dir O -from 31 -to 0 Dout_09 ]
  set din_09_0 [ create_bd_port -dir I -from 15 -to 0 din_09_0 ]
  set din_09_1 [ create_bd_port -dir I -from 15 -to 0 din_09_1 ]
  set din_09_2 [ create_bd_port -dir I -from 15 -to 0 din_09_2 ]
  set Dout_10 [ create_bd_port -dir O -from 31 -to 0 Dout_10 ]
  set din_10_0 [ create_bd_port -dir I -from 15 -to 0 din_10_0 ]
  set din_10_1 [ create_bd_port -dir I -from 15 -to 0 din_10_1 ]
  set din_10_2 [ create_bd_port -dir I -from 15 -to 0 din_10_2 ]
  set Dout_11 [ create_bd_port -dir O -from 31 -to 0 Dout_11 ]
  set din_11_0 [ create_bd_port -dir I -from 15 -to 0 din_11_0 ]
  set din_11_1 [ create_bd_port -dir I -from 15 -to 0 din_11_1 ]
  set din_11_2 [ create_bd_port -dir I -from 15 -to 0 din_11_2 ]
  set Dout_12 [ create_bd_port -dir O -from 31 -to 0 Dout_12 ]
  set din_12_0 [ create_bd_port -dir I -from 15 -to 0 din_12_0 ]
  set din_12_1 [ create_bd_port -dir I -from 15 -to 0 din_12_1 ]
  set din_12_2 [ create_bd_port -dir I -from 15 -to 0 din_12_2 ]
  set Dout_13 [ create_bd_port -dir O -from 31 -to 0 Dout_13 ]
  set din_13_0 [ create_bd_port -dir I -from 15 -to 0 din_13_0 ]
  set din_13_1 [ create_bd_port -dir I -from 15 -to 0 din_13_1 ]
  set din_13_2 [ create_bd_port -dir I -from 15 -to 0 din_13_2 ]
  set Dout_14 [ create_bd_port -dir O -from 31 -to 0 Dout_14 ]
  set din_14_0 [ create_bd_port -dir I -from 15 -to 0 din_14_0 ]
  set din_14_1 [ create_bd_port -dir I -from 15 -to 0 din_14_1 ]
  set din_14_2 [ create_bd_port -dir I -from 15 -to 0 din_14_2 ]
  set Dout_15 [ create_bd_port -dir O -from 31 -to 0 Dout_15 ]
  set din_15_0 [ create_bd_port -dir I -from 15 -to 0 din_15_0 ]
  set din_15_1 [ create_bd_port -dir I -from 15 -to 0 din_15_1 ]
  set din_15_2 [ create_bd_port -dir I -from 15 -to 0 din_15_2 ]
  set Dout_16 [ create_bd_port -dir O -from 31 -to 0 Dout_16 ]
  set din_16_0 [ create_bd_port -dir I -from 15 -to 0 din_16_0 ]
  set din_16_1 [ create_bd_port -dir I -from 15 -to 0 din_16_1 ]
  set din_16_2 [ create_bd_port -dir I -from 15 -to 0 din_16_2 ]
  set Dout_17 [ create_bd_port -dir O -from 31 -to 0 Dout_17 ]
  set din_17_0 [ create_bd_port -dir I -from 15 -to 0 din_17_0 ]
  set din_17_1 [ create_bd_port -dir I -from 15 -to 0 din_17_1 ]
  set din_17_2 [ create_bd_port -dir I -from 15 -to 0 din_17_2 ]
  set Dout_18 [ create_bd_port -dir O -from 31 -to 0 Dout_18 ]
  set din_18_0 [ create_bd_port -dir I -from 15 -to 0 din_18_0 ]
  set din_18_1 [ create_bd_port -dir I -from 15 -to 0 din_18_1 ]
  set din_18_2 [ create_bd_port -dir I -from 15 -to 0 din_18_2 ]
  set Dout_19 [ create_bd_port -dir O -from 31 -to 0 Dout_19 ]
  set din_19_0 [ create_bd_port -dir I -from 15 -to 0 din_19_0 ]
  set din_19_1 [ create_bd_port -dir I -from 15 -to 0 din_19_1 ]
  set din_19_2 [ create_bd_port -dir I -from 15 -to 0 din_19_2 ]
  set Dout_20 [ create_bd_port -dir O -from 31 -to 0 Dout_20 ]
  set din_20_0 [ create_bd_port -dir I -from 15 -to 0 din_20_0 ]
  set din_20_1 [ create_bd_port -dir I -from 15 -to 0 din_20_1 ]
  set din_20_2 [ create_bd_port -dir I -from 15 -to 0 din_20_2 ]
  set Dout_21 [ create_bd_port -dir O -from 31 -to 0 Dout_21 ]
  set din_21_0 [ create_bd_port -dir I -from 15 -to 0 din_21_0 ]
  set din_21_1 [ create_bd_port -dir I -from 15 -to 0 din_21_1 ]
  set din_21_2 [ create_bd_port -dir I -from 15 -to 0 din_21_2 ]
  set Dout_22 [ create_bd_port -dir O -from 31 -to 0 Dout_22 ]
  set din_22_0 [ create_bd_port -dir I -from 15 -to 0 din_22_0 ]
  set din_22_1 [ create_bd_port -dir I -from 15 -to 0 din_22_1 ]
  set din_22_2 [ create_bd_port -dir I -from 15 -to 0 din_22_2 ]
  set Dout_23 [ create_bd_port -dir O -from 31 -to 0 Dout_23 ]
  set din_23_0 [ create_bd_port -dir I -from 15 -to 0 din_23_0 ]
  set din_23_1 [ create_bd_port -dir I -from 15 -to 0 din_23_1 ]
  set din_23_2 [ create_bd_port -dir I -from 15 -to 0 din_23_2 ]
  set Dout_24 [ create_bd_port -dir O -from 31 -to 0 Dout_24 ]
  set din_24_0 [ create_bd_port -dir I -from 15 -to 0 din_24_0 ]
  set din_24_1 [ create_bd_port -dir I -from 15 -to 0 din_24_1 ]
  set din_24_2 [ create_bd_port -dir I -from 15 -to 0 din_24_2 ]
  set Dout_25 [ create_bd_port -dir O -from 31 -to 0 Dout_25 ]
  set din_25_0 [ create_bd_port -dir I -from 15 -to 0 din_25_0 ]
  set din_25_1 [ create_bd_port -dir I -from 15 -to 0 din_25_1 ]
  set din_25_2 [ create_bd_port -dir I -from 15 -to 0 din_25_2 ]
  set Dout_26 [ create_bd_port -dir O -from 31 -to 0 Dout_26 ]
  set din_26_0 [ create_bd_port -dir I -from 15 -to 0 din_26_0 ]
  set din_26_1 [ create_bd_port -dir I -from 15 -to 0 din_26_1 ]
  set din_26_2 [ create_bd_port -dir I -from 15 -to 0 din_26_2 ]
  set Dout_27 [ create_bd_port -dir O -from 31 -to 0 Dout_27 ]
  set din_27_0 [ create_bd_port -dir I -from 15 -to 0 din_27_0 ]
  set din_27_1 [ create_bd_port -dir I -from 15 -to 0 din_27_1 ]
  set din_27_2 [ create_bd_port -dir I -from 15 -to 0 din_27_2 ]
  set Dout_28 [ create_bd_port -dir O -from 31 -to 0 Dout_28 ]
  set din_28_0 [ create_bd_port -dir I -from 15 -to 0 din_28_0 ]
  set din_28_1 [ create_bd_port -dir I -from 15 -to 0 din_28_1 ]
  set din_28_2 [ create_bd_port -dir I -from 15 -to 0 din_28_2 ]
  set Dout_29 [ create_bd_port -dir O -from 31 -to 0 Dout_29 ]
  set din_29_0 [ create_bd_port -dir I -from 15 -to 0 din_29_0 ]
  set din_29_1 [ create_bd_port -dir I -from 15 -to 0 din_29_1 ]
  set din_29_2 [ create_bd_port -dir I -from 15 -to 0 din_29_2 ]
  set Dout_30 [ create_bd_port -dir O -from 31 -to 0 Dout_30 ]
  set din_30_0 [ create_bd_port -dir I -from 15 -to 0 din_30_0 ]
  set din_30_1 [ create_bd_port -dir I -from 15 -to 0 din_30_1 ]
  set din_30_2 [ create_bd_port -dir I -from 15 -to 0 din_30_2 ]
  set Dout_31 [ create_bd_port -dir O -from 31 -to 0 Dout_31 ]
  set din_31_0 [ create_bd_port -dir I -from 15 -to 0 din_31_0 ]
  set din_31_1 [ create_bd_port -dir I -from 15 -to 0 din_31_1 ]
  set din_31_2 [ create_bd_port -dir I -from 15 -to 0 din_31_2 ]

  set fircoe_source /tools/mlib_devel/scilab_library/hdl_sources/seu_dpd_opfb_4_3_32ch/FIRS

  # Create instance: fir_00
  create_hier_cell_fir_00 [current_bd_instance .]   fir_00 $fircoe_source

  # Create instance: fir_01
  create_hier_cell_fir_01 [current_bd_instance .]   fir_01 $fircoe_source

  # Create instance: fir_02
  create_hier_cell_fir_02 [current_bd_instance .]   fir_02 $fircoe_source

  # Create instance: fir_03
  create_hier_cell_fir_03 [current_bd_instance .]   fir_03 $fircoe_source

  # Create instance: fir_04
  create_hier_cell_fir_04 [current_bd_instance .]   fir_04 $fircoe_source

  # Create instance: fir_05
  create_hier_cell_fir_05 [current_bd_instance .]   fir_05 $fircoe_source

  # Create instance: fir_06
  create_hier_cell_fir_06 [current_bd_instance .]   fir_06 $fircoe_source

  # Create instance: fir_07
  create_hier_cell_fir_07 [current_bd_instance .]   fir_07 $fircoe_source

  # Create instance: fir_08
  create_hier_cell_fir_08 [current_bd_instance .]   fir_08 $fircoe_source

  # Create instance: fir_09
  create_hier_cell_fir_09 [current_bd_instance .]   fir_09 $fircoe_source

  # Create instance: fir_10
  create_hier_cell_fir_10 [current_bd_instance .]   fir_10 $fircoe_source

  # Create instance: fir_11
  create_hier_cell_fir_11 [current_bd_instance .]   fir_11 $fircoe_source

  # Create instance: fir_12
  create_hier_cell_fir_12 [current_bd_instance .]   fir_12 $fircoe_source

  # Create instance: fir_13
  create_hier_cell_fir_13 [current_bd_instance .]   fir_13 $fircoe_source

  # Create instance: fir_14
  create_hier_cell_fir_14 [current_bd_instance .]   fir_14 $fircoe_source

  # Create instance: fir_15
  create_hier_cell_fir_15 [current_bd_instance .]   fir_15 $fircoe_source

  # Create instance: fir_16
  create_hier_cell_fir_16 [current_bd_instance .]   fir_16 $fircoe_source

  # Create instance: fir_17
  create_hier_cell_fir_17 [current_bd_instance .]   fir_17 $fircoe_source

  # Create instance: fir_18
  create_hier_cell_fir_18 [current_bd_instance .]   fir_18 $fircoe_source

  # Create instance: fir_19
  create_hier_cell_fir_19 [current_bd_instance .]   fir_19 $fircoe_source

  # Create instance: fir_20
  create_hier_cell_fir_20 [current_bd_instance .]   fir_20 $fircoe_source

  # Create instance: fir_21
  create_hier_cell_fir_21 [current_bd_instance .]   fir_21 $fircoe_source

  # Create instance: fir_22
  create_hier_cell_fir_22 [current_bd_instance .]   fir_22 $fircoe_source

  # Create instance: fir_23
  create_hier_cell_fir_23 [current_bd_instance .]   fir_23 $fircoe_source

  # Create instance: fir_24
  create_hier_cell_fir_24 [current_bd_instance .]   fir_24 $fircoe_source

  # Create instance: fir_25
  create_hier_cell_fir_25 [current_bd_instance .]   fir_25 $fircoe_source

  # Create instance: fir_26
  create_hier_cell_fir_26 [current_bd_instance .]   fir_26 $fircoe_source

  # Create instance: fir_27
  create_hier_cell_fir_27 [current_bd_instance .]   fir_27 $fircoe_source

  # Create instance: fir_28
  create_hier_cell_fir_28 [current_bd_instance .]   fir_28 $fircoe_source

  # Create instance: fir_29
  create_hier_cell_fir_29 [current_bd_instance .]   fir_29 $fircoe_source

  # Create instance: fir_30
  create_hier_cell_fir_30 [current_bd_instance .]   fir_30 $fircoe_source

  # Create instance: fir_31
  create_hier_cell_fir_31 [current_bd_instance .]   fir_31 $fircoe_source

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_ports clk] [get_bd_pins fir_00/clk] [get_bd_pins fir_01/clk] [get_bd_pins fir_02/clk] [get_bd_pins fir_03/clk] [get_bd_pins fir_04/clk] [get_bd_pins fir_05/clk] [get_bd_pins fir_06/clk] [get_bd_pins fir_07/clk] [get_bd_pins fir_08/clk] [get_bd_pins fir_09/clk] [get_bd_pins fir_10/clk] [get_bd_pins fir_11/clk] [get_bd_pins fir_12/clk] [get_bd_pins fir_13/clk] [get_bd_pins fir_14/clk] [get_bd_pins fir_15/clk] [get_bd_pins fir_16/clk] [get_bd_pins fir_17/clk] [get_bd_pins fir_18/clk] [get_bd_pins fir_19/clk] [get_bd_pins fir_20/clk] [get_bd_pins fir_21/clk] [get_bd_pins fir_22/clk] [get_bd_pins fir_23/clk] [get_bd_pins fir_24/clk] [get_bd_pins fir_25/clk] [get_bd_pins fir_26/clk] [get_bd_pins fir_27/clk] [get_bd_pins fir_28/clk] [get_bd_pins fir_29/clk] [get_bd_pins fir_30/clk] [get_bd_pins fir_31/clk]
  connect_bd_net -net din_0_0_1 [get_bd_ports din_00_0] [get_bd_pins fir_00/din_0]
  connect_bd_net -net din_0_10_1 [get_bd_ports din_10_0] [get_bd_pins fir_10/din_0]
  connect_bd_net -net din_0_11_1 [get_bd_ports din_11_0] [get_bd_pins fir_11/din_0]
  connect_bd_net -net din_0_12_1 [get_bd_ports din_12_0] [get_bd_pins fir_12/din_0]
  connect_bd_net -net din_0_13_1 [get_bd_ports din_13_0] [get_bd_pins fir_13/din_0]
  connect_bd_net -net din_0_14_1 [get_bd_ports din_14_0] [get_bd_pins fir_14/din_0]
  connect_bd_net -net din_0_15_1 [get_bd_ports din_15_0] [get_bd_pins fir_15/din_0]
  connect_bd_net -net din_0_16_1 [get_bd_ports din_16_0] [get_bd_pins fir_16/din_0]
  connect_bd_net -net din_0_17_1 [get_bd_ports din_17_0] [get_bd_pins fir_17/din_0]
  connect_bd_net -net din_0_18_1 [get_bd_ports din_18_0] [get_bd_pins fir_18/din_0]
  connect_bd_net -net din_0_19_1 [get_bd_ports din_19_0] [get_bd_pins fir_19/din_0]
  connect_bd_net -net din_0_1_1 [get_bd_ports din_01_0] [get_bd_pins fir_01/din_0]
  connect_bd_net -net din_0_20_1 [get_bd_ports din_20_0] [get_bd_pins fir_20/din_0]
  connect_bd_net -net din_0_21_1 [get_bd_ports din_21_0] [get_bd_pins fir_21/din_0]
  connect_bd_net -net din_0_22_1 [get_bd_ports din_22_0] [get_bd_pins fir_22/din_0]
  connect_bd_net -net din_0_23_1 [get_bd_ports din_23_0] [get_bd_pins fir_23/din_0]
  connect_bd_net -net din_0_24_1 [get_bd_ports din_24_0] [get_bd_pins fir_24/din_0]
  connect_bd_net -net din_0_25_1 [get_bd_ports din_25_0] [get_bd_pins fir_25/din_0]
  connect_bd_net -net din_0_26_1 [get_bd_ports din_26_0] [get_bd_pins fir_26/din_0]
  connect_bd_net -net din_0_27_1 [get_bd_ports din_27_0] [get_bd_pins fir_27/din_0]
  connect_bd_net -net din_0_28_1 [get_bd_ports din_28_0] [get_bd_pins fir_28/din_0]
  connect_bd_net -net din_0_29_1 [get_bd_ports din_29_0] [get_bd_pins fir_29/din_0]
  connect_bd_net -net din_0_2_1 [get_bd_ports din_02_0] [get_bd_pins fir_02/din_0]
  connect_bd_net -net din_0_30_1 [get_bd_ports din_30_0] [get_bd_pins fir_30/din_0]
  connect_bd_net -net din_0_31_1 [get_bd_ports din_31_0] [get_bd_pins fir_31/din_0]
  connect_bd_net -net din_0_3_1 [get_bd_ports din_03_0] [get_bd_pins fir_03/din_0]
  connect_bd_net -net din_0_4_1 [get_bd_ports din_04_0] [get_bd_pins fir_04/din_0]
  connect_bd_net -net din_0_5_1 [get_bd_ports din_05_0] [get_bd_pins fir_05/din_0]
  connect_bd_net -net din_0_6_1 [get_bd_ports din_06_0] [get_bd_pins fir_06/din_0]
  connect_bd_net -net din_0_7_1 [get_bd_ports din_07_0] [get_bd_pins fir_07/din_0]
  connect_bd_net -net din_0_8_1 [get_bd_ports din_08_0] [get_bd_pins fir_08/din_0]
  connect_bd_net -net din_0_9_1 [get_bd_ports din_09_0] [get_bd_pins fir_09/din_0]
  connect_bd_net -net din_1_0_1 [get_bd_ports din_00_1] [get_bd_pins fir_00/din_1]
  connect_bd_net -net din_1_10_1 [get_bd_ports din_10_1] [get_bd_pins fir_10/din_1]
  connect_bd_net -net din_1_11_1 [get_bd_ports din_11_1] [get_bd_pins fir_11/din_1]
  connect_bd_net -net din_1_12_1 [get_bd_ports din_12_1] [get_bd_pins fir_12/din_1]
  connect_bd_net -net din_1_13_1 [get_bd_ports din_13_1] [get_bd_pins fir_13/din_1]
  connect_bd_net -net din_1_14_1 [get_bd_ports din_14_1] [get_bd_pins fir_14/din_1]
  connect_bd_net -net din_1_15_1 [get_bd_ports din_15_1] [get_bd_pins fir_15/din_1]
  connect_bd_net -net din_1_16_1 [get_bd_ports din_16_1] [get_bd_pins fir_16/din_1]
  connect_bd_net -net din_1_17_1 [get_bd_ports din_17_1] [get_bd_pins fir_17/din_1]
  connect_bd_net -net din_1_18_1 [get_bd_ports din_18_1] [get_bd_pins fir_18/din_1]
  connect_bd_net -net din_1_19_1 [get_bd_ports din_19_1] [get_bd_pins fir_19/din_1]
  connect_bd_net -net din_1_1_1 [get_bd_ports din_01_1] [get_bd_pins fir_01/din_1]
  connect_bd_net -net din_1_20_1 [get_bd_ports din_20_1] [get_bd_pins fir_20/din_1]
  connect_bd_net -net din_1_21_1 [get_bd_ports din_21_1] [get_bd_pins fir_21/din_1]
  connect_bd_net -net din_1_22_1 [get_bd_ports din_22_1] [get_bd_pins fir_22/din_1]
  connect_bd_net -net din_1_23_1 [get_bd_ports din_23_1] [get_bd_pins fir_23/din_1]
  connect_bd_net -net din_1_24_1 [get_bd_ports din_24_1] [get_bd_pins fir_24/din_1]
  connect_bd_net -net din_1_25_1 [get_bd_ports din_25_1] [get_bd_pins fir_25/din_1]
  connect_bd_net -net din_1_26_1 [get_bd_ports din_26_1] [get_bd_pins fir_26/din_1]
  connect_bd_net -net din_1_27_1 [get_bd_ports din_27_1] [get_bd_pins fir_27/din_1]
  connect_bd_net -net din_1_28_1 [get_bd_ports din_28_1] [get_bd_pins fir_28/din_1]
  connect_bd_net -net din_1_29_1 [get_bd_ports din_29_1] [get_bd_pins fir_29/din_1]
  connect_bd_net -net din_1_2_1 [get_bd_ports din_02_1] [get_bd_pins fir_02/din_1]
  connect_bd_net -net din_1_30_1 [get_bd_ports din_30_1] [get_bd_pins fir_30/din_1]
  connect_bd_net -net din_1_31_1 [get_bd_ports din_31_1] [get_bd_pins fir_31/din_1]
  connect_bd_net -net din_1_3_1 [get_bd_ports din_03_1] [get_bd_pins fir_03/din_1]
  connect_bd_net -net din_1_4_1 [get_bd_ports din_04_1] [get_bd_pins fir_04/din_1]
  connect_bd_net -net din_1_5_1 [get_bd_ports din_05_1] [get_bd_pins fir_05/din_1]
  connect_bd_net -net din_1_6_1 [get_bd_ports din_06_1] [get_bd_pins fir_06/din_1]
  connect_bd_net -net din_1_7_1 [get_bd_ports din_07_1] [get_bd_pins fir_07/din_1]
  connect_bd_net -net din_1_8_1 [get_bd_ports din_08_1] [get_bd_pins fir_08/din_1]
  connect_bd_net -net din_1_9_1 [get_bd_ports din_09_1] [get_bd_pins fir_09/din_1]
  connect_bd_net -net din_2_0_1 [get_bd_ports din_00_2] [get_bd_pins fir_00/din_2]
  connect_bd_net -net din_2_10_1 [get_bd_ports din_10_2] [get_bd_pins fir_10/din_2]
  connect_bd_net -net din_2_11_1 [get_bd_ports din_11_2] [get_bd_pins fir_11/din_2]
  connect_bd_net -net din_2_12_1 [get_bd_ports din_12_2] [get_bd_pins fir_12/din_2]
  connect_bd_net -net din_2_13_1 [get_bd_ports din_13_2] [get_bd_pins fir_13/din_2]
  connect_bd_net -net din_2_14_1 [get_bd_ports din_14_2] [get_bd_pins fir_14/din_2]
  connect_bd_net -net din_2_15_1 [get_bd_ports din_15_2] [get_bd_pins fir_15/din_2]
  connect_bd_net -net din_2_16_1 [get_bd_ports din_16_2] [get_bd_pins fir_16/din_2]
  connect_bd_net -net din_2_17_1 [get_bd_ports din_17_2] [get_bd_pins fir_17/din_2]
  connect_bd_net -net din_2_18_1 [get_bd_ports din_18_2] [get_bd_pins fir_18/din_2]
  connect_bd_net -net din_2_19_1 [get_bd_ports din_19_2] [get_bd_pins fir_19/din_2]
  connect_bd_net -net din_2_1_1 [get_bd_ports din_01_2] [get_bd_pins fir_01/din_2]
  connect_bd_net -net din_2_20_1 [get_bd_ports din_20_2] [get_bd_pins fir_20/din_2]
  connect_bd_net -net din_2_21_1 [get_bd_ports din_21_2] [get_bd_pins fir_21/din_2]
  connect_bd_net -net din_2_22_1 [get_bd_ports din_22_2] [get_bd_pins fir_22/din_2]
  connect_bd_net -net din_2_23_1 [get_bd_ports din_23_2] [get_bd_pins fir_23/din_2]
  connect_bd_net -net din_2_24_1 [get_bd_ports din_24_2] [get_bd_pins fir_24/din_2]
  connect_bd_net -net din_2_25_1 [get_bd_ports din_25_2] [get_bd_pins fir_25/din_2]
  connect_bd_net -net din_2_26_1 [get_bd_ports din_26_2] [get_bd_pins fir_26/din_2]
  connect_bd_net -net din_2_27_1 [get_bd_ports din_27_2] [get_bd_pins fir_27/din_2]
  connect_bd_net -net din_2_28_1 [get_bd_ports din_28_2] [get_bd_pins fir_28/din_2]
  connect_bd_net -net din_2_29_1 [get_bd_ports din_29_2] [get_bd_pins fir_29/din_2]
  connect_bd_net -net din_2_2_1 [get_bd_ports din_02_2] [get_bd_pins fir_02/din_2]
  connect_bd_net -net din_2_30_1 [get_bd_ports din_30_2] [get_bd_pins fir_30/din_2]
  connect_bd_net -net din_2_31_1 [get_bd_ports din_31_2] [get_bd_pins fir_31/din_2]
  connect_bd_net -net din_2_3_1 [get_bd_ports din_03_2] [get_bd_pins fir_03/din_2]
  connect_bd_net -net din_2_4_1 [get_bd_ports din_04_2] [get_bd_pins fir_04/din_2]
  connect_bd_net -net din_2_5_1 [get_bd_ports din_05_2] [get_bd_pins fir_05/din_2]
  connect_bd_net -net din_2_6_1 [get_bd_ports din_06_2] [get_bd_pins fir_06/din_2]
  connect_bd_net -net din_2_7_1 [get_bd_ports din_07_2] [get_bd_pins fir_07/din_2]
  connect_bd_net -net din_2_8_1 [get_bd_ports din_08_2] [get_bd_pins fir_08/din_2]
  connect_bd_net -net din_2_9_1 [get_bd_ports din_09_2] [get_bd_pins fir_09/din_2]
  connect_bd_net -net fir_00_Dout_0 [get_bd_pins fir_00/Dout_0] [get_bd_ports Dout_00]
  connect_bd_net -net fir_01_Dout_0 [get_bd_pins fir_01/Dout_0] [get_bd_ports Dout_01]
  connect_bd_net -net fir_02_Dout_0 [get_bd_pins fir_02/Dout_0] [get_bd_ports Dout_02]
  connect_bd_net -net fir_03_Dout_0 [get_bd_pins fir_03/Dout_0] [get_bd_ports Dout_03]
  connect_bd_net -net fir_04_Dout_0 [get_bd_pins fir_04/Dout_0] [get_bd_ports Dout_04]
  connect_bd_net -net fir_05_Dout_0 [get_bd_pins fir_05/Dout_0] [get_bd_ports Dout_05]
  connect_bd_net -net fir_06_Dout_0 [get_bd_pins fir_06/Dout_0] [get_bd_ports Dout_06]
  connect_bd_net -net fir_07_Dout_0 [get_bd_pins fir_07/Dout_0] [get_bd_ports Dout_07]
  connect_bd_net -net fir_08_Dout_0 [get_bd_pins fir_08/Dout_0] [get_bd_ports Dout_08]
  connect_bd_net -net fir_09_Dout_0 [get_bd_pins fir_09/Dout_0] [get_bd_ports Dout_09]
  connect_bd_net -net fir_10_Dout_0 [get_bd_pins fir_10/Dout_0] [get_bd_ports Dout_10]
  connect_bd_net -net fir_11_Dout_0 [get_bd_pins fir_11/Dout_0] [get_bd_ports Dout_11]
  connect_bd_net -net fir_12_Dout_0 [get_bd_pins fir_12/Dout_0] [get_bd_ports Dout_12]
  connect_bd_net -net fir_13_Dout_0 [get_bd_pins fir_13/Dout_0] [get_bd_ports Dout_13]
  connect_bd_net -net fir_14_Dout_0 [get_bd_pins fir_14/Dout_0] [get_bd_ports Dout_14]
  connect_bd_net -net fir_15_Dout_0 [get_bd_pins fir_15/Dout_0] [get_bd_ports Dout_15]
  connect_bd_net -net fir_16_Dout_0 [get_bd_pins fir_16/Dout_0] [get_bd_ports Dout_16]
  connect_bd_net -net fir_17_Dout_0 [get_bd_pins fir_17/Dout_0] [get_bd_ports Dout_17]
  connect_bd_net -net fir_18_Dout_0 [get_bd_pins fir_18/Dout_0] [get_bd_ports Dout_18]
  connect_bd_net -net fir_19_Dout_0 [get_bd_pins fir_19/Dout_0] [get_bd_ports Dout_19]
  connect_bd_net -net fir_20_Dout_0 [get_bd_pins fir_20/Dout_0] [get_bd_ports Dout_20]
  connect_bd_net -net fir_21_Dout_0 [get_bd_pins fir_21/Dout_0] [get_bd_ports Dout_21]
  connect_bd_net -net fir_22_Dout_0 [get_bd_pins fir_22/Dout_0] [get_bd_ports Dout_22]
  connect_bd_net -net fir_23_Dout_0 [get_bd_pins fir_23/Dout_0] [get_bd_ports Dout_23]
  connect_bd_net -net fir_24_Dout_0 [get_bd_pins fir_24/Dout_0] [get_bd_ports Dout_24]
  connect_bd_net -net fir_25_Dout_0 [get_bd_pins fir_25/Dout_0] [get_bd_ports Dout_25]
  connect_bd_net -net fir_26_Dout_0 [get_bd_pins fir_26/Dout_0] [get_bd_ports Dout_26]
  connect_bd_net -net fir_27_Dout_0 [get_bd_pins fir_27/Dout_0] [get_bd_ports Dout_27]
  connect_bd_net -net fir_28_Dout_0 [get_bd_pins fir_28/Dout_0] [get_bd_ports Dout_28]
  connect_bd_net -net fir_29_Dout_0 [get_bd_pins fir_29/Dout_0] [get_bd_ports Dout_29]
  connect_bd_net -net fir_30_Dout_0 [get_bd_pins fir_30/Dout_0] [get_bd_ports Dout_30]
  connect_bd_net -net fir_31_Dout_0 [get_bd_pins fir_31/Dout_0] [get_bd_ports Dout_31]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


