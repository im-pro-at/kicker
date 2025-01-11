include <parameter.scad>

// Render without translate:
translate([0,50,0])
    figuren(0);

// Render without translate:
translate([0,-50,0])
    figuren(1);

%color("silver",0.9)
translate([0,100,0])
rotate([90,0,0])
    cylinder(d=16,h=200);

%translate([-30*s/2,-37*s/2,-72*s])
    cube([30*s,37*s,110]);


module figuren(dir)
difference()
{
    union()
    {
        scale([s,s,s])
        intersection()
        {
            if(dir)
            {
                translate([-3,-1,-5])
                rotate([-4,0,-15])
                scale([0.125,0.125,0.125])
                    import("scann_1.stl");
            }
            else
            {
                translate([8,0,-10])
                rotate([15,-9,-25])
                scale([0.125,0.125,0.125])
                    import("scann_0.stl");
            }
            translate([-30/2,-37/2,0])
                cube([30,37,120-72]);
        }

        // Stange 
        translate([0,37*s/2,0])
        rotate([90,0,0])
            cylinder(d=29,h=37*s);
        
        // Füsse
        // Füsse
        intersection()
        {
            union()
            for(d=[-1,1])
            translate([0,-1*d*4,-asf+18*s-1])
            rotate([d*5.5,0,0])
                cylinder(d1=10,d2=18.5,h=asf-18*s+1);

            translate([-30*s/2,-37*s/2,-asf+18*s-1])
                cube([30*s,37*s,asf-18*s-16/2]);
        }
        
        // kicker fuss
        translate([0,0,18*s/2-asf])
        intersection()
        {
            cube([13*s,25*s,18*s],center=true);   
            translate([0,25*s/2,-18*s/2+22*s/2])
            rotate([90,0,0])
                cylinder(d=22*s,h=25*s);
            translate([0,0,18*s/2])
            rotate([0,5,0])
                cube([13*s,25*s,100],center=true);   
            translate([0,0,18*s/2])
            rotate([0,-5,0])
                cube([13*s,25*s,100],center=true);
          
        }

    }
    
    // Stangen Loch
    translate([0,(37*s+2)/2,0])
    rotate([90,0,0])
        cylinder(d=16+play,h=37*s+2);
    
    // Schraube
    translate([29/2+1,0,0])
    rotate([0,-90,0])
        cylinder(d=3+play, h=29+2);
    translate([29/2+1,0,0])
    rotate([0,-90,0])
        cylinder(h=2,d1=8,d2=3);
    translate([-29/2-1,0,0])
    rotate([0,90,0])
        cylinder(h=M3_nut_h+1,r=M3_nut_d/2,$fn=6);

}    
