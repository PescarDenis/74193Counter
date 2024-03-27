library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BOX is
    Port ( CLK100 : in STD_LOGIC;
           RST : in STD_LOGIC;
           LD : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           CARRY: OUT STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end BOX;

architecture Behavioral of BOX is
SIGNAL CLK_INTERN:STD_LOGIC;

COMPONENT Freq_Divider is
    Port ( CLK100 : in STD_LOGIC;--initial clock of 100Mhz
           Divided : out STD_LOGIC;--this is the divided clock
           Reset : in STD_LOGIC);
end COMPONENT;

COMPONENT Counter is
    Port ( RST : in STD_LOGIC;
           LD : in STD_LOGIC;
           CLK : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           CARRY: OUT STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

begin
C1: Freq_Divider PORT MAP(CLK100,CLK_INTERN,'1');
C2: Counter PORT MAP(RST,LD,CLK_INTERN,D,CARRY,Q);

end Behavioral;
