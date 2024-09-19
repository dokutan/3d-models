
$fn = 1000;

module ring1(){
    d = 49; // inner diameter
    h = 8;
    difference(){
        cylinder(h=h, d=d+1.5, center=true);
        cylinder(h=h+2, d=d, center=true);
    }
}

module ring2(){
    d = 30.2; // outer diameter
    h = 70;
    union(){
        difference(){
            cylinder(h=h, d=d, center=true);
            cylinder(h=h+2, d=d-2, center=true);
        }
        difference(){
            translate([0, 0, 15]) cylinder(h=25, d=d, center=true);
            cylinder(h=h+2, d=d-3, center=true);
        }
    }
}

ring1();
ring2();
