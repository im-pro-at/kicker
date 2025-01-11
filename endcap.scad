include <parameter.scad>

endcap();

*%color("silver",0.9)
translate([0,100,0])
rotate([90,0,0])
    cylinder(d=16,h=100);

module endcap()
difference()
{
    translate([0,3,0])
    rotate([90,0,0])
        cylinder(h=6, d=16+6);
    
    translate([0,0,0])
    rotate([90,0,0])
    difference(){        
        cylinder(h=3+1, d=16+play);
        translate([0,0,-1])
            cylinder(h=3+1+2, d=11.8-play);
    }
}

