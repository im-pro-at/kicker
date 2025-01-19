include <parameter.scad>

stange();

for(m=[0,1])
mirror([0,m,0])
translate([0,c_b*6+5+0.001,0])
    endcap();

for(i=[1:10])
translate([0,-i*(c_b+1)+5*(c_b+1),0])
    number(i);

module stange(cut=0)
difference()
{   
    l=cut?(c_b+2):(c_b*13);
    echo(l);
    b=cut?(c_b+play*2):(c_b-play);
    union()
    {
        translate([0,0,c_b/2])
        rotate([0,45,0])
            cube([b/2,l,b/2],center=true);
        
        if(cut==0)
        for(i=[0:4])
        for(d=[-1,1])
        translate([0,d*(0.5+b/2+i*(b+1)),0])
        translate([0,0,c_b/2])
        rotate([0,45,0])
        for(r=[0,180])
        rotate([0,r,0])        
        union()
        {
            rb=c_b/2+2*play;
            *translate([-rb/2+1/2,0,rb/2-1/2])
            rotate([0,90,0])
                cylinder(d=1,h=rb/2+1-1/2);

            translate([-rb/2+1/2,0,-rb/2+1/2])
                cylinder(d=1,h=rb-1);
            
        }
    }

    if(cut==0)
    for(m=[0,1])
    mirror([0,m,0])
    translate([0,c_b*6+5,-1])
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




