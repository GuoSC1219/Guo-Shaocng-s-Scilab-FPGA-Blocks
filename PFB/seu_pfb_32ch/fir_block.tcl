
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

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



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
  set din_00 [ create_bd_port -dir I -from 15 -to 0 din_00 ]
  set dout_00 [ create_bd_port -dir O -from 31 -to 0 dout_00 ]
  set clk [ create_bd_port -dir I -type clk clk ]
  set din_01 [ create_bd_port -dir I -from 15 -to 0 din_01 ]
  set dout_01 [ create_bd_port -dir O -from 31 -to 0 dout_01 ]
  set din_02 [ create_bd_port -dir I -from 15 -to 0 din_02 ]
  set dout_02 [ create_bd_port -dir O -from 31 -to 0 dout_02 ]
  set din_03 [ create_bd_port -dir I -from 15 -to 0 din_03 ]
  set dout_03 [ create_bd_port -dir O -from 31 -to 0 dout_03 ]
  set din_04 [ create_bd_port -dir I -from 15 -to 0 din_04 ]
  set dout_04 [ create_bd_port -dir O -from 31 -to 0 dout_04 ]
  set din_05 [ create_bd_port -dir I -from 15 -to 0 din_05 ]
  set dout_05 [ create_bd_port -dir O -from 31 -to 0 dout_05 ]
  set din_06 [ create_bd_port -dir I -from 15 -to 0 din_06 ]
  set dout_06 [ create_bd_port -dir O -from 31 -to 0 dout_06 ]
  set din_07 [ create_bd_port -dir I -from 15 -to 0 din_07 ]
  set dout_07 [ create_bd_port -dir O -from 31 -to 0 dout_07 ]
  set din_08 [ create_bd_port -dir I -from 15 -to 0 din_08 ]
  set dout_08 [ create_bd_port -dir O -from 31 -to 0 dout_08 ]
  set din_09 [ create_bd_port -dir I -from 15 -to 0 din_09 ]
  set dout_09 [ create_bd_port -dir O -from 31 -to 0 dout_09 ]
  set din_10 [ create_bd_port -dir I -from 15 -to 0 din_10 ]
  set dout_10 [ create_bd_port -dir O -from 31 -to 0 dout_10 ]
  set din_11 [ create_bd_port -dir I -from 15 -to 0 din_11 ]
  set dout_11 [ create_bd_port -dir O -from 31 -to 0 dout_11 ]
  set din_12 [ create_bd_port -dir I -from 15 -to 0 din_12 ]
  set dout_12 [ create_bd_port -dir O -from 31 -to 0 dout_12 ]
  set din_13 [ create_bd_port -dir I -from 15 -to 0 din_13 ]
  set dout_13 [ create_bd_port -dir O -from 31 -to 0 dout_13 ]
  set din_14 [ create_bd_port -dir I -from 15 -to 0 din_14 ]
  set dout_14 [ create_bd_port -dir O -from 31 -to 0 dout_14 ]
  set din_15 [ create_bd_port -dir I -from 15 -to 0 din_15 ]
  set dout_15 [ create_bd_port -dir O -from 31 -to 0 dout_15 ]
  set din_16 [ create_bd_port -dir I -from 15 -to 0 din_16 ]
  set dout_16 [ create_bd_port -dir O -from 31 -to 0 dout_16 ]
  set din_17 [ create_bd_port -dir I -from 15 -to 0 din_17 ]
  set dout_17 [ create_bd_port -dir O -from 31 -to 0 dout_17 ]
  set din_18 [ create_bd_port -dir I -from 15 -to 0 din_18 ]
  set dout_18 [ create_bd_port -dir O -from 31 -to 0 dout_18 ]
  set din_19 [ create_bd_port -dir I -from 15 -to 0 din_19 ]
  set dout_19 [ create_bd_port -dir O -from 31 -to 0 dout_19 ]
  set din_20 [ create_bd_port -dir I -from 15 -to 0 din_20 ]
  set dout_20 [ create_bd_port -dir O -from 31 -to 0 dout_20 ]
  set din_21 [ create_bd_port -dir I -from 15 -to 0 din_21 ]
  set dout_21 [ create_bd_port -dir O -from 31 -to 0 dout_21 ]
  set din_22 [ create_bd_port -dir I -from 15 -to 0 din_22 ]
  set dout_22 [ create_bd_port -dir O -from 31 -to 0 dout_22 ]
  set din_23 [ create_bd_port -dir I -from 15 -to 0 din_23 ]
  set dout_23 [ create_bd_port -dir O -from 31 -to 0 dout_23 ]
  set din_24 [ create_bd_port -dir I -from 15 -to 0 din_24 ]
  set dout_24 [ create_bd_port -dir O -from 31 -to 0 dout_24 ]
  set din_25 [ create_bd_port -dir I -from 15 -to 0 din_25 ]
  set dout_25 [ create_bd_port -dir O -from 31 -to 0 dout_25 ]
  set din_26 [ create_bd_port -dir I -from 15 -to 0 din_26 ]
  set dout_26 [ create_bd_port -dir O -from 31 -to 0 dout_26 ]
  set din_27 [ create_bd_port -dir I -from 15 -to 0 din_27 ]
  set dout_27 [ create_bd_port -dir O -from 31 -to 0 dout_27 ]
  set din_28 [ create_bd_port -dir I -from 15 -to 0 din_28 ]
  set dout_28 [ create_bd_port -dir O -from 31 -to 0 dout_28 ]
  set din_29 [ create_bd_port -dir I -from 15 -to 0 din_29 ]
  set dout_29 [ create_bd_port -dir O -from 31 -to 0 dout_29 ]
  set din_30 [ create_bd_port -dir I -from 15 -to 0 din_30 ]
  set dout_30 [ create_bd_port -dir O -from 31 -to 0 dout_30 ]
  set din_31 [ create_bd_port -dir I -from 15 -to 0 din_31 ]
  set dout_31 [ create_bd_port -dir O -from 31 -to 0 dout_31 ]
  
  set fircoe_source /tools/mlib_devel/scilab_library/hdl_sources/seu_pfb_32ch/FIRS

  # Create instance: fir_00, and set properties
  set fir_00 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_00 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir00.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Sign {Signed} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Output_Width {28} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_00


  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: fir_01, and set properties
  set fir_01 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_01 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir01.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_01


  # Create instance: fir_02, and set properties
  set fir_02 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_02 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir02.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_02


  # Create instance: fir_03, and set properties
  set fir_03 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_03 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir03.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_03


  # Create instance: fir_04, and set properties
  set fir_04 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_04 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir04.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_04


  # Create instance: fir_05, and set properties
  set fir_05 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_05 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir05.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_05


  # Create instance: fir_06, and set properties
  set fir_06 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_06 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir06.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_06


  # Create instance: fir_07, and set properties
  set fir_07 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_07 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir07.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_07


  # Create instance: fir_08, and set properties
  set fir_08 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_08 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir08.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_08


  # Create instance: fir_09, and set properties
  set fir_09 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_09 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir09.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_09


  # Create instance: fir_10, and set properties
  set fir_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_10 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir10.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_10


  # Create instance: fir_11, and set properties
  set fir_11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_11 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir11.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_11


  # Create instance: fir_12, and set properties
  set fir_12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_12 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir12.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_12


  # Create instance: fir_13, and set properties
  set fir_13 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_13 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir13.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_13


  # Create instance: fir_14, and set properties
  set fir_14 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_14 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir14.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_14


  # Create instance: fir_15, and set properties
  set fir_15 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_15 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir15.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_15


  # Create instance: fir_16, and set properties
  set fir_16 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_16 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir16.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_16


  # Create instance: fir_17, and set properties
  set fir_17 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_17 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir17.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_17


  # Create instance: fir_18, and set properties
  set fir_18 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_18 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir18.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_18


  # Create instance: fir_19, and set properties
  set fir_19 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_19 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir19.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_19


  # Create instance: fir_20, and set properties
  set fir_20 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_20 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir20.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_20


  # Create instance: fir_21, and set properties
  set fir_21 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_21 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir21.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_21


  # Create instance: fir_22, and set properties
  set fir_22 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_22 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir22.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_22


  # Create instance: fir_23, and set properties
  set fir_23 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_23 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir23.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_23


  # Create instance: fir_24, and set properties
  set fir_24 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_24 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir24.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_24


  # Create instance: fir_25, and set properties
  set fir_25 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_25 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir25.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_25


  # Create instance: fir_26, and set properties
  set fir_26 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_26 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir26.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_26


  # Create instance: fir_27, and set properties
  set fir_27 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_27 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir27.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_27


  # Create instance: fir_28, and set properties
  set fir_28 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_28 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir28.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_28


  # Create instance: fir_29, and set properties
  set fir_29 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_29 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir29.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_29


  # Create instance: fir_30, and set properties
  set fir_30 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_30 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir30.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_30


  # Create instance: fir_31, and set properties
  set fir_31 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 fir_31 ]
  set_property -dict [list \
    CONFIG.CoefficientSource {COE_File} \
    CONFIG.Coefficient_File $fircoe_source/fir31.coe \
    CONFIG.Coefficient_Fractional_Bits {0} \
    CONFIG.Coefficient_Sets {1} \
    CONFIG.Coefficient_Sign {Signed} \
    CONFIG.Coefficient_Structure {Inferred} \
    CONFIG.Coefficient_Width {16} \
    CONFIG.ColumnConfig {39} \
    CONFIG.Data_Fractional_Bits {0} \
    CONFIG.Data_Width {12} \
    CONFIG.Output_Rounding_Mode {Full_Precision} \
    CONFIG.Quantization {Integer_Coefficients} \
    CONFIG.RateSpecification {Input_Sample_Period} \
    CONFIG.SamplePeriod {1} \
  ] $fir_31


  # Create port connections
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins fir_01/aclk] [get_bd_pins fir_00/aclk] [get_bd_pins fir_02/aclk] [get_bd_pins fir_03/aclk] [get_bd_pins fir_04/aclk] [get_bd_pins fir_05/aclk] [get_bd_pins fir_06/aclk] [get_bd_pins fir_07/aclk] [get_bd_pins fir_08/aclk] [get_bd_pins fir_09/aclk] [get_bd_pins fir_10/aclk] [get_bd_pins fir_11/aclk] [get_bd_pins fir_12/aclk] [get_bd_pins fir_13/aclk] [get_bd_pins fir_14/aclk] [get_bd_pins fir_15/aclk] [get_bd_pins fir_16/aclk] [get_bd_pins fir_17/aclk] [get_bd_pins fir_18/aclk] [get_bd_pins fir_19/aclk] [get_bd_pins fir_20/aclk] [get_bd_pins fir_21/aclk] [get_bd_pins fir_22/aclk] [get_bd_pins fir_23/aclk] [get_bd_pins fir_24/aclk] [get_bd_pins fir_25/aclk] [get_bd_pins fir_26/aclk] [get_bd_pins fir_27/aclk] [get_bd_pins fir_28/aclk] [get_bd_pins fir_29/aclk] [get_bd_pins fir_30/aclk] [get_bd_pins fir_31/aclk]
  connect_bd_net -net fir_00_m_axis_data_tdata [get_bd_pins fir_00/m_axis_data_tdata] [get_bd_ports dout_00]
  connect_bd_net -net fir_01_m_axis_data_tdata [get_bd_pins fir_01/m_axis_data_tdata] [get_bd_ports dout_01]
  connect_bd_net -net fir_02_m_axis_data_tdata [get_bd_pins fir_02/m_axis_data_tdata] [get_bd_ports dout_02]
  connect_bd_net -net fir_03_m_axis_data_tdata [get_bd_pins fir_03/m_axis_data_tdata] [get_bd_ports dout_03]
  connect_bd_net -net fir_04_m_axis_data_tdata [get_bd_pins fir_04/m_axis_data_tdata] [get_bd_ports dout_04]
  connect_bd_net -net fir_05_m_axis_data_tdata [get_bd_pins fir_05/m_axis_data_tdata] [get_bd_ports dout_05]
  connect_bd_net -net fir_06_m_axis_data_tdata [get_bd_pins fir_06/m_axis_data_tdata] [get_bd_ports dout_06]
  connect_bd_net -net fir_07_m_axis_data_tdata [get_bd_pins fir_07/m_axis_data_tdata] [get_bd_ports dout_07]
  connect_bd_net -net fir_08_m_axis_data_tdata [get_bd_pins fir_08/m_axis_data_tdata] [get_bd_ports dout_08]
  connect_bd_net -net fir_09_m_axis_data_tdata [get_bd_pins fir_09/m_axis_data_tdata] [get_bd_ports dout_09]
  connect_bd_net -net fir_10_m_axis_data_tdata [get_bd_pins fir_10/m_axis_data_tdata] [get_bd_ports dout_10]
  connect_bd_net -net fir_11_m_axis_data_tdata [get_bd_pins fir_11/m_axis_data_tdata] [get_bd_ports dout_11]
  connect_bd_net -net fir_12_m_axis_data_tdata [get_bd_pins fir_12/m_axis_data_tdata] [get_bd_ports dout_12]
  connect_bd_net -net fir_13_m_axis_data_tdata [get_bd_pins fir_13/m_axis_data_tdata] [get_bd_ports dout_13]
  connect_bd_net -net fir_14_m_axis_data_tdata [get_bd_pins fir_14/m_axis_data_tdata] [get_bd_ports dout_14]
  connect_bd_net -net fir_15_m_axis_data_tdata [get_bd_pins fir_15/m_axis_data_tdata] [get_bd_ports dout_15]
  connect_bd_net -net fir_16_m_axis_data_tdata [get_bd_pins fir_16/m_axis_data_tdata] [get_bd_ports dout_16]
  connect_bd_net -net fir_17_m_axis_data_tdata [get_bd_pins fir_17/m_axis_data_tdata] [get_bd_ports dout_17]
  connect_bd_net -net fir_18_m_axis_data_tdata [get_bd_pins fir_18/m_axis_data_tdata] [get_bd_ports dout_18]
  connect_bd_net -net fir_19_m_axis_data_tdata [get_bd_pins fir_19/m_axis_data_tdata] [get_bd_ports dout_19]
  connect_bd_net -net fir_20_m_axis_data_tdata [get_bd_pins fir_20/m_axis_data_tdata] [get_bd_ports dout_20]
  connect_bd_net -net fir_21_m_axis_data_tdata [get_bd_pins fir_21/m_axis_data_tdata] [get_bd_ports dout_21]
  connect_bd_net -net fir_22_m_axis_data_tdata [get_bd_pins fir_22/m_axis_data_tdata] [get_bd_ports dout_22]
  connect_bd_net -net fir_23_m_axis_data_tdata [get_bd_pins fir_23/m_axis_data_tdata] [get_bd_ports dout_23]
  connect_bd_net -net fir_24_m_axis_data_tdata [get_bd_pins fir_24/m_axis_data_tdata] [get_bd_ports dout_24]
  connect_bd_net -net fir_25_m_axis_data_tdata [get_bd_pins fir_25/m_axis_data_tdata] [get_bd_ports dout_25]
  connect_bd_net -net fir_26_m_axis_data_tdata [get_bd_pins fir_26/m_axis_data_tdata] [get_bd_ports dout_26]
  connect_bd_net -net fir_27_m_axis_data_tdata [get_bd_pins fir_27/m_axis_data_tdata] [get_bd_ports dout_27]
  connect_bd_net -net fir_28_m_axis_data_tdata [get_bd_pins fir_28/m_axis_data_tdata] [get_bd_ports dout_28]
  connect_bd_net -net fir_29_m_axis_data_tdata [get_bd_pins fir_29/m_axis_data_tdata] [get_bd_ports dout_29]
  connect_bd_net -net fir_30_m_axis_data_tdata [get_bd_pins fir_30/m_axis_data_tdata] [get_bd_ports dout_30]
  connect_bd_net -net fir_31_m_axis_data_tdata [get_bd_pins fir_31/m_axis_data_tdata] [get_bd_ports dout_31]
  connect_bd_net -net s_axis_data_tdata_0_1 [get_bd_ports din_00] [get_bd_pins fir_00/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_2 [get_bd_ports din_01] [get_bd_pins fir_01/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_3 [get_bd_ports din_02] [get_bd_pins fir_02/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_4 [get_bd_ports din_03] [get_bd_pins fir_03/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_5 [get_bd_ports din_04] [get_bd_pins fir_04/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_6 [get_bd_ports din_05] [get_bd_pins fir_05/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_7 [get_bd_ports din_06] [get_bd_pins fir_06/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_8 [get_bd_ports din_07] [get_bd_pins fir_07/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_9 [get_bd_ports din_08] [get_bd_pins fir_08/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_10 [get_bd_ports din_09] [get_bd_pins fir_09/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_11 [get_bd_ports din_10] [get_bd_pins fir_10/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_12 [get_bd_ports din_11] [get_bd_pins fir_11/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_13 [get_bd_ports din_12] [get_bd_pins fir_12/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_14 [get_bd_ports din_13] [get_bd_pins fir_13/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_15 [get_bd_ports din_14] [get_bd_pins fir_14/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_16 [get_bd_ports din_15] [get_bd_pins fir_15/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_17 [get_bd_ports din_16] [get_bd_pins fir_16/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_18 [get_bd_ports din_17] [get_bd_pins fir_17/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_19 [get_bd_ports din_18] [get_bd_pins fir_18/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_20 [get_bd_ports din_19] [get_bd_pins fir_19/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_21 [get_bd_ports din_20] [get_bd_pins fir_20/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_22 [get_bd_ports din_21] [get_bd_pins fir_21/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_23 [get_bd_ports din_22] [get_bd_pins fir_22/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_24 [get_bd_ports din_23] [get_bd_pins fir_23/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_25 [get_bd_ports din_24] [get_bd_pins fir_24/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_26 [get_bd_ports din_25] [get_bd_pins fir_25/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_27 [get_bd_ports din_26] [get_bd_pins fir_26/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_28 [get_bd_ports din_27] [get_bd_pins fir_27/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_29 [get_bd_ports din_28] [get_bd_pins fir_28/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_30 [get_bd_ports din_29] [get_bd_pins fir_29/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_31 [get_bd_ports din_30] [get_bd_pins fir_30/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_0_32 [get_bd_ports din_31] [get_bd_pins fir_31/s_axis_data_tdata]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins fir_00/s_axis_data_tvalid] [get_bd_pins fir_01/s_axis_data_tvalid] [get_bd_pins fir_02/s_axis_data_tvalid] [get_bd_pins fir_03/s_axis_data_tvalid] [get_bd_pins fir_04/s_axis_data_tvalid] [get_bd_pins fir_05/s_axis_data_tvalid] [get_bd_pins fir_06/s_axis_data_tvalid] [get_bd_pins fir_07/s_axis_data_tvalid] [get_bd_pins fir_08/s_axis_data_tvalid] [get_bd_pins fir_09/s_axis_data_tvalid] [get_bd_pins fir_10/s_axis_data_tvalid] [get_bd_pins fir_11/s_axis_data_tvalid] [get_bd_pins fir_12/s_axis_data_tvalid] [get_bd_pins fir_13/s_axis_data_tvalid] [get_bd_pins fir_14/s_axis_data_tvalid] [get_bd_pins fir_15/s_axis_data_tvalid] [get_bd_pins fir_16/s_axis_data_tvalid] [get_bd_pins fir_17/s_axis_data_tvalid] [get_bd_pins fir_18/s_axis_data_tvalid] [get_bd_pins fir_19/s_axis_data_tvalid] [get_bd_pins fir_20/s_axis_data_tvalid] [get_bd_pins fir_21/s_axis_data_tvalid] [get_bd_pins fir_22/s_axis_data_tvalid] [get_bd_pins fir_23/s_axis_data_tvalid] [get_bd_pins fir_24/s_axis_data_tvalid] [get_bd_pins fir_25/s_axis_data_tvalid] [get_bd_pins fir_26/s_axis_data_tvalid] [get_bd_pins fir_27/s_axis_data_tvalid] [get_bd_pins fir_28/s_axis_data_tvalid] [get_bd_pins fir_29/s_axis_data_tvalid] [get_bd_pins fir_30/s_axis_data_tvalid] [get_bd_pins fir_31/s_axis_data_tvalid]

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


