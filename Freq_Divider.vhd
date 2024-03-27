library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Freq_Divider is
    Port ( CLK100 : in STD_LOGIC;--initial clock of 100Mhz
           Divided : out STD_LOGIC;--this is the divided clock
           Reset : in STD_LOGIC);
end Freq_Divider;

architecture Divide of Freq_Divider is
begin
    process(CLK100)
    variable count:std_logic_vector(26 downto 0):=(others =>'0');
        begin
            if rising_edge(CLK100) then
                if Reset='1' then
                count:=count+1;
                else
                count:=(others =>'0');
                end if;
            end if;
          Divided <=count(26);
    end process;
end Divide;
