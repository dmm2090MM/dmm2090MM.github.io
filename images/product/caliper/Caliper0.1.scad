measL=150;
measW=20;
caliperH=3;

module mm() {
    cube([.25, 5, 1], center = true);
}

module headShape() {
    hull() {
rotate(a=[0,0,45]) cube([13,13,caliperH*1.5], center=true);
translate([26.5,0,0]) cube([28,28,caliperH*1.5], center=true);
    }
} 

module headHalf() {
difference() {
headShape();
translate([measL*0.33,-measW*0.5,0]) cube([measL,measW,caliperH*1.5], center=true);
    }
}

module measure() {
difference () {
translate([measL*0.5,0,0]) cube([measL,measW,caliperH], center=true);
//translate([measL*0.5,measW*0.3,caliperH*-0.2]) cube([measL,measW*0.15,caliperH*0.8],center=true);
translate([measL*0.5,0,caliperH*-0.2]) cube([measL,measW*0.3,caliperH*0.6],center=true);


for (x = [1:1:measL])
    translate([x,0,caliperH*0.4]) {mm();}


for(i  = [ [0, 0, 2],
          [10, 0, 2],
          [20, 0, 2],
          [30, 0, 2],
          [40, 0, 2],
          [50, 0, 2], 
          [60, 0, 2],
          [70, 0, 2],
          [80, 0, 2],
          [90, 0, 2],
          [100, 0, 2],
          [110, 0, 2],
          [120, 0, 2],
          [130, 0, 2],
          [140, 0, 2],
          [150, 0, 2] ])
{
   translate(i)
   cube([0.5, 5, 1], center = true);
}
    
}
    }
 
module base() {
union() {    
translate([0,-30.5,0]) rotate(a=[0,0,90]) headHalf();
measure();    
    }
}    


module headBottom1() {
difference() {
    rotate([0,0,90]) headHalf();
    translate([-measL*0.25,measW*1.45,0]) cube([measL,measW,caliperH], center=true);
    }
}

module headBottom2() {
difference() {
    translate([0,-30.5,0]) rotate([180,0,90]) headHalf();
    translate([0,0,0]) cube([measL,measW*0.99,caliperH], center=true);
}
union() {
    //translate([measL*0.5,measW*0.3,caliperH*-0.2]) cube([measL,measW*0.15,caliperH*0.8],center=true);
    translate([measL*0.5,0,caliperH*-0.2]) cube([measL,measW*0.3,caliperH*0.6],center=true);
    }
}

module caliper() {
headBottom2();
translate([-10,30,0]) base();
}



module MuHS() {
linear_extrude(height=caliperH*0.33, center=true) translate([5,-30]) rotate(90) text("MuHS");
}

module caliperCustom() {
difference() {
caliper();
translate([0,0,caliperH*0.66]) MuHS();
    }
}

caliper();