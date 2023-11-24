yurl.com/apca ou apcda

8 maio
16:41
diferença print return

17:38
// %

22 junho
09:48
inyurl.com/lisasapc

4 outubro
17:17
https://www.inf.pucrs.br/~danielc/cursos/pqts/java/Java1.pdf

11 outubro
17:00
oo no segundo trabalho tem que ter um exemplo de herança. Não esquecer

17:01
interface ou classe abstrata também

16 novembro
12:57
https://www.techtudo.com.br/noticias/2022/08/entenda-a-diferenca-entre-5g-sa-5g-nsa-e-5g-dss.ghtml

12:57
https://www.youtube.com/watch?v=DCSyXCknzyU

12:57
https://www.canva.com/design/DAF0K2FyAdY/lB4cQFSj2l3a3GIky20aLA/edit

12:57
https://simple.nama.ai/post/5g-e-inteligencia-artificial-o-que-esperar-dessa-relacao

21 novembro
11:44
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Main is
Port ( CLK : in STD_LOGIC;
R : in STD_LOGIC;
D_in : in STD_LOGIC_VECTOR(3 downto 0);
Q_out : out STD_LOGIC_VECTOR(3 downto 0)
);
end Main;

architecture Behavioral of Main is
component ff_D
Port ( CLK : in STD_LOGIC;
R : in STD_LOGIC;
D : in STD_LOGIC;
Q : out STD_LOGIC
);
end component;

signal Q0, Q1, Q2, Q3 : STD_LOGIC;
-- signal clk_dividido: STD_LOGIC:='0';
-- signal counter: integer range 1 to 100_000000:= 1;

begin
-- --Divisor de clock
-- divisor_clk: process(CLK)
-- begin
-- if rising_edge(clk) then
-- if counter = 100_000000 then
-- counter <= 1;
-- clk_dividido <= not clk_dividido;
-- else
-- counter <= counter + 1;
-- end if;
-- end if;
-- end process;

-- Instâncias do componente D_FlipFlop
FF0: ff_D port map(CLK => CLK, R => R, D => D_in(0), Q => Q0);
FF1: ff_D port map(CLK => CLK, R => R, D => D_in(1), Q => Q1);
FF2: ff_D port map(CLK => CLK, R => R, D => D_in(2), Q => Q2);
FF3: ff_D port map(CLK => CLK, R => R, D => D_in(3), Q => Q3);


-- Saídas dos flip-flops
Q_out(0) <= Q0;
Q_out(1) <= Q1;
Q_out(2) <= Q2;
Q_out(3) <= Q3;


end Behavioral;

11:45
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ff_D is
Port ( CLK : in STD_LOGIC;
R : in STD_LOGIC;
D : in STD_LOGIC;
Q : out STD_LOGIC);
end ff_D;

architecture Behavioral of ff_D is
signal qt: STD_LOGIC;
signal clk_dividido: STD_LOGIC:='0';
signal counter: integer range 1 to 100_000000:= 1;
begin

--Divisor de clock
divisor_clk: process(CLK)
begin
if rising_edge(clk) then
if counter = 100_000000 then
counter <= 1;
clk_dividido <= not clk_dividido;
else
counter <= counter + 1;
end if;
end if;
end process;

Q <= qt;

ffD: process(clk_dividido,R)

begin
if R='0' then
qt <= '0';
elsif rising_edge(clk_dividido) then
qt <=D;
end if;
end process;

11:46
end Behavioral;

12:30
VHDL 4

12:31
main
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Main is
Port ( CLK : in STD_LOGIC;
R : in STD_LOGIC;
D_in : in STD_LOGIC_VECTOR(3 downto 0);
Q_out : out STD_LOGIC_VECTOR(3 downto 0)
);
end Main;

architecture Behavioral of Main is
component ff_D
Port ( CLK : in STD_LOGIC;
R : in STD_LOGIC;
D : in STD_LOGIC;
Q : out STD_LOGIC
);
end component;

signal Q0, Q1, Q2, Q3 : STD_LOGIC;
-- signal clk_dividido: STD_LOGIC:='0';
-- signal counter: integer range 1 to 100_000000:= 1;

begin

-- Instâncias do componente D_FlipFlop
FF0: ff_D port map(CLK => CLK, R => R, D => D_in(0), Q => Q0);
FF1: ff_D port map(CLK => CLK, R => R, D => D_in(1), Q => Q1);
FF2: ff_D port map(CLK => CLK, R => R, D => D_in(2), Q => Q2);
FF3: ff_D port map(CLK => CLK, R => R, D => D_in(3), Q => Q3);


