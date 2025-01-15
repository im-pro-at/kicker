include <parameter.scad>
use <feld.scad>
use <lager.scad>
use <griff.scad>
use <stopper.scad>
use <figuren.scad>
use <stopper.scad>
use <endcap.scad>
use <lager.scad>
use <tor.scad>
use <ausgabe.scad>
use <einwurf.scad>

usestl=1; //use prerendered stls for better speed

scale(1+($t<0.5?$t*10:(1-$t)*10)) //for animation
rotate([0,0,$t*360]) //for animation
translate([($t<0.5?$t:1-$t)*-000,0,0]) //for animation
{
    //Spielfeld platte
    translate([-1200*s/2,-680*s/2,-wood_d])
        wood([1200*s,680*s,wood_d]);

    //Seiten platten
    for(d=[-1,1])
    translate([0,-wood_d/2+d*(680*s/2+wood_d/2),0])
    difference()
    {
        translate([-1200*s/2-ablage,0,-kastenh/2])
            wood([1200*s+2*ablage,wood_d,kastenh]);
        
        //stangen
        for(i=[0:7])
        translate([-3.5*ass+ass*i,wood_d+1,sh*s+afs+asf])
        rotate([90,0,0])
            cylinder(d=25 ,h=wood_d+2);
        
        //balleinwurf
        translate([0,wood_d+1,beh])
        rotate([90,0,0])
            cylinder(d=40,h=wood_d+2);
        
    }

    //tor platten
    for(d=[-1,1])
    translate([-wood_d/2+d*(1200*s/2 +wood_d/2),-680*s/2,-kastenh/2])
    difference()
    {
        wood([wood_d,680*s,kastenh-wood_d]);
        
        translate([-1,680*s/2-t_b/2-3,sh*s+kastenh/2-3])
            cube([wood_d+2,t_b+6,t_h+3+3]);
    }

    //ablage
    for(d=[-1,1])
    translate([-ablage/2+d*(ablage/2+1200*s/2),-680*s/2,kastenh/2-wood_d])
        wood([ablage,680*s,wood_d]);

    //ball ausgabe
    for(d=[-1,1])
    translate([-wood_d/2+d*(-wood_d/2+1200*s/2+ablage),-680*s/2,-kastenh/2])
    difference()
    {
        wood([wood_d,680*s,kastenh-wood_d]);
        
        translate([-1,-300*s/2+680*s/2,wood_d])
            cube([wood_d+2,300*s,100*s]);
    }
    for(dx=[-1,1])
    for(dy=[-1,1])
    translate([-(ablage-2*wood_d)/2+dx*((ablage-2*wood_d)/2+1200*s/2+wood_d),-wood_d/2+dy*(300*s/2+wood_d/2),-kastenh/2])
        wood([ablage-2*wood_d,wood_d,kastenh-wood_d]);

    for(d=[-1,1])
    translate([-(ablage-2*wood_d)/2+d*((ablage-2*wood_d)/2+1200*s/2+wood_d),-300*s/2,-kastenh/2])
        wood([ablage-2*wood_d,300*s,wood_d]);

    //Beine
    azb= abs-sh*s-afs-asf;  //Abstand Zerro zu boden
    xl=28.3; //Extralänge für schräge
    bw= 100; //Bein dicke
    difference()
    {
        union()
        {
            for(dx=[-1,1])
            {
                for(dy=[-1,1])
                translate([dx*(1200*s/2-bw),-wood_d/2+dy*(3*wood_d/2+680*s/2),0])
                mirror([(dx+1)/2,0,0])
                rotate([0,15,0])
                translate([0,0,-azb-xl])
                {
                    wood([bw,wood_d,azb+xl*2]);
                    translate([0,-dy*wood_d,0])
                        wood([bw,wood_d,azb-kastenh/2+xl*2]);
                }

                translate([-bw/4+dx*(1200*s/2-bw/2),-680*s/2-wood_d,-azb/2])
                    wood([bw/2,680*s+2*wood_d,wood_d]);
            }
        }
        
        //cut floor
        translate([0,0,-100/2-azb])
            cube([1200*s+2*ablage,680*s+4*wood_d+1,100],center=true);
        //cut top
        translate([0,0,100/2])
            cube([1200*s+2*ablage,680*s+4*wood_d+1,100],center=true);
    }
    
    //spilfeld:
    color("green")
        load("feld_1");

    color("white")
        load("feld_0");    

    //Stangen
    //daten: [pos,modules]
    stor=[
        [GRIFF, -184*s-473*s-20],
        [BUFFER, -184*s-16],
        [STOPPER, -184*s],
        [FIGUR, 0,1],
        [STOPPER, 184*s],
        [BUFFER, 184*s+16],
        [ENDCAP, 184*s+292*s+30]
    ];
    s2p=[
        [GRIFF, -232*s/2-610*s-10],
        [BUFFER, -232*s/2-24],
        [FIGUR, -232*s/2],
        [FIGUR, 232*s/2],
        [BUFFER, 232*s/2+24],
        [ENDCAP, 232*s/2+428*s+20]
    ];
    s3p=[
        [GRIFF, -184*s-473*s-10],
        [BUFFER, -184*s-24],
        [FIGUR, -184*s],
        [FIGUR, 0],
        [FIGUR, 184*s],
        [BUFFER, 184*s+24],
        [ENDCAP, 184*s+292*s+20]
    ];
    s5p=[
        [GRIFF, -2*121*s-358*s-10],
        [BUFFER, -2*121*s-24],
        [FIGUR, -2*121*s],
        [FIGUR, -121*s],
        [FIGUR, 0],
        [FIGUR, 121*s],
        [FIGUR, 2*121*s],
        [BUFFER, 2*121*s+24],
        [ENDCAP, 2*121*s+176*s+20]
    ];
    sdata=[ //[i, data, dir]
        [0, stor, 0],
        [1, s2p,  0],
        [2, s3p,  1],
        [3, s5p,  0],
        [4, s5p,  1],
        [5, s3p,  0],
        [6, s2p,  1],
        [7, stor, 1]
    ];

    for(temp=sdata)
    {
        i= temp[0];
        data= temp[1];
        dir= temp[2];
        ls= data[0][1];
        le= data[len(data)-1][1];
        echo("Stange:",le-ls);

        //for animation
        a=(i<($t*8)&&(i+1)>=($t*8))?($t*800%100/100):0;
        d=a<0.25?a*2:(a<0.5?1-a*2:(a<0.75?1-a*2:a*2-2));
        dy=d*( 680*s + data[1][1]*2-20);
        
        translate([-3.5*ass+ass*i,0,sh*s+afs+asf])
        {
            color(dir?"red":"blue")
            for(m=[0,1])
            mirror([0,m,0])
            translate([0,680*s/2+wood_d,0])
            color("black")
                load("lager");

            translate([0,dy,0])
            color("Silver")
            rotate([dir?-90:90,0,0])
            translate([0,0,ls])
                cylinder(d=16,h=le-ls);
            
            for(temp2=data)
            {
                modules= temp2[0];
                pos= temp2[1];
                
                rotate([0,d*45,0]) //for animation
                translate([0,dy,0]) //for animation
                translate([0,(dir?1:-1)*pos,0])
                    renderfigure(modules,dir);
            }
        }
    }

    *color("white")
    translate([0,0,32/2+3])
        sphere(d=32, $fn=20);

    //Tor
    for(m=[0,1])
    color(m?"blue":"red")
    mirror([m,0,0])
    translate([1200*s/2,0,3])
        load("tor");

    //Ballausgabe 300/100
    for(m=[0,1])
    color(m?"blue":"red")
    mirror([m,0,0])
    translate([1200*s/2+ablage,0,-kastenh/2+wood_d])
        load("ausgabe");

    //Balleinwurf aussen
    for(m=[0,1])
    color(m?"red":"blue")
    mirror([0,m,0])
    translate([0,680*s/2,beh])
        load("einwurf");
        
   //counter
    for(m=[0,1])
    color(m?"blue":"red")
    mirror([m,0,0])
    translate([1200*s/2+ablage/2,0,kastenh/2])
        load("counter");
}

