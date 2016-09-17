//notice:the module has a little interspace with each other

module ball_head_element()
{
    translate([0,0,-0.52])//change the head's position
        rotate([180,0,0])
            color("RED")
                    difference()
                        {
                            sphere(r=15,$fn=56);
                            translate([0,0,-1])//change the Z-AXIS length
                                cylinder(r=25,h=20);
                            translate([0,0,-0.5])//change the hole's r
                                rotate([0,90,0])
                                    color("black")
                                        cylinder(r=4,$fn=48,h=30,center=false);
                        }
    
}

module ball_downhead_element()
{
    translate([0,0,-0.5])//change the down head's position
        color("WHITE")
            difference()
            {
                sphere(r=15,$fn=56);
                translate([0,0,-1])
                    cylinder(r=25,h=20);
                translate([0,0,-0.5])
                    rotate([0,90,0])
                        color("black")
                            cylinder(r=4,$fn=48,h=30,center=false);
                
            }
}

module ball_waist_element()
{
    color("black")  //.....................
        cylinder(r=14,h=2,center=true);
    translate([0,0,0])
           {
               cylinder_kai();
               mirror([0,0,1])
                    cylinder_kai();
           }
    
}

module cylinder_kai()
{
    cubewidth=9;
        translate([0.9,0,0])
            color("black")//the Z-axis can change the black circle's position
                rotate([0,90,0])
                    difference()
                    {
                        cylinder(r=4.4,$fn=48,h=12.8,center=false);
                        translate([-0.5,-cubewidth/2,-1])  //the x's number can be change the circle's bottomline
                            cube([9,cubewidth,16],center=false);
                    }//upper circle & dower circle
    translate([13.5, 0,0])
        rotate([0,90,0])
            color("white")
                {
                    cylinder(center=false,r=3,$fn=48,h=1);
                    translate([0,0,1])
                        cylinder(r=2,$fn=48,h=0.7);
                }
}

module pokeball_hook()
{
    translate([-1.5,0,15])// the x_axis is the rotate and follow the extrude.
        rotate([0,90,0])
            linear_extrude(3)
                difference()
                {
                    circle(r=8,$fn=48,center=true);
                    circle(r=6,$fn=48,center=true);
                }
}

module pokeball()
{
    //do something to translate;
    {
        ball_head_element();
        translate([0,0,-0.5])
            ball_waist_element();
        ball_downhead_element();
        pokeball_hook();
    }
}

//----------------under the line is put module to the map;

    pokeball();






//----------------------------------under the line is test field.

                            
