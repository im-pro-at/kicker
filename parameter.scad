// All in mm
sh=3; //Spielfeld höhe (this is a pre scal value! so in den end you will get sh*s!)
a=10; //Spielfeld winkel am rand
wood_d=19; //Holz dicke
echo(s_over);
s=0.8; //Scalling of the table! Tested for 0.8 (80%)!
ablage=138; 
kastenh=300*s;
afs=12*s; //Abstand figurende zu sielfeld
asf=72*s; //Abstand stangenmitte zu figurende
ass=150*s; //Abstand stagenmitte zu stangen mitte
abs=860; //Abstand boden zu stange mitte (will not be scalled by s)
beh=50; //Balleinwurf höhe (will not be scalled by s)
g_l=180*s; //Griff länge
t_b=205*s; //Tor breite
t_h=80*s;  //Tor höhe
//Ball is assumed to be 32 mm

//Mutter M3
play=0.2;
M3_nut_d=6.01+2*play;
M3_nut_w=5.5+2*play;
M3_nut_h=2.4+2*play;

//Fragments for cicles 
$fn=100;

