entity Counter is
    Port ( RST : in STD_LOGIC;
           LD : in STD_LOGIC;
           CLK : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           CARRY: OUT STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Counter;

architecture Behavioral of Counter is
SIGNAL COUNT:STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL INTERN:STD_LOGIC;
begin
    PROCESS(CLK,RST,LD)
      BEGIN
        IF(RST='1') THEN
            COUNT <="0000";
        ELSE
            IF(LD='1') THEN
                COUNT <=D;
                ELSE
                    IF(RISING_EDGE(CLK)) THEN
                        COUNT<=COUNT+1;     
        END IF;
            END IF;
                   END IF;
    END PROCESS;
    Q<=COUNT;
    PROCESS (COUNT)
       BEGIN
        IF(COUNT="1111") THEN
            INTERN<='1';
         ELSE
            INTERN<='0';
          END IF;
    END PROCESS;
    CARRY<=INTERN;
end Behavioral;
