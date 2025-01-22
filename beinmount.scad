include <parameter.scad>

beinmount();

%color("Khaki")
{
    translate([-wood_d/2,-wood_d,-bw/4])
        cube([wood_d,200,bw/2]);
    rotate([0,15,0])
    translate([-bw/2,-wood_d,-100])
        cube([bw,wood_d,200]);
}

module beinmount()
difference()
{
    union()
    {
        translate([-(wood_d+6)/2,0,-(bw/2+6)/2])
            cube([wood_d+6,15+3,bw/2+6]);

        translate([-(wood_d+6+30)/2,0,-(bw/2+6+30-(wood_d+6+30))/2])
            cube([wood_d+6+30,3,bw/2+6+30-(wood_d+6+30)]);
        
        for(d=[-1,1])
        translate([0,0,d*(bw/2+6+30-(wood_d+6+30))/2])
        rotate([-90,0,0])
            cylinder(d=wood_d+6+30,h=3);
    }
    
    translate([-(wood_d+2*play)/2,-1,-(bw+2*play)/4])
        cube([wood_d+2*play,15+3+2,bw/2+2*play]);
    
    for(dd=[[-1,0],[1,0],[0,-1],[0,1]])
    translate([dd[0]*(wood_d/2+3+15/2),0,dd[1]*(bw/4+3+15/2)])
    {
        translate([0,4,0])
        rotate([90,0,0])
            cylinder(h=3+2,d=3);

        translate([0,4,0])
        rotate([90,0,0])
            cylinder(h=3,d1=7.5,d2=3);
    }
    
    for(m=[0,1])
    for(d=[-1,1])
    mirror([m,0,0])
    translate([wood_d/2,3+15/2,d*bw/6])
    {
        translate([4,0,0])
        rotate([0,-90,0])
            cylinder(h=3+2,d=3);

        translate([4,0,0])
        rotate([0,-90,0])
            cylinder(h=3,d1=7.5,d2=3);
    }



}
