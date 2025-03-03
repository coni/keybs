//import("/home/coni/Downloads/5027bcf069badcbad8a18b8ca4e2a05bd43c9a39_switch.dxf");

keycap_size=18;
switch_hole=14;
keyholder=19.05;

module key() {
    difference() {
        square(keyholder, keyholder, center=true);
        square(switch_hole, switch_hole, center=true);
    };
};


module key_column(x=0, y=0, row=1, column=1) {
    for (i = [0:1:column - 1])
        for (j = [0:1:row - 1])
            translate([x + (i * keyholder), y + (j * keyholder), 0])
            {
                key();
            };
};


color("#ffffff") key_column(row=3, column=6);