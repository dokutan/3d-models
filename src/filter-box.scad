/*[ Storage box for a set of optical filters ]*/

// label on the bottom
label = "PETG";

// filter depth
depth = 10;

// filter length
length = 50.5;

// filter widths
widths = [
    11,
    8.5,
    5.5,
    6.2,
    6.2,
    6.2,
    5.2,
    3.5,
    5.6
];

// inner height of the lid
lid_height = 10.5;

// gap between the box and the lid
lid_gap = 0.5;


function sum_widths(v, i = 0, r = 4) = i < len(v) ? sum_widths(v, i+1, v[i] + r + 2) : r;
function sum_widths_until(v, l, i = 0, r = 4) = i < l ? sum_widths_until(v, l, i+1, v[i] + r + 2) : r;

tray_width = sum_widths(widths) + 2;

module box(){
    difference(){
        cube([tray_width, length + 8, depth + 2]);
        
        for(i = [0 : len(widths) - 1]){
            translate([sum_widths_until(widths, i), 4, 2]) cube([widths[i], length, depth + 1]);
        }
        
        translate([16, 2, -0.5]) mirror([1, 0, 0]) linear_extrude(1) text(label, size = 3, font="DejaVu Sans");
        
        translate([0, 0, depth - 3]) difference(){
            translate([-1, -1, 0]) cube([tray_width + 2, length + 10, depth]); 
            translate([2, 2, -1]) cube([tray_width - 4, length + 4, depth + 2]);
        }
    }   
}

module lid(){
    difference(){
        cube([tray_width, length + 8, lid_height + 2]);
        translate([2 - lid_gap, 2 - lid_gap, 2]) cube([tray_width - 4 + 2 * lid_gap, length + 4 + 2 * lid_gap, lid_height + 1]);
    }
}

box();
translate([0, length + 10, 0]) lid();
