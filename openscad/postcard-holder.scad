use <lib/ub.scad>

// wall thickness
wall = 2;

// bottom thickness
bottom = 22;

// postcard width
width = 150;

// depth of the holder
depth = 35;

// height of the front wall
front = 12;

// height of the back wall
back = 65;

// make the bottom hollow
hollow = true;

module base(){
    difference(){
        cube([
            width + 2 * wall,
            depth + 2 * wall,
            bottom + front,
        ]);
        
        translate([wall, wall, bottom])
        cube([
            width,
            depth + wall + 1,
            front + 1,
        ]);
        
        if(hollow && bottom > 4){
            /*translate([2, 2, 2])
            cube([
                width + 2 * wall - 4,
                depth + 2 * wall - 4,
                bottom - 4
            ]);*/
            translate([
                (width + 2 * wall) / 2,
                (depth + 2 * wall) / 2,
                bottom
            ])
            cube([
                (width + 2 * wall) - 50,
                depth,
                (bottom - wall) * 2
            ], center=true);
        }
    }
}

module plate(size, border, r){
    distance = 2 * r + wall;
    x = (size.x - border.x) / distance;
    y = (size.y - border.y) / distance;
    
    difference(){
        cube(size);

        translate([size.x / 2, size.y / 2])
        HexGrid([x, y], distance)
        cylinder(h=size.z * 3, r=r, center=true, $fn=6);
    }
}

module back(){
    translate([0, depth + 2 * wall, bottom])
    rotate([90 - 8, 0, 0])
    plate([width + 2 * wall, back, wall], [20, 20], 2);
}

union(){
    base();
    back();
}