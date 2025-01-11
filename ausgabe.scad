include <parameter.scad>

ausgabe();

module ausgabe()
difference()
{
    union()
    {
        translate([0,-(300*s+30)/2,-30/2])
            cube([3,300*s+30,100*s+30]);

        translate([-wood_d,-300*s/2,0])
            cube([wood_d+1,300*s,100*s]);
    }
    
    translate([-wood_d-1,-300*s/2+6/2,6/2])
        cube([wood_d+5,300*s-6,100*s-6]);
    
    for(y=[300*s/2+7.5,-300*s/2-7.5,7.5,-7.5])
    for(z=[-7.5,100*s+7.5])
    translate([0,y,z])
    {
        translate([4,0,0])
        rotate([0,-90,0])
            cylinder(h=3+2,d=3);

        translate([4,0,0])
        rotate([0,-90,0])
            cylinder(h=3,d1=7.5,d2=3);
    }
    
    translate([-wood_d-1,-0.01/2,-15-1])
        cube([wood_d+3+2,0.01,100*s+30+2]);
    
}