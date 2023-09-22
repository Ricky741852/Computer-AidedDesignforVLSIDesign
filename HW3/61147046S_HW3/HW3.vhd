library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HW3 is
    port (
        clk    : in  std_logic;
        glight : out std_logic;
        ylight : out std_logic;
        rlight : out std_logic--;
        --o_reset   : out std_logic;
        --o_enable  : out std_logic;
        --o_complete: out std_logic
	);
end entity HW3;

architecture Behavioral of HW3 is
	signal reset, enable, complete: std_logic;
	signal count: integer range 0 to 10;
	
	component Counter is
        generic (
            MAX_COUNT : integer := 10
        );
        port (
            clk     : in  std_logic;
            reset   : in  std_logic;
            enable  : in  std_logic;
            complete: out std_logic;
            count   : buffer integer range 0 to MAX_COUNT
        );
    end component Counter;
    
    component Controller is
        port (
            clk     : in  std_logic;
            reset   : out  std_logic;
            enable  : out  std_logic;
            complete: in  std_logic;
            glight  : out std_logic;
            ylight  : out std_logic;
            rlight  : out std_logic
        );
    end component Controller;
    
begin
	Counter_inst : Counter
	generic map (
		MAX_COUNT => 1
	)
	port map (
		clk => clk,
		reset => reset,
		enable => enable,
		complete => complete,
		count => count
	);
	Controller_inst : Controller
    port map (
        clk      => clk,
        reset    => reset,
        enable   => enable,
        complete => complete,
        glight   => glight,
        ylight   => ylight,
        rlight   => rlight
    );
    
    --o_reset <= reset;
    --o_enable <= enable;
    --o_complete <= complete;
end architecture Behavioral;