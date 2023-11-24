-- https://www.youtube.com/watch?v=NagK18H8XsA&ab_channel=OC%C3%B3digodaEletr%C3%B4nica

-- https://www.youtube.com/watch?v=hMy3vJ8MPVQ&ab_channel=WRKits

Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is
    generic (n: integer := 3);
    port(
        a, b    : in unsigned(n - 1 downto 0); -- entradas
        cin     : in std_logic;
        op      : in std_logic_vector(1 downto 0); --operacao
        f       : out unsigned(n - 1 downto 0); --saida
        z, c_out: out std_logic; -- zero e carry out
    );
end entity ula;

architecture rtl of ula is
    signal a_tmp, b_tmp, f_tmp : unsigned(n downto 0);

begin

    a_tmp <= '0' & a; -- a com um bit a mais
    b_tmp <= '0' & b; -- b com um bit a mais
    f <= f_tmp(n - 1 downto 0); -- resultado
    c_out <= f_tmp(n); -- Carry out

    ula: process(a_tmp, b_tmp, cin, op) is
    begin
        case op is
            --operacoes aritmeticas
            when "00" => --ADD
                if cin = '1' then f_tmp <= a_tmp + b_tmp + 1;
                else              f_tmp <= a_tmp + b_tmp;
                end if;
            when "01" => --SUB
                if cin = '1' then f_tmp <= a_tmp - b_tmp;
                else              f_tmp <= a_tmp - b_tmp - 1;
                end if;
            --operacoes logicas
            when "10" => f_tmp <= a_tmp and b_tmp; --AND

            when "11" => f_tmp <= a_tmp or b_tmp; --OR

            when others => f_tmp <= (others => '0');
        end case;
    end process ula;

    zero: process(f_tmp) is
        variable zero   :   std_logic;
    begin
        for i in n - 1 downto 0 loop
            if f_tmp(i) = '1' then
                zero := '0';
                exit;
            else
                zero :='1';
            end if;
        end loop;
        z <= zero;
    end process zero;