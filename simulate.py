import sys

# Import the HDLRegression module to the Python script:
from hdlregression import HDLRegression

# Define a HDLRegression item to access the HDLRegression functionality:
hr = HDLRegression()

hr.add_files("xilinx/lib/unisims/primitive/BUFG.vhd", library_name="unisim")
hr.add_files("xilinx/lib/unisims/primitive/BUFIO2.vhd", library_name="unisim")
hr.add_files("xilinx/lib/unisims/primitive/IBUFG.vhd", library_name="unisim")
hr.add_files("xilinx/lib/unisims/primitive/ODDR2.vhd", library_name="unisim")
hr.add_files("xilinx/lib/unisims/primitive/FDPE.vhd", library_name="unisim")
hr.add_files("xilinx/lib/unisims/primitive/FDRE.vhd", library_name="unisim")
hr.add_files("xilinx/lib/unisims/primitive/BUFGMUX.vhd", library_name="unisim")
hr.add_files("xilinx/lib/unisims/primitive/IODELAY2.vhd", library_name="unisim")
hr.add_files("xilinx/lib/unisims/unisim_VCOMP_short.vhd", library_name="unisim")
hr.add_files("xilinx/lib/unisims/unisim_VPKG.vhd", library_name="unisim")
hr.add_files("xilinx/lib/XilinxCoreLib/fifo_generator_v9_3.vhd", library_name="xilinxcorelib")

hr.set_library(library_name="ethernet_mac")
hr.add_files("crc.vhd")
hr.add_files("crc32.vhd")
hr.add_files("utility.vhd")
hr.add_files("crc32_tb.vhd")

hr.add_files("ethernet_types.vhd")
hr.add_files("test/test_common.vhd")
hr.add_files("test/test_instance.vhd")

hr.add_files("miim_types.vhd")
hr.add_files("miim.vhd")
hr.add_files("mii_gmii.vhd")
hr.add_files("mii_gmii_io.vhd")
hr.add_files("miim_control.vhd")
hr.add_files("miim_registers.vhd")

hr.add_files("single_signal_synchronizer.vhd")
hr.add_files("reset_generator.vhd")

hr.add_files("framing_common.vhd")
hr.add_files("framing.vhd")

hr.add_files("rx_fifo.vhd")
hr.add_files("tx_fifo_adapter.vhd")

hr.add_files("ethernet.vhd")
hr.add_files("ethernet_with_fifos.vhd")


hr.add_files("xilinx/tx_fifo.vhd")
hr.add_files("xilinx/ipcore_dir/ethernet_mac_tx_fifo_xilinx.vhd")
hr.add_files("xilinx/single_signal_synchronizer_spartan6.vhd")
hr.add_files("xilinx/mii_gmii_io_spartan6.vhd")
hr.add_files("xilinx/output_buffer.vhd")
hr.add_files("xilinx/input_buffer.vhd")
hr.add_files("xilinx/fixed_input_delay.vhd")

hr.add_files("ethernet_mac_tb.vhd")

# => hr.add_files(<filename>)                   # Use default library my_work_lib
# => hr.add_files(<filename>, <library_name>)   # or specify a library name.

hr.set_result_check_string("pass")
hr.start()
