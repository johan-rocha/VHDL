--packages/libs
library ieee;
use ieee.std_logic_1164.all;

--entity
entity nome_entity is
    port(
        a, b    : in std_logic;
        z       : out std_logic;
    );
end nome_entity;

--architecture

architecture main of nome_entity is
    begin

        z <= a and b;

    end architecture main;
