size_x = 65;
size_y = 15;
size_z = 35;
wall = 2;
screw_d = 3;

$fa = 0.1;
$fs = 0.1;

difference(){
    cube([size_x + 20, size_y + 2 * wall, size_z + wall]);
    translate([-1, wall, wall]) cube([size_x + 22, size_y, size_z + 1]);

    translate([-1, -1, -1]) cube([11, size_y + wall + 1, size_z + wall + 2]);
    translate([size_x + 10, -1, -1]) cube([11, size_y + wall + 1, size_z + wall + 2]);

    translate([5, size_y + 2 * wall + 1, size_z / 2]) rotate([90, 0, 0]) cylinder(h = wall + 2, d = screw_d);
    translate([size_x + 15, size_y + 2 * wall + 1, size_z / 2]) rotate([90, 0, 0]) cylinder(h = wall + 2, d = screw_d);
}