//import("/home/coni/Downloads/5027bcf069badcbad8a18b8ca4e2a05bd43c9a39_switch.dxf");

keycap_size=18;
switch_hole=14;
key_pin=3.5;
key_hole_thickness=5 + key_pin;
keyholder=19.05;
case_height=13;
case_thickness=5;

module key() {
    difference() {
        cube([keyholder, keyholder, key_hole_thickness]);
        translate([(keyholder - switch_hole) / 2, (keyholder - switch_hole) / 2, -1]) {
            cube([switch_hole, switch_hole, key_hole_thickness + 2]);
        };
    };
};


module key_column(x=0, y=0, z=0, row=1, column=1) {
    // Index
    for (j = [0:1:row - 1]) {
        translate([x + (0 * keyholder) , y + (j * keyholder), z]) key();
    }
    
    // Index
    for (j = [0:1:row - 1]) {
        translate([x + (1 * keyholder), y + (j * keyholder), z]) key();
    }
    
    // Middle finger
    for (j = [0:1:row - 1]) {
        translate([x + (2 * keyholder), (y + (3 * keyholder / 5)) + (j * keyholder), z]) key();
    }
    
    // Ring finger
    for (j = [0:1:row - 1]) {
        translate([x + (3 * keyholder), (y + ((3 * keyholder / 5)/2)) + (j * keyholder), z]) key();
    }
    
    // Pinkie
    for (j = [0:1:row - 1]) {
        translate([x + (4 * keyholder) , y + (j * keyholder), z]) key();
    }
   
};

module proto_case(x=0, y=0, column=1)
{
    cube([(column * keyholder) + case_thickness * 2, case_thickness, case_height]);
    
    translate([0, 4 * keyholder, 0]) cube([(column * keyholder) + case_thickness * 2, case_thickness, case_height]);
    
    translate([0, case_thickness, 0]) cube([case_thickness, (4 * keyholder), case_height]);
    translate([(column * keyholder) + case_thickness, case_thickness, 0]) cube([case_thickness, (4 * keyholder), case_height]);
}   
cube([(5 * keyholder) + (case_thickness * 2), (4 * keyholder), case_thickness / 2]);
proto_case(column=5);
translate([case_thickness, case_thickness, 0]) color("#ffffff") key_column(z=case_thickness/2 + 2, row=3, column=5);