library ieee;
use ieee.std_logic_1164.all;

entity HW2 is
    Port ( clk : in  std_logic;
           D_in : in  std_logic_vector (3 downto 0);
           Y : out std_logic_vector (2 downto 0);
           A, B, C : out  std_logic_vector (3 downto 0));
end HW2;

architecture Behavioral of HW2 is
    signal Reg_0, Reg_1, Reg_2 : std_logic_vector(3 downto 0);
    signal A_min, B_min, C_min : std_logic;
    component HW1 is
        Port ( A, B, C : in  std_logic_vector (3 downto 0);
               A_min, B_min, C_min : out std_logic);
    end component;
begin
    u_HW1 : HW1 port map (A => Reg_0, B => Reg_1, C => Reg_2,
                           A_min => A_min, B_min => B_min, C_min => C_min);

    process (clk)
    begin
        if rising_edge(clk) then
            Reg_0 <= D_in;
            Reg_1 <= Reg_0;
            Reg_2 <= Reg_1;
        end if;
    end process;
    
    A <= Reg_0;
    B <= Reg_1;
    C <= Reg_2;
    Y <= std_logic_vector'(A_min, B_min, C_min);
end Behavioral;