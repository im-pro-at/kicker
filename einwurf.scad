include <parameter.scad>


einwurf(1);

module einwurf(cut=0)
difference()
{
    dz=-3+0.8405;
    union()
    {
        // Aussen
        translate([0,wood_d+3,0])
        rotate([90,0,0])
            cylinder(d=40+15,h=3);
        
        for(z=[40/2+7.5,-40/2-7.5])
        translate([0,wood_d+3,z])
        rotate([90,0,0])
            cylinder(d=15,h=3);

        translate([0,wood_d+0.5,0])
        rotate([90,0,0])
            cylinder(d=40-play,h=wood_d/2-0.5+1);


        translate([0,wood_d+3+32/2+0.1,0])
        rotate([90,0,0])
            cylinder(d=32+6+2,h=32/2+2);
        
        translate([0,wood_d+3+32/2,0])
        difference()
        {
            sphere(d=32+2+6);
            
            translate([0,-40/2,0])
            cube([40,40,40],center=true);
        }
        
        // Innen
        translate([0,0,dz])
        rotate([90,0,0])
            cylinder(d=45+15,h=3);

        for(z=[40/2+7.5,-40/2-7.5])
        translate([0,0,dz+z])
        rotate([90,0,0])
            cylinder(d=15,h=3);

        translate([0,(wood_d/2-0.5+1)-1,0])
        rotate([90,0,0])
            cylinder(d=40-play,h=wood_d/2-1+1);            

    }
    
    translate([0,wood_d+4+32/2-1,0])
        rotate([93,0,0])
            cylinder(d=32+2,h=10+3+wood_d+3+32/2);
    
    
    // Aussen  
    for(z=[40/2+7.5,-40/2-7.5])
    translate([0,0,z])
    {
        translate([0,wood_d+4,0])
        rotate([90,0,0])
            cylinder(d=3,h=3+2);

        translate([0,wood_d+4,0])
        rotate([90,0,0])
            cylinder(h=3,d1=7.5,d2=3);
    }
    
    translate([0,wood_d+3+32/2,0])
        sphere(d=32+2);

    translate([-40/2,wood_d+3,0])
        cube([40,80,40]);

    // Innen    
    for(z=[40/2+7.5,-40/2-7.5])
    translate([0,0,dz+z])
    {
        translate([0,1,0])
        rotate([90,0,0])
            cylinder(d=3,h=3+2);

        translate([0,-4,0])
        rotate([-90,0,0])
            cylinder(h=3,d1=7.5,d2=3);
    }
    
    // cut
    if(cut)
    translate([-60/2,wood_d+3,-60/2])
        cube([60,2,60]);

}

