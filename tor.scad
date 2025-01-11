include <parameter.scad>

tor();

module tor()
difference()
{
    union()
    {
        translate([-3,-t_b/2-30/2,0])
            cube([3,t_b+30,t_h+15]);

        translate([-1,-t_b/2-6/2,0])
            cube([wood_d+1,t_b+6,t_h+3]);
    }
    
    translate([-4,-t_b/2,-1])
        cube([wood_d+5,t_b,t_h+1]);
    
    for(y=[t_b/2+7.5,-t_b/2-7.5])
    for(z=[7.5,t_h+7.5])
    translate([0,y,z])
    {
        translate([1,0,0])
        rotate([0,-90,0])
            cylinder(h=3+2,d=3);

        translate([-4,0,0])
        rotate([0,90,0])
            cylinder(h=3,d1=7.5,d2=3);
    }
}
