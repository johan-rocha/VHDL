-- Somador de 4 bits

library ieee
use ieee.std_logic_1164.all

entity somar is
    port(
        a, b    : in  integer range 0 to 15;
        z       : out integer range 0 to 15
    );
end somar;

architecture projeto_somar of somar is
    begin
        z <= a + b;
    end projeto_somar;