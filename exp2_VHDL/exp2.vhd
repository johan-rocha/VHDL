entity Priority_encoder_A is
    -- Declaring input and output variables
    Port ( 
    p0 : in STD_LOGIC;
    p1 : in STD_LOGIC;
    p2 : in STD_LOGIC;
    p3 : in STD_LOGIC;

    p0_not : inout STD_LOGIC;
    p1_not : inout STD_LOGIC;
    p2_not : inout STD_LOGIC;

    int : out STD_LOGIC;
    x0 : out STD_LOGIC;
    x1 : out STD_LOGIC);
    end Priority_encoder_A;
    
    architecture Dataflow of Priority_encoder_A is
    begin

    process (p0) --get the complement of p0
    begin
    if p0 = '0' then
    p0_not <= '1';
    else
    p0_not <= '0';
    end if;
    end process;

    process (p1) --get the complement of p1
    begin
    if p1 = '0' then
    p1_not <= '1';
    else
    p1_not <= '0';
    end if;
    end process;

    process (p2) --get the complement of p2
    begin
    if p2 = '0' then
    p2_not <= '1';
    else
    p2_not <= '0';
    end if;
    end process;

    process (p3) --get the complement of p3
    begin
    if p3 = '0' then
    p3_not <= '1';
    else
    p3_not <= '0';
    end if;
    end process;

    
    int <= i0 OR i1 OR i2 OR i3;    -- equacao int

    x1 <= (p0_not AND p1_not) ;  --equacao x1

    x0 <= (p0_not AND p1_not AND p2_not) OR (p0_not AND p1 AND p2 AND p3_not)             --equacao x0
    end Dataflow;

    