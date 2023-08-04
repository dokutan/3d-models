/*
     +-----+  ^
     |     |  |
     |<--->|  |
     |  2     |
     |        |
  1  |        | hook_height
|<-->|        |
|    |        |
+----+        v

1 = cable_depth
2 = hook_depth
*/

thickness = 2.5;
hook_depth = 26.5;
hook_height = 45;
cable_diameter = 4.5;
cable_depth = 8;

difference(){
    // base shape
    cube([
        10 + cable_diameter,
        3 * thickness + cable_depth + hook_depth,
        2 * thickness + hook_height
    ]);
    
    // hook
    translate([
        -1,
        2 * thickness + cable_depth,
        -1
    ])
    cube([
        12 + cable_diameter,
        hook_depth,
        hook_height + thickness + 1
    ]);
    
    translate([
        -1,
        2 * thickness + cable_depth,
        -1
    ])
    cube([
        12 + cable_diameter,
        hook_depth + 2 * thickness,
        hook_height / 2
    ]);
    
    // cable holder
    translate([
        -1,
        thickness,
        thickness
    ])
    cube([
        12 + cable_diameter,
        cable_depth,
        hook_height + 2 * thickness
    ]);
    
    translate([
        -1,
        -1,
        thickness + 5
    ])
    cube([
        12 + cable_diameter,
        cable_depth,
        hook_height + 2 * thickness
    ]);
    
    // cable slot
    translate([
        5,
        -1,
        -1
    ])
    cube([
        cable_diameter,
        cable_depth + thickness + 1,
        hook_height
    ]);
}
