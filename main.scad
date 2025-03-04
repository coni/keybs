//import("/home/coni/Downloads/5027bcf069badcbad8a18b8ca4e2a05bd43c9a39_switch.dxf");

keycap_size=18;
switch_hole=14;
key_hole_thickness=5;
keyholder=19.05;
case_height=10;
case_thickness=10;

module key() {
    difference() {
        cube([keyholder, keyholder, key_hole_thickness]);
        translate([(keyholder - switch_hole) / 2, (keyholder - switch_hole) / 2, -1]) {
            cube([switch_hole, switch_hole, key_hole_thickness + 2]);
        };
    };
};


module key_column(x=0, y=0, row=1, column=1) {
    for (i = [0:1:column - 1])
    {
        for (j = [0:1:row - 1])
        {
            translate([x + (i * keyholder), y + (j * keyholder), 0]) key();
        }
    }
   
    //translate([0,0, -10]) cube([(row * keyholder), 1, 10]);
};
color("#ffffff") key_column(row=1, column=2);