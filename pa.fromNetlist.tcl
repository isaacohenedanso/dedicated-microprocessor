
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Dedicated_processor -dir "C:/Users/ahabn/Desktop/New folder/projects/Dedicated_processor/planAhead_run_5" -part xc3s500epq208-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/ahabn/Desktop/New folder/projects/Dedicated_processor/microprocessor.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/ahabn/Desktop/New folder/projects/Dedicated_processor} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "microprocessor.ucf" [current_fileset -constrset]
add_files [list {microprocessor.ucf}] -fileset [get_property constrset [current_run]]
link_design
