
################################################################
# This is a generated script based on design: design_yodann
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
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_yodann_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# ARM_CPU, CONV, Data_Memory, IC, SCM1, SCM1, SCM1, SCM1, SCM1, SCM1, SCM1, SCM1, SCM2, SCM2, SCM2, SCM2, SCM2, SCM2, SCM2, SCM2, SCM3, SCM3, SCM3, SCM3, SCM3, SCM3, SCM3, SCM3, SCM4, SCM4, SCM4, SCM4, SCM4, SCM4, SCM4, SCM4, SCM5, SCM5, SCM5, SCM5, SCM5, SCM5, SCM5, SCM5, SCM6, SCM6, SCM6, SCM6, SCM6, SCM6, SCM6, SCM6, adder, adder, adder, adder, adder, adder, address_splitter, check, data_splitter, pixtodata, pre_decoder, rmemsplitter, wmemsplitter

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_yodann

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
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

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

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
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
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set CLOCK_0 [ create_bd_port -dir I -type clk CLOCK_0 ]
  set RESET_0 [ create_bd_port -dir I -type rst RESET_0 ]

  # Create instance: ARM_CPU_0, and set properties
  set block_name ARM_CPU
  set block_cell_name ARM_CPU_0
  if { [catch {set ARM_CPU_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ARM_CPU_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: CONV_0, and set properties
  set block_name CONV
  set block_cell_name CONV_0
  if { [catch {set CONV_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $CONV_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Data_Memory_0, and set properties
  set block_name Data_Memory
  set block_cell_name Data_Memory_0
  if { [catch {set Data_Memory_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Data_Memory_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: IC_0, and set properties
  set block_name IC
  set block_cell_name IC_0
  if { [catch {set IC_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $IC_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM1_0, and set properties
  set block_name SCM1
  set block_cell_name SCM1_0
  if { [catch {set SCM1_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM1_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM1_1, and set properties
  set block_name SCM1
  set block_cell_name SCM1_1
  if { [catch {set SCM1_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM1_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM1_2, and set properties
  set block_name SCM1
  set block_cell_name SCM1_2
  if { [catch {set SCM1_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM1_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM1_3, and set properties
  set block_name SCM1
  set block_cell_name SCM1_3
  if { [catch {set SCM1_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM1_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM1_4, and set properties
  set block_name SCM1
  set block_cell_name SCM1_4
  if { [catch {set SCM1_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM1_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM1_5, and set properties
  set block_name SCM1
  set block_cell_name SCM1_5
  if { [catch {set SCM1_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM1_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM1_6, and set properties
  set block_name SCM1
  set block_cell_name SCM1_6
  if { [catch {set SCM1_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM1_6 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM1_7, and set properties
  set block_name SCM1
  set block_cell_name SCM1_7
  if { [catch {set SCM1_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM1_7 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM2_0, and set properties
  set block_name SCM2
  set block_cell_name SCM2_0
  if { [catch {set SCM2_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM2_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM2_1, and set properties
  set block_name SCM2
  set block_cell_name SCM2_1
  if { [catch {set SCM2_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM2_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM2_2, and set properties
  set block_name SCM2
  set block_cell_name SCM2_2
  if { [catch {set SCM2_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM2_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM2_3, and set properties
  set block_name SCM2
  set block_cell_name SCM2_3
  if { [catch {set SCM2_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM2_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM2_4, and set properties
  set block_name SCM2
  set block_cell_name SCM2_4
  if { [catch {set SCM2_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM2_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM2_5, and set properties
  set block_name SCM2
  set block_cell_name SCM2_5
  if { [catch {set SCM2_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM2_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM2_6, and set properties
  set block_name SCM2
  set block_cell_name SCM2_6
  if { [catch {set SCM2_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM2_6 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM2_7, and set properties
  set block_name SCM2
  set block_cell_name SCM2_7
  if { [catch {set SCM2_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM2_7 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM3_0, and set properties
  set block_name SCM3
  set block_cell_name SCM3_0
  if { [catch {set SCM3_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM3_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM3_1, and set properties
  set block_name SCM3
  set block_cell_name SCM3_1
  if { [catch {set SCM3_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM3_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM3_2, and set properties
  set block_name SCM3
  set block_cell_name SCM3_2
  if { [catch {set SCM3_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM3_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM3_3, and set properties
  set block_name SCM3
  set block_cell_name SCM3_3
  if { [catch {set SCM3_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM3_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM3_4, and set properties
  set block_name SCM3
  set block_cell_name SCM3_4
  if { [catch {set SCM3_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM3_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM3_5, and set properties
  set block_name SCM3
  set block_cell_name SCM3_5
  if { [catch {set SCM3_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM3_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM3_6, and set properties
  set block_name SCM3
  set block_cell_name SCM3_6
  if { [catch {set SCM3_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM3_6 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM3_7, and set properties
  set block_name SCM3
  set block_cell_name SCM3_7
  if { [catch {set SCM3_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM3_7 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM4_0, and set properties
  set block_name SCM4
  set block_cell_name SCM4_0
  if { [catch {set SCM4_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM4_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM4_1, and set properties
  set block_name SCM4
  set block_cell_name SCM4_1
  if { [catch {set SCM4_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM4_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM4_2, and set properties
  set block_name SCM4
  set block_cell_name SCM4_2
  if { [catch {set SCM4_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM4_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM4_3, and set properties
  set block_name SCM4
  set block_cell_name SCM4_3
  if { [catch {set SCM4_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM4_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM4_4, and set properties
  set block_name SCM4
  set block_cell_name SCM4_4
  if { [catch {set SCM4_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM4_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM4_5, and set properties
  set block_name SCM4
  set block_cell_name SCM4_5
  if { [catch {set SCM4_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM4_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM4_6, and set properties
  set block_name SCM4
  set block_cell_name SCM4_6
  if { [catch {set SCM4_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM4_6 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM4_7, and set properties
  set block_name SCM4
  set block_cell_name SCM4_7
  if { [catch {set SCM4_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM4_7 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM5_0, and set properties
  set block_name SCM5
  set block_cell_name SCM5_0
  if { [catch {set SCM5_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM5_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM5_1, and set properties
  set block_name SCM5
  set block_cell_name SCM5_1
  if { [catch {set SCM5_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM5_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM5_2, and set properties
  set block_name SCM5
  set block_cell_name SCM5_2
  if { [catch {set SCM5_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM5_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM5_3, and set properties
  set block_name SCM5
  set block_cell_name SCM5_3
  if { [catch {set SCM5_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM5_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM5_4, and set properties
  set block_name SCM5
  set block_cell_name SCM5_4
  if { [catch {set SCM5_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM5_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM5_5, and set properties
  set block_name SCM5
  set block_cell_name SCM5_5
  if { [catch {set SCM5_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM5_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM5_6, and set properties
  set block_name SCM5
  set block_cell_name SCM5_6
  if { [catch {set SCM5_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM5_6 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM5_7, and set properties
  set block_name SCM5
  set block_cell_name SCM5_7
  if { [catch {set SCM5_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM5_7 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM6_0, and set properties
  set block_name SCM6
  set block_cell_name SCM6_0
  if { [catch {set SCM6_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM6_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM6_1, and set properties
  set block_name SCM6
  set block_cell_name SCM6_1
  if { [catch {set SCM6_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM6_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM6_2, and set properties
  set block_name SCM6
  set block_cell_name SCM6_2
  if { [catch {set SCM6_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM6_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM6_3, and set properties
  set block_name SCM6
  set block_cell_name SCM6_3
  if { [catch {set SCM6_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM6_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM6_4, and set properties
  set block_name SCM6
  set block_cell_name SCM6_4
  if { [catch {set SCM6_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM6_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM6_5, and set properties
  set block_name SCM6
  set block_cell_name SCM6_5
  if { [catch {set SCM6_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM6_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM6_6, and set properties
  set block_name SCM6
  set block_cell_name SCM6_6
  if { [catch {set SCM6_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM6_6 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SCM6_7, and set properties
  set block_name SCM6
  set block_cell_name SCM6_7
  if { [catch {set SCM6_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SCM6_7 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: adder_0, and set properties
  set block_name adder
  set block_cell_name adder_0
  if { [catch {set adder_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $adder_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: adder_1, and set properties
  set block_name adder
  set block_cell_name adder_1
  if { [catch {set adder_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $adder_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: adder_2, and set properties
  set block_name adder
  set block_cell_name adder_2
  if { [catch {set adder_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $adder_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: adder_3, and set properties
  set block_name adder
  set block_cell_name adder_3
  if { [catch {set adder_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $adder_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: adder_4, and set properties
  set block_name adder
  set block_cell_name adder_4
  if { [catch {set adder_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $adder_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: adder_5, and set properties
  set block_name adder
  set block_cell_name adder_5
  if { [catch {set adder_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $adder_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: address_splitter_0, and set properties
  set block_name address_splitter
  set block_cell_name address_splitter_0
  if { [catch {set address_splitter_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $address_splitter_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: check_0, and set properties
  set block_name check
  set block_cell_name check_0
  if { [catch {set check_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $check_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: data_splitter_0, and set properties
  set block_name data_splitter
  set block_cell_name data_splitter_0
  if { [catch {set data_splitter_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $data_splitter_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: pixtodata_0, and set properties
  set block_name pixtodata
  set block_cell_name pixtodata_0
  if { [catch {set pixtodata_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pixtodata_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: pre_decoder_0, and set properties
  set block_name pre_decoder
  set block_cell_name pre_decoder_0
  if { [catch {set pre_decoder_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pre_decoder_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rmemsplitter_0, and set properties
  set block_name rmemsplitter
  set block_cell_name rmemsplitter_0
  if { [catch {set rmemsplitter_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $rmemsplitter_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: wmemsplitter_0, and set properties
  set block_name wmemsplitter
  set block_cell_name wmemsplitter_0
  if { [catch {set wmemsplitter_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $wmemsplitter_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net ARM_CPU_0_PC [get_bd_pins ARM_CPU_0/PC] [get_bd_pins IC_0/PC_in]
  connect_bd_net -net ARM_CPU_0_control_memread_out [get_bd_pins ARM_CPU_0/control_memread_out] [get_bd_pins Data_Memory_0/CONTROL_MemRead] [get_bd_pins rmemsplitter_0/ren]
  connect_bd_net -net ARM_CPU_0_control_memwrite_out [get_bd_pins ARM_CPU_0/control_memwrite_out] [get_bd_pins Data_Memory_0/CONTROL_MemWrite] [get_bd_pins wmemsplitter_0/wen]
  connect_bd_net -net ARM_CPU_0_mem_address_out [get_bd_pins ARM_CPU_0/mem_address_out] [get_bd_pins Data_Memory_0/inputAddress] [get_bd_pins address_splitter_0/a_in] [get_bd_pins rmemsplitter_0/addr] [get_bd_pins wmemsplitter_0/addr]
  connect_bd_net -net ARM_CPU_0_mem_data_out [get_bd_pins ARM_CPU_0/mem_data_out] [get_bd_pins check_0/data] [get_bd_pins data_splitter_0/d_in]
  connect_bd_net -net CLOCK_0_1 [get_bd_ports CLOCK_0] [get_bd_pins ARM_CPU_0/CLOCK]
  connect_bd_net -net CONV_0_outpixel [get_bd_pins CONV_0/outpixel] [get_bd_pins pixtodata_0/inpixel]
  connect_bd_net -net Data_Memory_0_outputData [get_bd_pins ARM_CPU_0/mem_data_in] [get_bd_pins Data_Memory_0/outputData]
  connect_bd_net -net IC_0_instruction_out [get_bd_pins ARM_CPU_0/IC] [get_bd_pins IC_0/instruction_out]
  connect_bd_net -net RESET_0_1 [get_bd_ports RESET_0] [get_bd_pins ARM_CPU_0/RESET]
  connect_bd_net -net SCM1_0_outpixel [get_bd_pins SCM1_0/outpixel] [get_bd_pins adder_0/p0]
  connect_bd_net -net SCM1_1_outpixel [get_bd_pins SCM1_1/outpixel] [get_bd_pins adder_0/p1]
  connect_bd_net -net SCM1_2_outpixel [get_bd_pins SCM1_2/outpixel] [get_bd_pins adder_0/p2]
  connect_bd_net -net SCM1_3_outpixel [get_bd_pins SCM1_3/outpixel] [get_bd_pins adder_0/p3]
  connect_bd_net -net SCM1_4_outpixel [get_bd_pins SCM1_4/outpixel] [get_bd_pins adder_0/p4]
  connect_bd_net -net SCM1_5_outpixel [get_bd_pins SCM1_5/outpixel] [get_bd_pins adder_0/p5]
  connect_bd_net -net SCM1_6_outpixel [get_bd_pins SCM1_6/outpixel] [get_bd_pins adder_0/p6]
  connect_bd_net -net SCM1_7_outpixel [get_bd_pins SCM1_7/outpixel] [get_bd_pins adder_0/p7]
  connect_bd_net -net SCM2_0_outpixel [get_bd_pins SCM2_0/outpixel] [get_bd_pins adder_1/p0]
  connect_bd_net -net SCM2_1_outpixel [get_bd_pins SCM2_1/outpixel] [get_bd_pins adder_1/p1]
  connect_bd_net -net SCM2_2_outpixel [get_bd_pins SCM2_2/outpixel] [get_bd_pins adder_1/p2]
  connect_bd_net -net SCM2_3_outpixel [get_bd_pins SCM2_3/outpixel] [get_bd_pins adder_1/p3]
  connect_bd_net -net SCM2_4_outpixel [get_bd_pins SCM2_4/outpixel] [get_bd_pins adder_1/p4]
  connect_bd_net -net SCM2_5_outpixel [get_bd_pins SCM2_5/outpixel] [get_bd_pins adder_1/p5]
  connect_bd_net -net SCM2_6_outpixel [get_bd_pins SCM2_6/outpixel] [get_bd_pins adder_1/p6]
  connect_bd_net -net SCM2_7_outpixel [get_bd_pins SCM2_7/outpixel] [get_bd_pins adder_1/p7]
  connect_bd_net -net SCM3_0_outpixel [get_bd_pins SCM3_0/outpixel] [get_bd_pins adder_2/p0]
  connect_bd_net -net SCM3_1_outpixel [get_bd_pins SCM3_1/outpixel] [get_bd_pins adder_2/p1]
  connect_bd_net -net SCM3_2_outpixel [get_bd_pins SCM3_2/outpixel] [get_bd_pins adder_2/p2]
  connect_bd_net -net SCM3_3_outpixel [get_bd_pins SCM3_3/outpixel] [get_bd_pins adder_2/p3]
  connect_bd_net -net SCM3_4_outpixel [get_bd_pins SCM3_4/outpixel] [get_bd_pins adder_2/p4]
  connect_bd_net -net SCM3_5_outpixel [get_bd_pins SCM3_5/outpixel] [get_bd_pins adder_2/p5]
  connect_bd_net -net SCM3_6_outpixel [get_bd_pins SCM3_6/outpixel] [get_bd_pins adder_2/p6]
  connect_bd_net -net SCM3_7_outpixel [get_bd_pins SCM3_7/outpixel] [get_bd_pins adder_2/p7]
  connect_bd_net -net SCM4_0_outpixel [get_bd_pins SCM4_0/outpixel] [get_bd_pins adder_3/p0]
  connect_bd_net -net SCM4_1_outpixel [get_bd_pins SCM4_1/outpixel] [get_bd_pins adder_3/p1]
  connect_bd_net -net SCM4_2_outpixel [get_bd_pins SCM4_2/outpixel] [get_bd_pins adder_3/p2]
  connect_bd_net -net SCM4_3_outpixel [get_bd_pins SCM4_3/outpixel] [get_bd_pins adder_3/p3]
  connect_bd_net -net SCM4_4_outpixel [get_bd_pins SCM4_4/outpixel] [get_bd_pins adder_3/p4]
  connect_bd_net -net SCM4_5_outpixel [get_bd_pins SCM4_5/outpixel] [get_bd_pins adder_3/p5]
  connect_bd_net -net SCM4_6_outpixel [get_bd_pins SCM4_6/outpixel] [get_bd_pins adder_3/p6]
  connect_bd_net -net SCM4_7_outpixel [get_bd_pins SCM4_7/outpixel] [get_bd_pins adder_3/p7]
  connect_bd_net -net SCM5_0_outpixel [get_bd_pins SCM5_0/outpixel] [get_bd_pins adder_4/p0]
  connect_bd_net -net SCM5_1_outpixel [get_bd_pins SCM5_1/outpixel] [get_bd_pins adder_4/p1]
  connect_bd_net -net SCM5_2_outpixel [get_bd_pins SCM5_2/outpixel] [get_bd_pins adder_4/p2]
  connect_bd_net -net SCM5_3_outpixel [get_bd_pins SCM5_3/outpixel] [get_bd_pins adder_4/p3]
  connect_bd_net -net SCM5_4_outpixel [get_bd_pins SCM5_4/outpixel] [get_bd_pins adder_4/p4]
  connect_bd_net -net SCM5_5_outpixel [get_bd_pins SCM5_5/outpixel] [get_bd_pins adder_4/p5]
  connect_bd_net -net SCM5_6_outpixel [get_bd_pins SCM5_6/outpixel] [get_bd_pins adder_4/p6]
  connect_bd_net -net SCM5_7_outpixel [get_bd_pins SCM5_7/outpixel] [get_bd_pins adder_4/p7]
  connect_bd_net -net SCM6_0_outpixel [get_bd_pins SCM6_0/outpixel] [get_bd_pins adder_5/p0]
  connect_bd_net -net SCM6_1_outpixel [get_bd_pins SCM6_1/outpixel] [get_bd_pins adder_5/p1]
  connect_bd_net -net SCM6_2_outpixel [get_bd_pins SCM6_2/outpixel] [get_bd_pins adder_5/p2]
  connect_bd_net -net SCM6_3_outpixel [get_bd_pins SCM6_3/outpixel] [get_bd_pins adder_5/p3]
  connect_bd_net -net SCM6_4_outpixel [get_bd_pins SCM6_4/outpixel] [get_bd_pins adder_5/p4]
  connect_bd_net -net SCM6_5_outpixel [get_bd_pins SCM6_5/outpixel] [get_bd_pins adder_5/p5]
  connect_bd_net -net SCM6_6_outpixel [get_bd_pins SCM6_6/outpixel] [get_bd_pins adder_5/p6]
  connect_bd_net -net SCM6_7_outpixel [get_bd_pins SCM6_7/outpixel] [get_bd_pins adder_5/p7]
  connect_bd_net -net adder_0_outpixel [get_bd_pins CONV_0/p0] [get_bd_pins adder_0/outpixel]
  connect_bd_net -net adder_1_outpixel [get_bd_pins CONV_0/p1] [get_bd_pins adder_1/outpixel]
  connect_bd_net -net adder_2_outpixel [get_bd_pins CONV_0/p2] [get_bd_pins adder_2/outpixel]
  connect_bd_net -net adder_3_outpixel [get_bd_pins CONV_0/p3] [get_bd_pins adder_3/outpixel]
  connect_bd_net -net adder_4_outpixel [get_bd_pins CONV_0/p4] [get_bd_pins adder_4/outpixel]
  connect_bd_net -net adder_5_outpixel [get_bd_pins CONV_0/p5] [get_bd_pins adder_5/outpixel]
  connect_bd_net -net address_splitter_0_a_out [get_bd_pins address_splitter_0/a_out] [get_bd_pins pre_decoder_0/raddr] [get_bd_pins pre_decoder_0/waddr]
  connect_bd_net -net check_0_out [get_bd_pins Data_Memory_0/inputData] [get_bd_pins check_0/outdata]
  connect_bd_net -net data_splitter_0_d_out [get_bd_pins data_splitter_0/d_out] [get_bd_pins pre_decoder_0/inpixel]
  connect_bd_net -net pixtodata_0_data [get_bd_pins check_0/inpixel] [get_bd_pins pixtodata_0/data]
  connect_bd_net -net pre_decoder_0_outpixel [get_bd_pins SCM1_0/inpixel] [get_bd_pins SCM1_1/inpixel] [get_bd_pins SCM1_2/inpixel] [get_bd_pins SCM1_3/inpixel] [get_bd_pins SCM1_4/inpixel] [get_bd_pins SCM1_5/inpixel] [get_bd_pins SCM1_6/inpixel] [get_bd_pins SCM1_7/inpixel] [get_bd_pins SCM2_0/inpixel] [get_bd_pins SCM2_1/inpixel] [get_bd_pins SCM2_2/inpixel] [get_bd_pins SCM2_3/inpixel] [get_bd_pins SCM2_4/inpixel] [get_bd_pins SCM2_5/inpixel] [get_bd_pins SCM2_6/inpixel] [get_bd_pins SCM2_7/inpixel] [get_bd_pins SCM3_0/inpixel] [get_bd_pins SCM3_1/inpixel] [get_bd_pins SCM3_2/inpixel] [get_bd_pins SCM3_3/inpixel] [get_bd_pins SCM3_4/inpixel] [get_bd_pins SCM3_5/inpixel] [get_bd_pins SCM3_6/inpixel] [get_bd_pins SCM3_7/inpixel] [get_bd_pins SCM4_0/inpixel] [get_bd_pins SCM4_1/inpixel] [get_bd_pins SCM4_2/inpixel] [get_bd_pins SCM4_3/inpixel] [get_bd_pins SCM4_4/inpixel] [get_bd_pins SCM4_5/inpixel] [get_bd_pins SCM4_6/inpixel] [get_bd_pins SCM4_7/inpixel] [get_bd_pins SCM5_0/inpixel] [get_bd_pins SCM5_1/inpixel] [get_bd_pins SCM5_2/inpixel] [get_bd_pins SCM5_3/inpixel] [get_bd_pins SCM5_4/inpixel] [get_bd_pins SCM5_5/inpixel] [get_bd_pins SCM5_6/inpixel] [get_bd_pins SCM5_7/inpixel] [get_bd_pins SCM6_0/inpixel] [get_bd_pins SCM6_1/inpixel] [get_bd_pins SCM6_2/inpixel] [get_bd_pins SCM6_3/inpixel] [get_bd_pins SCM6_4/inpixel] [get_bd_pins SCM6_5/inpixel] [get_bd_pins SCM6_6/inpixel] [get_bd_pins SCM6_7/inpixel] [get_bd_pins pre_decoder_0/outpixel]
  connect_bd_net -net pre_decoder_0_wraddr [get_bd_pins SCM1_0/wraddr] [get_bd_pins SCM1_1/wraddr] [get_bd_pins SCM1_2/wraddr] [get_bd_pins SCM1_3/wraddr] [get_bd_pins SCM1_4/wraddr] [get_bd_pins SCM1_5/wraddr] [get_bd_pins SCM1_6/wraddr] [get_bd_pins SCM1_7/wraddr] [get_bd_pins SCM2_0/wraddr] [get_bd_pins SCM2_1/wraddr] [get_bd_pins SCM2_2/wraddr] [get_bd_pins SCM2_3/wraddr] [get_bd_pins SCM2_4/wraddr] [get_bd_pins SCM2_5/wraddr] [get_bd_pins SCM2_6/wraddr] [get_bd_pins SCM2_7/wraddr] [get_bd_pins SCM3_0/wraddr] [get_bd_pins SCM3_1/wraddr] [get_bd_pins SCM3_2/wraddr] [get_bd_pins SCM3_3/wraddr] [get_bd_pins SCM3_4/wraddr] [get_bd_pins SCM3_5/wraddr] [get_bd_pins SCM3_6/wraddr] [get_bd_pins SCM3_7/wraddr] [get_bd_pins SCM4_0/wraddr] [get_bd_pins SCM4_1/wraddr] [get_bd_pins SCM4_2/wraddr] [get_bd_pins SCM4_3/wraddr] [get_bd_pins SCM4_4/wraddr] [get_bd_pins SCM4_5/wraddr] [get_bd_pins SCM4_6/wraddr] [get_bd_pins SCM4_7/wraddr] [get_bd_pins SCM5_0/wraddr] [get_bd_pins SCM5_1/wraddr] [get_bd_pins SCM5_2/wraddr] [get_bd_pins SCM5_3/wraddr] [get_bd_pins SCM5_4/wraddr] [get_bd_pins SCM5_5/wraddr] [get_bd_pins SCM5_6/wraddr] [get_bd_pins SCM5_7/wraddr] [get_bd_pins SCM6_0/wraddr] [get_bd_pins SCM6_1/wraddr] [get_bd_pins SCM6_2/wraddr] [get_bd_pins SCM6_3/wraddr] [get_bd_pins SCM6_4/wraddr] [get_bd_pins SCM6_5/wraddr] [get_bd_pins SCM6_6/wraddr] [get_bd_pins SCM6_7/wraddr] [get_bd_pins pre_decoder_0/wraddr]
  connect_bd_net -net pre_decoder_0_wren0 [get_bd_pins SCM1_0/wren] [get_bd_pins SCM2_0/wren] [get_bd_pins SCM3_0/wren] [get_bd_pins SCM4_0/wren] [get_bd_pins SCM5_0/wren] [get_bd_pins SCM6_0/wren] [get_bd_pins pre_decoder_0/wren0]
  connect_bd_net -net pre_decoder_0_wren1 [get_bd_pins SCM1_1/wren] [get_bd_pins SCM2_1/wren] [get_bd_pins SCM3_1/wren] [get_bd_pins SCM4_1/wren] [get_bd_pins SCM5_1/wren] [get_bd_pins SCM6_1/wren] [get_bd_pins pre_decoder_0/wren1]
  connect_bd_net -net pre_decoder_0_wren2 [get_bd_pins SCM1_2/wren] [get_bd_pins SCM2_2/wren] [get_bd_pins SCM3_2/wren] [get_bd_pins SCM4_2/wren] [get_bd_pins SCM5_2/wren] [get_bd_pins SCM6_2/wren] [get_bd_pins pre_decoder_0/wren2]
  connect_bd_net -net pre_decoder_0_wren3 [get_bd_pins SCM1_3/wren] [get_bd_pins SCM2_3/wren] [get_bd_pins SCM3_3/wren] [get_bd_pins SCM4_3/wren] [get_bd_pins SCM5_3/wren] [get_bd_pins SCM6_3/wren] [get_bd_pins pre_decoder_0/wren3]
  connect_bd_net -net pre_decoder_0_wren4 [get_bd_pins SCM1_4/wren] [get_bd_pins SCM2_4/wren] [get_bd_pins SCM3_4/wren] [get_bd_pins SCM4_4/wren] [get_bd_pins SCM5_4/wren] [get_bd_pins SCM6_4/wren] [get_bd_pins pre_decoder_0/wren4]
  connect_bd_net -net pre_decoder_0_wren5 [get_bd_pins SCM1_5/wren] [get_bd_pins SCM2_5/wren] [get_bd_pins SCM3_5/wren] [get_bd_pins SCM4_5/wren] [get_bd_pins SCM5_5/wren] [get_bd_pins SCM6_5/wren] [get_bd_pins pre_decoder_0/wren5]
  connect_bd_net -net pre_decoder_0_wren6 [get_bd_pins SCM1_6/wren] [get_bd_pins SCM2_6/wren] [get_bd_pins SCM3_6/wren] [get_bd_pins SCM4_6/wren] [get_bd_pins SCM5_6/wren] [get_bd_pins SCM6_6/wren] [get_bd_pins pre_decoder_0/wren6]
  connect_bd_net -net pre_decoder_0_wren7 [get_bd_pins SCM1_7/wren] [get_bd_pins SCM2_7/wren] [get_bd_pins SCM3_7/wren] [get_bd_pins SCM4_7/wren] [get_bd_pins SCM5_7/wren] [get_bd_pins SCM6_7/wren] [get_bd_pins pre_decoder_0/wren7]
  connect_bd_net -net rmemsplitter_0_addrout [get_bd_pins pre_decoder_0/ren] [get_bd_pins rmemsplitter_0/addrout]
  connect_bd_net -net wmemsplitter_0_addrout [get_bd_pins pre_decoder_0/wen] [get_bd_pins wmemsplitter_0/addrout]

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


