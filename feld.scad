include <parameter.scad>


intersection()
{
    feld(0);
    
    translate([1200*s/2-200,-250/2,0])
        cube([250,250,250]);
}

*color("white")
    feld(0);
*color("green")
    feld(1);
    

//Spielfeld
module feld(fol)
scale([s,s,s])
{
    if (fol)
    {
        difference()
        {
            feld_h();

            translate([0,0,-1])
            linear_extrude(40)
                feld_l(1);
        }
    }
    else
    {
        union()
        {
            intersection()
            {
                feld_h();

                translate([0,0,-1])
                linear_extrude(40)
                    feld_l(1);
            }
            
            // Tor
            for(m=[0,1])
            mirror([m,0,0])
            translate([1200/2-1,-t_b/s/2-3/2,0])
                cube([wood_d/s+1,t_b/s+3,sh]);
            
        }
    }
    
}


module feld_h()
for(my=[0,1])
mirror([0,my,0])
for(mx=[0,1])
mirror([mx,0,0])
union()
{
    //middel
    linear_extrude(sh)
        polygon([
                    [ 1200/2,   -1],
                    [  850/2,   -1],
                    [     -1,   -1],
                    [     -1, 270/2],
                    [     -1, 630/2],
                    [  850/2, 630/2],
                    [ 1200/2, 270/2],            
                ]);
    //siedline
    difference()
    {
        linear_extrude(40)
        polygon([
                    [       -1, 630/2-1],
                    [       -1, 680/2  ],
                    [  850/2+20, 680/2  ],
                    [  850/2+20, 630/2-1],
                ]);
        translate([-2,630/2-1,sh])
        rotate([a,0,0])
            cube([850/2+24,200,40]);
    }
    //corner
    difference()
    {
        linear_extrude(40)
        polygon([
                    [  850/2, 680/2],
                    [  850/2, 630/2-1],
                    [ 1200/2, 270/2-1],
                    [ 1200/2, 680/2],
                ]);
        translate([850/2,630/2,sh])
        rotate([0,0,-45.83031549])
        rotate([a,0,0])
        translate([-20,-2,0])
            cube([300,(680-270)/2,40]);
    }
}

module feld_l(ol)
union()
{
    circle(d=2*9);
    difference()
    {
        circle(d=205+9);
        circle(d=205-9);
    }
    for(d = [1,-1])
    translate([0,d*(((680-205)/2)/2+205/2),0])
        square([9,(680-205)/2],center=true);

    for(d = [1,-1])
    translate([d*((147+9)/2-1200/2),0,0])
    difference()
    {
        square([147+9,274+9],center=true);
        square([147-9,274-9],center=true);
    }

    for(d = [1,-1])
    translate([d*((284+9)/2-1200/2),0,0])
    difference()
    {
        square([284+9,413+9],center=true);
        square([284-9,413-9],center=true);
    }

    for(d = [1,-1])
    translate([d*(1200/2-284-9),0,0])
    difference()
    {
        translate([d*(205/2-57),0,0])
            circle(d=205+9);
        translate([d*(205/2-57),0,0])
            circle(d=205-9);
        translate([d*200/2,0,0])
            square([200,300],center=true);
    }

    for(d = [1,-1])
    translate([0,d*(9/2-ol/2-680/2),0])
        square([1200+ol*2,9+ol],center=true);

    for(d = [1,-1])
    translate([d*(9/2-ol/2-1200/2),0,0])
        square([9+ol,680+ol*2],center=true);
}
