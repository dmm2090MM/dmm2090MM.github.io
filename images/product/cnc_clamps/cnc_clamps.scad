basew = 85; 
basel = basew*0.3558; //30.25mm
topw = basew*.3137; //26.66mm
topl = basew*0.4854; //41.26mm

screwd = 6.25;
screwholeMove = (basew+topw+screwd)*.5; // 58.955mm
screwslideMoveL = -((basew*0.2863)+(screwd*.5)); // 27.4605mm
screwslideMoveR = ((basew*0.4528)+(screwd*.5)); // 41.613mm


module clampbase() {
union() {
    square([basew, basel], center=true);
    translate([(basew+topw)*.5,0]) square([topw, topl], center=true);
  }
}

module clampbaseRounded() {
    intersection() {
        clampbase();
        translate([66.1,topl*.43]) screwhole();
//adding rounded corners for top
    }
}

module screwhole() {
    circle(d=screwd, center=true);
}


module screwSlide() {
    hull() {
        translate([screwslideMoveL,0]) screwhole();
        translate([screwslideMoveR,0]) screwhole();
    }
}


module xcarveClamp() {
difference() {
    clampbase();
    translate([screwholeMove,0]) screwhole();
    screwSlide();
    }
}


xcarveClamp();

//clampbaseRounded();
