spindleD = 24;
spindleH = 6.5;
bladeLength = 14;

module spindle() {
difference() {
    cylinder(d=spindleD, h= spindleH, $fn=6, center=true);
    cylinder(d=spindleD*0.86, h= spindleH*2, $fn=6, center=true);
    }
}

module fanBlade() {
linear_extrude(height = bladeLength, center = true, convexity = 10, twist = 50) square([2.5, spindleH], center=true);
}

module fanBlades() {
union() {
spindle();
translate([bladeLength*0.76,0,0])rotate(a=[0,90,180]) fanBlade();
translate([-bladeLength*0.76,0,0])rotate(a=[0,90,0]) fanBlade();
translate([0,bladeLength*0.76,0])rotate(a=[90,90,0]) fanBlade();
translate([0,-bladeLength*0.76,0])rotate(a=[90,90,180]) fanBlade();
    
// middle blades

translate([bladeLength*0.55,bladeLength*0.6,0])rotate(a=[-50,90,180]) fanBlade();
translate([-bladeLength*0.55,bladeLength*0.6,0])rotate(a=[55,90,0]) fanBlade();
translate([bladeLength*0.55,-bladeLength*0.6,0])rotate(a=[60,90,180]) fanBlade();
translate([-bladeLength*0.55,-bladeLength*0.6,0])rotate(a=[-60,90,0]) fanBlade();
    
/*    
translate([-bladeLength*0.76,0,0])rotate(a=[0,90,0]) fanBlade();
translate([0,bladeLength*0.76,0])rotate(a=[90,90,0]) fanBlade();
translate([0,-bladeLength*0.76,0])rotate(a=[90,90,180]) fanBlade();    
    
    */
    }
}

module fan() {
difference() {
    fanBlades();
    cylinder(d=spindleD*0.86, h= spindleH, $fn=6, center=true);
    }
}

fan();
    