FIGUR=1;
BUFFER=2;
GRIFF=3;
STOPPER=4;
ENDCAP=5;
module renderfigure(modules, dir)
{
    //Figure
    if (modules == FIGUR && dir == 0)
    color(dir?"red":"blue")
    translate([0,0,0])
        load("figuren_0");
    if (modules == FIGUR && dir == 1)
    color(dir?"red":"blue")
    translate([0,0,0])
    rotate([0,0,180])
        load("figuren_1");
    //Buffer
    if (modules == BUFFER)
    color("black")
    rotate([90,0,0])
    translate([0,0,-18/2])
        cylinder(d=30,h=18);    
    //Griff
    if (modules == GRIFF)
    color(dir?"red":"blue")
    rotate([dir?180:0,0,0])
    translate([0,-180*s+6,0])
        load("griff");
    //Stopper
    if(modules == STOPPER)
    color(dir?"red":"blue")
        load("stopper");
    //endcap
    if(modules == ENDCAP)
    color(dir?"red":"blue")
    rotate([dir?0:-180,0,0])
        load("endcap");
}

module load(name)
{
    if(usestl)
        import(str(name,".stl"));
    else
    {
        if(name == "feld_0")
            feld(0);
        if(name == "feld_1")
            feld(1);
        if(name == "lager")
            lager(0);
        if(name == "lager")
            lager(1);
        if(name == "griff")
            griff();
        if(name == "stopper")
            stopper();
        if(name == "figuren_0")
            figuren(0);
        if(name == "figuren_1")
            figuren(1);
        if(name == "stopper")
            stopper();
        if(name == "endcap")
            endcap();
        if(name == "lager")
            lager();
        if(name == "tor")
            tor();
        if(name == "ausgabe")
            ausgabe();
        if(name == "einwurf")
            einwurf();
    }
}   


module wood(c)
{
    if (c[0]==wood_d) {echo(c[1],c[2],c[1]*c[2]/1000000);}
    else if (c[1]==wood_d) echo(c[0],c[2],c[0]*c[2]/1000000);
    else if (c[2]==wood_d) echo(c[0],c[1],c[0]*c[1]/1000000);
    else assert(false, "At least one side of the wood need to be wood_d!");
    color("Khaki")
        cube(c);
}

