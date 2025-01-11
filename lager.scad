include <parameter.scad>

lager(0);
lager(1);

%color("silver",0.9)
translate([0,50,0])
rotate([90,0,0])
    cylinder(d=16,h=100);



module lager(innenaussen)
if(innenaussen)
translate([0,0,0])
{
    difference()
    {
        union()
        {
            difference()
            {
                union()
                {
                    translate([0,3,0])
                    rotate([90,0,0])
                        cylinder(d=25+15,h=3);

                    translate([0,1,0])
                    rotate([90,0,0])
                        cylinder(d=25-play,h=wood_d-3);
                }
                
                translate([0,4,0])
                rotate([90,0,0])
                    cylinder(d=16+2,h=wood_d-4+3+2);
            }

            for(r=[0,90,180,270])
            rotate([0,r,0])
            translate([0,3,25/2+7.5])
            rotate([90,0,0])
                cylinder(d=15,h=3);

            for(y=[1,-2.5,-6,-9.5,-13])
            translate([0,y,0])
            rotate([90,0,0])
            rotate_extrude(convexity = 10)
            translate([16/2+1.6, 0, 0])
                circle(r = 1.5, $fn = 100);
        }
        
        translate([0,4,0])
        rotate([90,0,0])
            cylinder(d=16,h=wood_d-4+3+2);

                
        for(r=[0,90,180,270])
        rotate([0,r,0])
        translate([0,3,25/2+7.5])
        {
            translate([0,1,0])
            rotate([90,0,0])
                cylinder(d=3,h=3+2);

            translate([0,1,0])
            rotate([90,0,0])
                cylinder(h=3,d1=7.5,d2=3);
        }
    }
}
//Lager innen
else
translate([0,-wood_d,0])
{
    difference()
    {
        union()
        {
            translate([0,0,0])
            rotate([90,0,0])
                cylinder(d=25+15,h=3);

            for(z=[25/2+7.5,-25/2-7.5])
            translate([0,0,z])
            rotate([90,0,0])
                cylinder(d=15,h=3);

            translate([0,3,0])
            rotate([90,0,0])
                cylinder(d=25-play,h=3+1);            
        }
        
        translate([0,+wood_d/2,0])
            rotate([90,0,0])
                cylinder(d=16+2,h=wood_d/2-1+5);
        
        for(z=[25/2+7.5,-25/2-7.5])
        translate([0,0,z])
        {
            translate([0,1,0])
            rotate([90,0,0])
                cylinder(d=3,h=3+2);

            translate([0,-4,0])
            rotate([-90,0,0])
                cylinder(h=3,d1=7.5,d2=3);
        }
    }
}
