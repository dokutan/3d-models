base = 8;
base_height = 1;
length = 18.2;
diameter = 4.2;
inner_diameter = 0;
slit_length = 3;
slit_width = 1.5;

$fs = 0.1;
$fa = 0.1;

module tip(r){
    rotate_extrude() polygon([[0,0], [r,0], [r,1], [0,r]]);
}

difference(){
    union(){
        cylinder(h = base_height, d = base);
        translate([0, 0, base_height]) cylinder(h = length, d = diameter);
        translate([0, 0, base_height+length]) intersection(){
           tip((diameter+3-slit_width)/2);
           hull(){
               cube([1.5*diameter, 0.3*diameter, 2*diameter], center = true);
               cube([0.6*diameter, diameter, 2*diameter], center = true);
           }
        }
    }
    translate([0, 0, base_height+length]) cube([slit_width, diameter, 2*slit_length], center=true);
}
