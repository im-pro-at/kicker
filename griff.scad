include <parameter.scad>

griff();

%color("silver",0.9)
translate([0,g_l-3,0])
rotate([90,0,0])
    cylinder(d=16,h=100+g_l);


module griff()
difference()
{
    union()
    {
        intersection()
        {
            union()
            {
                // base 
                translate([0,g_l,0])
                rotate([90,0,0])
                    cylinder(d=29,h=g_l);
        
                //holder
                for(i=[0:9])
                rotate([0,360/10*i,0])
                translate([13,g_l,0])
                rotate([90,0,0])
                    cylinder(d=7.5,h=g_l-15);
            }
            
            union()
            {
                translate([0,g_l-33/2,0])
                rotate([90,0,0])
                    cylinder(d=33,h=g_l-33/2);
                translate([0,g_l-33/2,0])
                sphere(d=33);
            }
        }

        // kranz
        translate([0,15+15+10,0])
        rotate([90,0,0])
            cylinder(d1=29, d2=50,h=15);

        translate([0,15+10,0])
        rotate([90,0,0])
            cylinder(d=50,h=10);
        
    }
    
    // Stangen Loch
    translate([0,g_l-3-5,0])
    rotate([90,0,0])
        cylinder(d=16+play,h=g_l);

    translate([0,g_l-3,0])
    rotate([90,0,0])
        cylinder(d2=16+play,d1=0,h=5+0.01);
    
    // Schraube
    translate([29/2+1,7.5,0])
    rotate([0,-90,0])
        cylinder(d=3, h=29+2);
    translate([29/2+1,7.5,0])
    rotate([0,-90,0])
        cylinder(h=2,d1=8,d2=3);
    translate([-29/2-1,7.5,0])
    rotate([0,90,0])
        cylinder(h=M3_nut_h+1,r=M3_nut_d/2,$fn=6);

}    


