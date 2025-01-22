include <parameter.scad>
use <tor.scad>
use <ausgabe.scad>

ballfaenger();

%translate([0,0,3*s])
    tor();
    
%translate([ablage,0,-kastenh/2+wood_d])
    ausgabe();
    

%union()
color("Khaki",alpha=0.3)
{
    d=1;
    translate([0,-680*s/2,-kastenh/2])
    difference()
    {
        cube([wood_d,680*s,kastenh-wood_d]);
        
        translate([-1,680*s/2-t_b/2-3,sh*s+kastenh/2-3])
            cube([wood_d+2,t_b+6,t_h+3+3]);
    }
    //ablage
    translate([0,-680*s/2,kastenh/2-wood_d])
        cube([ablage,680*s,wood_d]);

    translate([wood_d,-300*s/2,-kastenh/2])
        cube([ablage-2*wood_d,300*s,wood_d]);
    //ball ausgabe
    translate([ablage-wood_d,-680*s/2,-kastenh/2])
    difference()
    {
        cube([wood_d,680*s,kastenh-wood_d]);
        
        translate([-1,-300*s/2+680*s/2,wood_d])
            cube([wood_d+2,300*s,100*s]);
    }
    for(dy=[-1,1])
    translate([+wood_d,-wood_d/2+dy*(300*s/2+wood_d/2),-kastenh/2])
        cube([ablage-2*wood_d,wood_d,kastenh-wood_d]);
}

module ballfaenger()
difference()
{
    union()
    {
        for(m=[0,1])
        mirror([0,m,0])
        translate([+wood_d+1,-300*s/2+1,-(kastenh/2-wood_d-100*s)+2])
        rotate([-10,0,0])
        rotate([0,-10,0])
        translate([0,0,0])
            cube([ablage-2*wood_d-2,300*s/2,3]);
            
        translate([wood_d,-300*s/2+1,-(kastenh/2-wood_d-100*s)-20])
            cube([3,300*s-2,23]);
    }
    
    translate([(32+6)/2+wood_d+3,0,-50])
        cylinder(h=50,d=32+6);
        
    for(y=[-300*s/2+10,+300*s/2-10])
    translate([wood_d,y,-(kastenh/2-wood_d-100*s)-10])
    {
        translate([4,0,0])
        rotate([0,-90,0])
            cylinder(h=3+2,d=3);

        translate([4,0,0])
        rotate([0,-90,0])
            cylinder(h=3,d1=7.5,d2=3);
    }

    
}