-- Saídas dos flip-flops
Q_out(0) <= Q0;
Q_out(1) <= Q1;
Q_out(2) <= Q2;
Q_out(3) <= Q3;

12:31
ff_D
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ff_D is
Port ( CLK : in STD_LOGIC;
R : in STD_LOGIC;
D : in STD_LOGIC;
Q : out STD_LOGIC);
end ff_D;

architecture Behavioral of ff_D is
signal qt: STD_LOGIC;
signal clk_dividido: STD_LOGIC:='0';
signal counter: integer range 1 to 100_000000:= 1;
begin

--Divisor de clock
divisor_clk: process(CLK)
begin
if rising_edge(clk) then
if counter = 100_000000 then
counter <= 1;
clk_dividido <= not clk_dividido;
else
counter <= counter + 1;
end if;
end if;
end process;

Q <= qt;

ffD: process(clk_dividido,R)

begin
if R='0' then
qt <= '0';
elsif rising_edge(clk_dividido) then
qt <=D;
end if;
end process;

end Behavioral;

12:32
Basys

12:32
## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ff_assinc_preset_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets latch_E_IBUF]

## Switches
set_property PACKAGE_PIN V17 [get_ports {D_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_in[0]}]
set_property PACKAGE_PIN V16 [get_ports {D_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_in[1]}]
set_property PACKAGE_PIN W16 [get_ports {D_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_in[2]}]
set_property PACKAGE_PIN W17 [get_ports {D_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {D_in[3]}]
set_property PACKAGE_PIN W15 [get_ports {R}]
set_property IOSTANDARD LVCMOS33 [get_ports {R}]
#set_property PACKAGE_PIN V15 [get_ports {ff_sinc_preset}]
# set_property IOSTANDARD LVCMOS33 [get_ports {ff_sinc_preset}]
#set_property PACKAGE_PIN W14 [get_ports {ff_sinc_clr}]
# set_property IOSTANDARD LVCMOS33 [get_ports {ff_sinc_clr}]
#set_property PACKAGE_PIN W13 [get_ports {ff_assinc_D}]
# set_property IOSTANDARD LVCMOS33 [get_ports {ff_assinc_D}]
#set_property PACKAGE_PIN V2 [get_ports {ff_assinc_preset}]
# set_property IOSTANDARD LVCMOS33 [get_ports {ff_assinc_preset}]
#set_property PACKAGE_PIN T3 [get_ports {ff_assinc_clr}]
# set_property IOSTANDARD LVCMOS33 [get_ports {ff_assinc_clr}]
#set_property PACKAGE_PIN T2 [get_ports {sw[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property PACKAGE_PIN R3 [get_ports {sw[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property PACKAGE_PIN W2 [get_ports {sw[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PACKAGE_PIN U1 [get_ports {sw[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
#set_property PACKAGE_PIN T1 [get_ports {sw[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#set_property PACKAGE_PIN R2 [get_ports {sw[15]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]


## LEDs
set_property PACKAGE_PIN U16 [get_ports {Q_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q_out[0]}]
set_property PACKAGE_PIN E19 [get_ports {Q_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q_out[1]}]
set_property PACKAGE_PIN U19 [get_ports {Q_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q_out[2]}]
set_property PACKAGE_PIN V19 [get_ports {Q_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q_out[3]}]
#set_property PACKAGE_PIN W18 [get_ports {ff_sinc_Q}]
# set_property IOSTANDARD LVCMOS33 [get_ports {ff_sinc_Q}]
#set_property PACKAGE_PIN U15 [get_ports {ff_sinc_Qnot}]
# set_property IOSTANDARD LVCMOS33 [get_ports {ff_sinc_Qnot}]
#set_property PACKAGE_PIN U14 [get_ports {led[6]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
#set_property PACKAGE_PIN V14 [get_ports {ff_assinc_Q}]
# set_property IOSTANDARD LVCMOS33 [get_ports {ff_assinc_Q}]
#set_property PACKAGE_PIN V13 [get_ports {ff_assinc_Qnot}]
# set_property IOSTANDARD LVCMOS33 [get_ports {ff_assinc_Qnot}]
#set_property PACKAGE_PIN V3 [get_ports {led[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
#set_property PACKAGE_PIN W3 [get_ports {led[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
#set_property PACKAGE_PIN U3 [get_ports {led[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
#set_property PACKAGE_PIN P3 [get_ports {led[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
#set_property PACKAGE_PIN N3 [get_ports {led[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
#set_property