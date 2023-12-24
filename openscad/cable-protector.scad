// This is to protect cables from getting wedged under a square bed post.

use <lib/scad-utils/morphology.scad>

// width of the post
w = 64.5;

// edge radius of the post
r =  15;

// height of the clip
h = 20;

// thickness of the clip
t = 2;

// size of the gap 
gap = 1.3; // [1:0.1:1.7]

/* [Hidden] */
$fn = 100;

linear_extrude(h)
difference(){
    shell(t) rounding(r) square(w, center=true);
    translate([-w/2, -w/2]) square(w*gap, center=true);
}
