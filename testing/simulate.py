import sys

# Import the HDLRegression module to the Python script:
from hdlregression import HDLRegression


# Define a HDLRegression item to access the HDLRegression functionality:
hr = HDLRegression(output_path="hdlreg")

hr.compile_uvvm("C:/Projects/vhdl/UVVM")

hr.add_files("../hdl/xilinx/lib/unisims/primitive/*.vhd", library_name="unisim")
hr.add_files("../hdl/xilinx/lib/unisims/*.vhd", library_name="unisim")
hr.add_files("../hdl/xilinx/lib/XilinxCoreLib/fifo_generator_v9_3.vhd", library_name="xilinxcorelib")

hr.set_library(library_name="ethernet_mac")
hr.add_files("../hdl/*.vhd")
hr.add_files("../hdl/xilinx/*.vhd")
hr.add_files("../hdl/xilinx/ipcore_dir/ethernet_mac_tx_fifo_xilinx.vhd")

hr.add_files("../hdl_tb/*.vhd")
hr.add_files("../hdl_tb/test/*.vhd")

# => hr.add_files(<filename>)                   # Use default library my_work_lib
# => hr.add_files(<filename>, <library_name>)   # or specify a library name.

hr.set_result_check_string("pass")
hr.start()
