include <parameter.scad>

stopper();

module stopper()
difference()
{
    union()
    {
        // Stange 
        translate([0,15/2,0])
        rotate([90,0,0])
            cylinder(d=29,h=15);
        
    }
    
    // Stangen Loch
    translate([0,(37*s+2)/2,0])
    rotate([90,0,0])
        cylinder(d=16+play,h=37*s+2);
    
    // Schraube
    translate([29/2+1,0,0])
    rotate([0,-90,0])
        cylinder(d=3, h=29+2);
    translate([29/2+1,0,0])
    rotate([0,-90,0])
        cylinder(h=2,d1=8,d2=3);
    translate([-29/2-1,0,0])
    rotate([0,90,0])
        cylinder(h=M3_nut_h+1,r=M3_nut_d/2,$fn=6);

}    


%color("silver",0.9)
translate([0,50,0])
rotate([90,0,0])
    cylinder(d=16,h=100);

*translate([-30*s/2,-37*s/2,-72*s])
    cube([30*s,37*S,110]);
