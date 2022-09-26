u = 18;

module stem(){
    h = 4.7;
    
    translate([0, 0, h/2]) difference(){
        cube([5.6, 4.3, h], center=true);
        cube([4.0, 1.5, h*2], center=true);
        cube([1.3, 5.0, h*2], center=true);
    }
}

module stem_stabiliser(){
    h = 4.7;
    
    rotate([0, 0, 90]) translate([0, 0, h/2]) difference(){
        cube([5.0, 4.3, h], center=true);
        cube([3.4, 1.2, h*2], center=true);
        cube([1.3, 5.0, h*2], center=true);
    }
}

module plate(x=18){
    r = 0.6;
    $fa = 0.1;
    $fs = 0.1;
    
    translate([0, 0, -r]) minkowski(){
        sphere(r);
        cube([x - 2*r, 18 - 2*r, 0.001], center=true);
    }
}

module keycap(width){
    plate(width);
    stem();
}

module keycap_2u(){
    keycap(2 * u);
    translate([12, 0, 0]) stem_stabiliser();
    translate([-12, 0, 0]) stem_stabiliser();
}

module keycap_2_25u(){
    keycap(2.25 * u);
    translate([12, 0, 0]) stem_stabiliser();
    translate([-12, 0, 0]) stem_stabiliser();
}

module keycap_space(){
    keycap(118);
    translate([50, 0, 0]) stem_stabiliser();
    translate([-50, 0, 0]) stem_stabiliser();
    translate([10 + 35/2, 0, 1]) cube([35, 1, 3], center=true);
    translate([-10 - 35/2, 0, 1]) cube([35, 1, 3], center=true);
}

//keycap(1 * u);
//keycap_2_25u();
//keycap(1.75 * u);
keycap_space();