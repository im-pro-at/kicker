include <parameter.scad>


c_b=c_l/(2+10+1); //2 endcap 10 number 1 spacers

stange();
*stange(1);

for(m=[0,1])
mirror([0,m,0])
translate([0,c_b*6,0])
    endcap();

for(i=[1:10])
translate([0,i*(c_b+play)-c_b*5.5,0])
    number(i);

module stange(cut=0)
difference()
{   
    l=cut?(c_b+2):(c_b*13-10);
    b=cut?(c_b+play*2):c_b;
    union()
    {
        translate([0,0,c_b/2])
        rotate([0,45,0])
            cube([b/2,l,b/2],center=true);
    }

    if(cut==0)
    for(m=[0,1])
    mirror([0,m,0])
    translate([0,c_b*6,-1])
        cylinder(d=4+play,h=c_b+2);
}

module endcap()
difference()
{
    union()
    {
        translate([-c_b/2,-c_b/2,-play])
            cube([c_b,c_b,c_b+play]);
    }
    
    translate([0,-5-1+play,0])
        stange(1);

    translate([0,0,-1])
        cylinder(d=4+play,h=c_b+2);
        
    translate([0,0,c_b-3])
        cylinder(h=4,d2=8.7,d1=4);

}

module number(n=1)
difference()
{
    intersection()
    {
        translate([-c_b/2,-c_b/2,0])
            cube([c_b,c_b,c_b]);

        translate([0,0,c_b/2])
        sphere(c_b*0.7);
    }
    
    stange(1);
    
    translate([0,0,c_b-1])
    linear_extrude(2)
    rotate(-90)
        text(text=str(n),halign="center",valign="center",font="Consolas:style=Bold");
}




