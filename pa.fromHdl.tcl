
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Dedicated_processor -dir "C:/Users/ahabn/Desktop/New folder/projects/Dedicated_processor/planAhead_run_2" -part xc3s500epq208-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "microprocessor.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {tristatebuffer.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {reg.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {mux2.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {compar.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {datapath.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {control_unit.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {microprocessor.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top microprocessor $srcset
add_files [list {microprocessor.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500epq208-4
