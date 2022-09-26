/*[ Toothbrush holder ]*/
// height in mm
height = 100;

// hole diameter in mm
diameter = 18;

// width around the hole in mm
width = 3;

// wall thickness in mm
thickness = 3;

// corner radies in mm
radius = 5;

// add a dent on the bottom ?
create_dent = true;

difference(){
    
    $fa = 0.5;
    $fs = 0.5;
    
    hull(){
        H = diameter + 2 * width;
        
        translate([radius, radius, H / 2]) cylinder(h = H, r = radius, center = true);
        translate([height - radius, radius, H / 2]) cylinder(h = H, r = radius, center = true);
        
        translate([radius, radius + diameter + 2 * width, H / 2]) cylinder(h = H, r = radius, center = true);
        translate([height - radius, radius + diameter + 2 * width, H / 2]) cylinder(h = H, r = radius, center = true);
    }
    
    translate([0, 0, -1]) hull(){
        H = diameter + 2 * width + 2;
        radius = radius - (thickness / 2);
        
        translate([radius + thickness, radius + thickness, H / 2]) cylinder(h = H, r = radius, center = true);
        translate([height - radius - thickness, radius + thickness, H / 2]) cylinder(h = H, r = radius, center = true);
        
        translate([radius + thickness, radius + diameter + 2 * width, H / 2]) cylinder(h = H, r = radius, center = true);
        translate([height - radius - thickness, radius + diameter + 2 * width, H / 2]) cylinder(h = H, r = radius, center = true);
    }
        
    translate([0, radius + width + diameter / 2, width + diameter / 2]) rotate([0, -90, 0]) cylinder(h = 3 * thickness, r = diameter / 2, center = true);
    
    if(create_dent){
        translate([height - (diameter + thickness) / 2, radius + width + diameter / 2, width + diameter / 2]) sphere(d = diameter);
    }
}