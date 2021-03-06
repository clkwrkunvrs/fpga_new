# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {/home/fpga/FPGA/Vivado/octal decoder/octal decoder.cache/wt} [current_project]
set_property parent.project_path {/home/fpga/FPGA/Vivado/octal decoder/octal decoder.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
read_verilog -library xil_defaultlib /home/fpga/octal_decoder.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{/home/fpga/FPGA/Vivado/octal decoder/octal decoder.srcs/constrs_1/new/octal_constraints.xdc}}
set_property used_in_implementation false [get_files {{/home/fpga/FPGA/Vivado/octal decoder/octal decoder.srcs/constrs_1/new/octal_constraints.xdc}}]


synth_design -top octal_decoder_top -part xc7z020clg484-1


write_checkpoint -force -noxdef octal_decoder_top.dcp

catch { report_utilization -file octal_decoder_top_utilization_synth.rpt -pb octal_decoder_top_utilization_synth.pb }
