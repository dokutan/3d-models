/*[ Plant support ring ]*/
// inner diameter of the ring
diameter = 120;

// thickness of the ring
thickness = 3;

// width of the ring
width = 4;

/*[ Rods ]*/
// outer diameter of the rods
rod_diameter = 4.5;

// number of rods
rods = 4;

// height of the rod holder
h_height = 10;

// wall thickness of the rod holder
h_thickness = 1;

$fa = 0.5;
$fs = 0.5;

// ring
difference(){
    cylinder(h = thickness, r = (diameter + 2 * width) / 2, center = true);
    cylinder(h = thickness * 2, r = diameter / 2, center = true);
}

// rod holders
r  = (diameter + width) / 2;
for (a = [0 : rods - 1]) {
    angle = a * 360 / rods;
    
    translate([r * cos(angle), - r * sin(angle), h_height / 2 - thickness / 2]) difference(){
        cylinder(h = 10, r = rod_diameter / 2 + h_thickness, center = true);
        translate([0, 0, thickness]) cylinder(h = 10, r = rod_diameter / 2, center = true);
    }
}