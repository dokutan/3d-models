/* Replacement for the x-axis belt tensioner on the Ender 3v2. */
/* WARNING: requires a redesign or significant filing. */

$fa = 0.1;
$fs = 0.1;

outer_x = 58.5;
outer_y = 28.5;
outer_z = 27.5;

module shell(){
    difference(){
        cube([outer_x, outer_y, outer_z]); // outer dimensions
        
        translate([-1, 2.5, 2]) cube([1 + 56, 23.5, 23]);
        translate([-1, 2.5, -1]) cube([1 + 12, 23.5, 100]);
        translate([0, outer_y - 2.5 - 3.5, -1]) cube([outer_x - 37, 3.5, 100]);
        
        // front screw holes
        screw_r1 = 5.0 / 2;
        translate([5.6 + screw_r1, 0, 12.7 + screw_r1]) rotate([90, 0, 0]) cylinder(h=100, r=screw_r1, center=true);
        translate([5.6 + screw_r1, 0, 12.7 + screw_r1]) rotate([90, 0, 0]) cylinder(h=1.5, r1=screw_r1, r2=screw_r1 + 1.5, center=true);
        
        // back screw hole
        screw_r2 = 4.2 / 2;
        translate([50, 10.5 + screw_r2, 10.5 + screw_r2]) rotate([0, 90, 0]) cylinder(h=100, r=screw_r2, center=true);
    }
}

union(){
    shell();
    
    // inner guides (front)
    translate([16.5, 0, 7.4]) cube([outer_x - 16.5, 4.3, 1.5]);
    translate([16.5, 0, outer_z - 8.7]) cube([outer_x - 16.5, 4.3, 8.7]);
    translate([16.5, 0, outer_z - 6.2]) cube([outer_x - 16.5, 5.2, 6.2]);
    translate([16.5, 0, outer_z - 5.2]) cube([outer_x - 16.5, 9, 5.2]);
    
    // inner guides (bottom)
    translate([16.5, 0, 0]) cube([outer_x - 16.5, 6.6, 3.2]);
    translate([16.5, outer_y - 10.2, 0]) cube([outer_x - 16.5, 4.2, 3.2]);
    
    // inner guides (back)
    translate([16.5, outer_y - 7.4, 7.4]) cube([outer_x - 16.5, 7.4, 1.5]);
    translate([outer_x - 37, outer_y - 2.5 - 3.5, 0]) cube([37, 2.5 + 3.5, 7.4]);
    translate([outer_x - 37, outer_y - 6.3, outer_z - 11]) cube([37, 6.3, 11]);
    translate([outer_x - 37, outer_y - 8.5, outer_z - 6.2]) cube([37, 8.5, 6.2]);
    translate([outer_x - 37, outer_y - 12, outer_z - 5.2]) cube([37, 12, 5.2]);
}
