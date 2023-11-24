-- https://www.youtube.com/watch?v=NagK18H8XsA&ab_channel=OC%C3%B3digodaEletr%C3%B4nica

-- https://www.youtube.com/watch?v=hMy3vJ8MPVQ&ab_channel=WRKits

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2023 15:32:33
-- Design Name: 
-- Module Name: ula - rtl
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ula is
    generic (n: integer := 4);
    port(
        a, b    : in unsigned(n - 1 downto 0); -- entradas
        cin     : in std_logic;
        s      : in std_logic_vector(1 downto 0); --operacao
        f       : out unsigned(n - 1 downto 0); --saida
        z, c_out: out std_logic -- zero e carry out
    );
end entity ula;

architecture rtl of ula is
    signal a_tmp, b_tmp, f_tmp : unsigned(n downto 0);
    signal F3, F2, F1, F0, overflow_signal: std_logic;
    signal A3, A2, A1, A0, B3, B2, B1, B0, s_OP : std_logic;

begin  
    a_tmp <= '0' & a; -- a com um bit a mais
    b_tmp <= '0' & b; -- b com um bit a mais
    f <= f_tmp(n - 1 downto 0); -- resultado
    c_out <= f_tmp(n); -- Carry out

    ula:process(cin) is
        variable sum_sign, diff_sign    : std_logic;
    begin
        case s is
            --operacoes aritmeticas
            when "00" => --ADD
                if cin = '1' then f_tmp <= a_tmp + b_tmp + 1;
                else              f_tmp <= a_tmp + b_tmp;
                end if;
                -- Verificar overflow na soma
                sum_sign := a_tmp(n) xor b_tmp(n) xor f_tmp(n);
                overflow_signal <= sum_sign and not cin; 
            when "01" => --SUB
                if cin = '1' then f_tmp <= a_tmp - b_tmp;
                else              f_tmp <= a_tmp - b_tmp - 1;
                end if;
                -- Verificar overflow na subtração
                diff_sign := a_tmp(n) xor b_tmp(n) xor f_tmp(n);
                overflow_signal <= diff_sign and not cin;
            --operacoes logicas
            when "10" => f_tmp <= a_tmp and b_tmp; --AND

            when "11" => f_tmp <= a_tmp or b_tmp; --OR

            when others => f_tmp <= (others => '0');
        end case;
        
        F3 <= f_tmp(3);
        F2 <= f_tmp(2);
        F1 <= f_tmp(1);
        F0 <= f_tmp(0);
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
