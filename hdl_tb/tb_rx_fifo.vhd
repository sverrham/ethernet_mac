
--hdlregression:tb

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;
use uvvm_util.data_fifo_pkg.all;

library ethernet_mac;
use ethernet_mac.ethernet_types.all;

entity tb_rx_fifo is
end entity;


architecture behavioral of tb_rx_fifo is
    
    signal clk : std_logic;
    constant clk_period : time := 12.5 ns;

    signal reset : std_logic := '0';
    signal mac_rx_frame : std_logic := '0';
    signal mac_rx_data : t_ethernet_data := (others => '0');
    signal mac_rx_byte_received : std_logic := '0';
    signal mac_rx_error : std_logic := '0';

    signal empty_o : std_logic := '0';
    signal rd_en : std_logic := '0';
    signal data : t_ethernet_data;

begin

    clock_generator(clk, clk_period);

    i_dut : entity ethernet_mac.rx_fifo 
    port map (
        clock_i => clk,
        mac_rx_reset_i => reset,
        mac_rx_clock_i => clk,
        mac_rx_frame_i => mac_rx_frame,
        mac_rx_data_i => mac_rx_data,
        mac_rx_byte_received_i => mac_rx_byte_received,
        mac_rx_error_i => mac_rx_error,
        empty_o => empty_o,
        rd_en_i => rd_en,
        data_o => data
    );

    p_main : process
    begin
        log("Starting simulation");
        gen_pulse(reset, '1', clk, 10, "reset");
        wait for 1 us;

        for pkt in 0 to 4 loop

            wait until rising_edge(clk);
            mac_rx_frame <= '1';
            mac_rx_byte_received <= '1';
            for i in 0 to 31 loop
                mac_rx_data  <= std_logic_vector(to_unsigned(i, 8));
                wait until rising_edge(clk);
            end loop;
            mac_rx_frame <= '0';
            mac_rx_byte_received <= '0';
            
            await_value(empty_o, '0', 0 ns, 1 us, "empty o");
            rd_en <= '1';
            -- Check packet length
            wait until rising_edge(clk);
            check_value(std_logic_vector(data), x"00", WARNING, "check data");
            wait until rising_edge(clk);
            check_value(std_logic_vector(data), x"1C", WARNING, "check data");

            for i in 0 to 31-4 loop -- Exclude crc
                wait until rising_edge(clk);
                check_value(std_logic_vector(data), std_logic_vector(to_unsigned(i, 8)), WARNING, "check data");
            end loop;

            rd_en <= '0';
            wait for 1 us;

        end loop;

        report_alert_counters(FINAL);

        -- Add print for tb pass
        if shared_uvvm_status.found_unexpected_simulation_errors_or_worse = 0 then
            report("pass");
        end if;
        std.env.stop;
        wait;
    end process;

end architecture;