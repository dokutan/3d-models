psu_depth = 30;
psu_height = 45;
wall = 1.5;
side_height = 13;
width = 12;
srew_d = 3;

$fa = 0.1;
$fs = 0.1;

module bracket(){
    difference(){
        cube([
            width,
            psu_depth + 2*wall,
            psu_height+wall+width
        ]);
        
        translate([-1, wall, wall])
        cube([
            width+2,
            psu_depth,
            psu_height + 2 * width
        ]);
        
        translate([-1, -1, psu_height * (2/3)])
        cube([
            width + 2,
            wall + 2,
            psu_height
        ]);
        
        translate([width/2, psu_depth+wall, psu_height + wall + width/2])
        rotate([90, 0, 0])
        cylinder(h = 3 * wall, d = screw_d, center = true);
    }
}

// left bracket
rotate([0, -90, 0])
union(){
    cube([wall, psu_depth + 2*wall, side_height]);
    bracket();
}

// right bracket
translate([5, 0, width])
rotate([0, 90, 0])
union(){
    translate([width - wall, 0, 0])
    cube([wall, psu_depth + 2*wall, side_height]);
    bracket();
}
