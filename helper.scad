include <parameter.scad>
use <lager.scad>
use <einwurf.scad>

b_l=65; // Bohere länge!

translate([0,0,0])
    helper1();
translate([100,0,0])
    helper2();
translate([200,0,0])
    helper3();
translate([300,0,0])
    helper4();
translate([400,0,0])
    helper5();
translate([500,0,0])
    helper6();
translate([600,0,0])
rotate([-90,0,0])
    helper7();
translate([700,0,0])
rotate([-90,0,0])
    helper8();
translate([800,0,0])
    helper9();
translate([900,0,0])
rotate([0,-90,0])
    helper10();

module helper1()
difference()
{
    // 19mm ---  holz
    // 7mm -30mm- holz 20mm tief
    h_t= 30- (19-7); //Boherer tiefe in holz

    union()
    {
        cylinder(h=b_l-h_t,d=wood_d-play);
        
        translate([-(wood_d+6)/2,-80/2,-10])
            cube([wood_d+6,80,10+10]);
    }
    
    translate([0,0,-1])
        cylinder(h=b_l-h_t+2,d=6+play);

    translate([-wood_d/2,-80/2-1,-10-1])
        cube([wood_d,80+2,10+1]);
    
    for(d=[-1,1])
    rotate([0,0,d*90])
    translate([0,-3/2,-1])
    rotate([0,30,0])
        cube([5,3,30]);
        
}

module helper2()
difference()
{
    // 19mm ---  holz
    // 7mm -30mm- holz 20mm tief
    h_t=(19-6); //Boherer tiefe in holz

    union()
    {
        cylinder(h=b_l-h_t,d=wood_d-play);
        
        translate([-wood_d/2,-80/2,0])
            cube([wood_d,80,wood_d]);
        
      
        translate([-wood_d/2+1,0,wood_d/2])
        rotate([0,-90,0])
            cylinder(d=6-play,h=5+1);
    }
    
    translate([0,0,-1])
        cylinder(h=b_l-h_t+2,d=6+play);
        
}

module helper3()
difference()
{
    // 19mm ---  holz
    // 7mm -30mm- holz 20mm tief
    h_t=(19-6); //Boherer tiefe in holz

    union()
    {
        cylinder(h=b_l-h_t,d=wood_d-play);
        
        translate([-wood_d/2,-80/2,0])
            cube([wood_d,80,5]);
            
        translate([-80/2,-wood_d/2,0])
            cube([80,wood_d,5]);
    }
    
    translate([0,0,-1])
        cylinder(h=b_l-h_t+2,d=6+play);

    for(d=[0,90,180,270])
    rotate([0,0,d])
    translate([0,-3/2,-1])
    rotate([0,30,0])
        cube([5,3,30]);
        
}

module helper4()
difference()
{
    union()
    {
        translate([-wood_d/2,-240/2,0])
            cube([wood_d,240,1.6]);
    }
    
    for(d=[0,100,-100,50,-50])
    translate([0,d,-0.01])
    {
        cylinder(d1=1,d2=12,h=2);
        
        translate([-wood_d/4,-1/2,0])
            cube([wood_d/2,1,2]);
            
        translate([-1/2,-wood_d/4,0])
            cube([1,wood_d/2,2]);
    }
}

module helper5()
difference()
{
    d_m_bk= 41.7; //Bohrmaschine kopf zu teller bohere oben
    bk_d=8.8; //Duchmesser bohrer schaft
    b_d=25; //Borhung duchmesser
    b_t_h=9; //Teller bohere höhe
    b_l=51; //Bohere länge von Bohrmaschine bis kopf
    h_t=19-3; //Bohrtiefe
    
    union()
    {
        cylinder(h=b_l-h_t,d=bk_d+6);

        cylinder(h=b_t_h+3,d=b_d+6);
        
        translate([-wood_d/2,-80/2,0])
            cube([wood_d,80,3]);
            
        translate([-80/2,-wood_d/2,0])
            cube([80,wood_d,3]);
    }
    
    translate([0,0,-1])
        cylinder(h=b_l-h_t+2,d=bk_d+play);

    translate([0,0,-1])
        cylinder(h=b_t_h+1,d=b_d+play);
    
    for(d=[0,90,180,270])
    rotate([0,0,d])
    translate([0,-3/2,-1])
    rotate([0,30,0])
        cube([5,3,30]);
        
}

module helper6()
difference()
{
    bk_d=10.8; //Duchmesser bohrer schaft
    b_d=40.5; //Borhung duchmesser
    b_t_h=12; //Teller bohere höhe
    b_l=52; //Bohere länge von Bohrmaschine bis kopf
    h_t=19-2; //Bohrtiefe
    
    union()
    {
        cylinder(h=b_l-h_t,d=bk_d+6);

        cylinder(h=b_t_h+3,d=b_d+6);
        
        translate([-wood_d/2,-100/2,0])
            cube([wood_d,100,3]);
            
        translate([-100/2,-wood_d/2,0])
            cube([100,wood_d,3]);
    }
    
    translate([0,0,-1])
        cylinder(h=b_l-h_t+2,d=bk_d+play);

    translate([0,0,-1])
        cylinder(h=b_t_h+1,d=b_d+play);
    
    for(d=[0,90,180,270])
    rotate([0,0,d])
    translate([0,-3/2,-1])
    rotate([0,30,0])
        cube([5,3,30]);
        
}

module helper7()
difference()
{
    translate([-30/2,3-2,0])
        cube([30,3,kastenh/2-(sh*s+afs+asf)]);

    lager(1);
}

module helper8()
difference()
{
    translate([-40/2,wood_d+3-2,0])
        cube([40,3,40]);

    einwurf(0);
}

module helper9()
difference()
{
    union()
    {
        translate([-30,-20/2,-29/2])
            cube([2*30,20,29]);
    }
    
    // Stangen Loch
    translate([0,20/2+1,0])
    rotate([90,0,0])
        cylinder(d=16+play,h=20+2);
    
    // Schraube
    translate([30+1,0,0])
    rotate([0,-90,0])
        cylinder(d=3, h=2*30+2);
        
    translate([-15/2,-2/2,-29/2-1])
        cube([15,2,29+2]);
}    

module helper10()
difference()
{
    union()
    {
        translate([-29/2,-15/2,-29/2])
            cube([29/2+30,15,29]);
    }
    
    // Stangen Loch
    translate([0,(37*s+2)/2,0])
    rotate([90,0,0])
        cylinder(d=16+play,h=37*s+2);
    
    translate([0,-(15+2)/2,-2/2])
        cube([30+1,15+2,2]);
}    




