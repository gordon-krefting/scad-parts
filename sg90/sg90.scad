module sg90(center_on_gear = false) {
  v = center_on_gear ? [-5.5, 0, -26.5] : [0, 0, 0];
  
  translate(v) {
    color("blue") difference() {
      union() {
        translate([0,0,22.5/2]) cube([22.5,12.2,22.5], center=true);
        translate([0,0,16.75]) cube([32.2,12.2,2], center=true);

        translate([0,0,22.5-1]) {
          hull() {
            translate([-1,0,0]) cylinder(d=5.5, h=4+1);
            translate([1,0,0]) cylinder(d=5.5, h=4+1);
          }

          translate([5.5,0,0]) cylinder(d=11.6, h=4+1);
        }

      } 

      translate([-32.5/2+2,0,16.75-2]) {
        cylinder(d=2, h=2+2);
        translate([-2,0,2]) cube([4,1,2+2], center=true);
      }
      translate([32.5/2-2,0,16.75-2]) {
        cylinder(d=2, h=2+2);
        translate([2,0,2]) cube([4,1,2+2], center=true);
      }
    }
    color("white") translate([5.5,0,22.5-1+4]) {
      difference() {
        cylinder(d=4.8, h=3+1);
        translate([0,0,1]) cylinder(d=2, h=4);
      }
    }
  }
}

module sg90_arm1() {
  color("white") difference() {

    union() {
      linear_extrude(height=1.4)
        difference() {

          hull() {
            circle(d=6);
            translate([14,0]) circle(d=4);
          }

          translate([4,0]) for (i=[0:5]) translate([i*2,0]) circle(d=1);

        }

      cylinder(d=6.7, h=3.8);
    }


    //Extend 1mm in each open direction to prevent surfaces from being inside of each other
    translate([0,0,-1]) cylinder(d=2.5, h=3.8+2);
    translate([0,0,-1]) cylinder(d=4.7, h=1+1); 
    translate([0,0,3.8-2+1]) cylinder(d=4.7, h=2+1);  

  }
}

module sg90_arm2() {
  color("white") difference() {

    union() {
      linear_extrude(height=1.4)
        difference() {

          hull() {
            circle(d=6);
            translate([14,0]) circle(d=4);
            translate([-14,0]) circle(d=4);
          }

          for (i=[0:5]) {
            translate([4+i*2,0]) circle(d=1);
            translate([-4-i*2,0]) circle(d=1);
          }

        }

      cylinder(d=6.7, h=3.8);
    }


    //Extend 1mm in each open direction to prevent surfaces from being inside of each other
    translate([0,0,-1]) cylinder(d=2.5, h=3.8+2);
    translate([0,0,-1]) cylinder(d=4.7, h=1+1); 
    translate([0,0,3.8-2+1]) cylinder(d=4.7, h=2+1);  

  }
}

module sg90_arm3() {
  color("white") difference() {

    union() {
      linear_extrude(height=1.4)
        difference() {

          union() {

            hull() {
              circle(d=6);
              translate([14,0]) circle(d=4);
            }

            hull() {
              translate([0,-6]) circle(d=3.8);
              translate([0,6]) circle(d=3.8);
            }


            hull() {
              circle(d=7);
              translate([-17,0]) circle(d=4);
            }
          }

          for (i=[0:5]) translate([4+i*2,0]) circle(d=1);         
          for (i=[0:6]) translate([-5-i*2,0]) circle(d=1);

          for (i=[0:1]) {
            translate([0,4+i*2]) circle(d=1);
            translate([0,-4-i*2]) circle(d=1);
          }

        }

      cylinder(d=6.7, h=3.8);
    }


    //Extend 1mm in each open direction to prevent surfaces from being inside of each other
    translate([0,0,-1]) cylinder(d=2.5, h=3.8+2);
    translate([0,0,-1]) cylinder(d=4.7, h=1+1); 
    translate([0,0,3.8-2+1]) cylinder(d=4.7, h=2+1);  

  }
}


