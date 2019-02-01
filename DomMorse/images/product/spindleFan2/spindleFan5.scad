spindleD = 23.5;
spindleH = 6.5;
bladeLength = 8;

module fanNut() {
    cylinder(d=spindleD, h= spindleH, $fn=6, center=true);
}

module fanNutHole() {
    cylinder(d=spindleD*0.86, h= spindleH*2, $fn=6, center=true);
}

module fanBlade() {
linear_extrude(height = bladeLength, center = true, convexity = 10, twist = 70) square([2.5, spindleH*.9], center=true);
}

module fanBlades() {
union() {
fanNut();
translate([bladeLength*1.25,0,0])rotate(a=[0,90,180]) fanBlade();
translate([-bladeLength*1.25,0,0])rotate(a=[0,90,0]) fanBlade();
translate([0,bladeLength*1.25,0])rotate(a=[90,90,0]) fanBlade();
translate([0,-bladeLength*1.25,0])rotate(a=[90,90,180]) fanBlade();
    
// middle blades

translate([bladeLength*0.85,bladeLength*1,0])rotate(a=[-50,90,180]) fanBlade();
translate([-bladeLength*0.85,bladeLength*1,0])rotate(a=[55,90,0]) fanBlade();
translate([bladeLength*0.85,-bladeLength*1,0])rotate(a=[60,90,180]) fanBlade();
translate([-bladeLength*0.85,-bladeLength*1,0])rotate(a=[-60,90,0]) fanBlade();
    }
}

module fan() {
difference() {
    fanBlades();
    fanNutHole();
    }
}

fan();
    