strip_width = 11;
strip_thickness = 0.6;
screw_diameter = 3;

$fa = 0.1;
$fs = 0.1;

difference(){
    cube([3 * screw_diameter, 3 * screw_diameter + 4 + strip_width, strip_thickness + 2]);
    translate([-1, 3 * screw_diameter + 2, -1]) cube([4 * screw_diameter, strip_width, strip_thickness + 1]);
    translate([1.5 * screw_diameter, 1.5 * screw_diameter, -1]) cylinder(h=strip_thickness + 4, d=screw_diameter);
}