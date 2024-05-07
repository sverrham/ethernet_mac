library IEEE;
use IEEE.STD_LOGIC_1164.all;
package VCOMPONENTS is



signal GSR : std_logic := '0';

----- component FDPE -----
component FDPE
  generic (
     INIT : bit := '1'
  );
  port (
     Q : out std_ulogic;
     C : in std_ulogic;
     CE : in std_ulogic;
     D : in std_ulogic;
     PRE : in std_ulogic
  );
end component;

----- component FDRE -----
component FDRE
  generic (
     INIT : bit := '0'
  );
  port (
     Q : out std_ulogic;
     C : in std_ulogic;
     CE : in std_ulogic;
     D : in std_ulogic;
     R : in std_ulogic
  );
end component;

------ component BUFG -----
component BUFG
  port (
     O : out std_ulogic;
     I : in std_ulogic
  );
end component;

---- component BUFIO2 -----
component BUFIO2
  generic (
     DIVIDE : integer := 1;
     DIVIDE_BYPASS : boolean := TRUE;
     I_INVERT : boolean := FALSE;
     USE_DOUBLER : boolean := FALSE
  );
  port (
     DIVCLK : out std_ulogic;
     IOCLK : out std_ulogic;
     SERDESSTROBE : out std_ulogic;
     I : in std_ulogic
  );
end component;

----- component IBUFG -----
component IBUFG
  generic (
     CAPACITANCE : string := "DONT_CARE";
     IBUF_DELAY_VALUE : string := "0";
     IBUF_LOW_PWR : boolean := TRUE;
     IOSTANDARD : string := "DEFAULT"
  );
  port (
     O : out std_ulogic;
     I : in std_ulogic
  );
end component;

----- component ODDR2 -----
component ODDR2
  generic (
     DDR_ALIGNMENT : string := "NONE";
     INIT : bit := '0';
     SRTYPE : string := "SYNC"
  );
  port (
     Q : out std_ulogic;
     C0 : in std_ulogic;
     C1 : in std_ulogic;
     CE : in std_ulogic := 'H';
     D0 : in std_ulogic;
     D1 : in std_ulogic;
     R : in std_ulogic := 'L';
     S : in std_ulogic := 'L'
  );
end component;

----- component IODELAY2 -----
component IODELAY2
  generic (
     COUNTER_WRAPAROUND : string := "WRAPAROUND";
     DATA_RATE : string := "SDR";
     DELAY_SRC : string := "IO";
     IDELAY2_VALUE : integer := 0;
     IDELAY_MODE : string := "NORMAL";
     IDELAY_TYPE : string := "DEFAULT";
     IDELAY_VALUE : integer := 0;
     ODELAY_VALUE : integer := 0;
     SERDES_MODE : string := "NONE";
     SIM_TAPDELAY_VALUE : integer := 75
  );
  port (
     BUSY : out std_ulogic;
     DATAOUT : out std_ulogic;
     DATAOUT2 : out std_ulogic;
     DOUT : out std_ulogic;
     TOUT : out std_ulogic;
     CAL : in std_ulogic;
     CE : in std_ulogic;
     CLK : in std_ulogic;
     IDATAIN : in std_ulogic;
     INC : in std_ulogic;
     IOCLK0 : in std_ulogic;
     IOCLK1 : in std_ulogic;
     ODATAIN : in std_ulogic;
     RST : in std_ulogic;
     T : in std_ulogic
  );
end component;

----- component BUFGMUX -----
component BUFGMUX
  generic (
     CLK_SEL_TYPE : string := "SYNC"
  );
  port (
     O : out std_ulogic := '0';
     I0 : in std_ulogic := '0';
     I1 : in std_ulogic := '0';
     S : in std_ulogic := '0'
  );
end component;


end VCOMPONENTS;