R=8;
plate=35;//plate high
square_l=150; square_w=40;
word_thickness=5;

module tag(plate,square_l,square_w,word_thickness)
{
   
    difference()
    {
        translate([0,0,plate/2])
        {
            linear_extrude(height=plate+0.2,center=true)
                square(size=[square_l,square_w],center=true);
            
        }
        rotate([90,0,0])
        translate([0,plate/2,square_w-word_thickness])
        { 
            linear_extrude(height=square_w,center=true)
                    text("万事屋銀ちゃん",font="Noto Sans CJK JP:style=Black",valign="center",halign="center",spacing=1.1);
        }
    }
   
    
}

module newarmstrong(R,height,plate)
{
    translate([0,0,height+4+plate])
        difference()
        {
            cylinder(h = 7, r1 = R+2, r2 = 6.67, center = false,$fn=48);
            
            cylinder(h = 7, r1 = R, r2 = 5.67, center = false,$fn=48);
        }
    translate([0,0,height+plate])
        difference()
        {
            cylinder(h=4,r1=R,r2=R+2,center=false,$fn=48);
            cylinder(h=4,r1=R-0.1,r2=R+2-0.1,center=false,$fn=48);
        }
        
    translate([0,0,plate])   
        difference()
        {
            cylinder(h = height, r1 = R, r2 = R, center = false,$fn=48);
            cylinder(h = height, r1 = R-0.1, r2 = R-0.1, center = false,$fn=48);
        }
    
        
};
module goldball(R,plate)
{
    module ball()
    {
        translate([5.6+R,0,0+R])
            sphere(R,$fn=80);
    }
    translate([0,0,plate])
    {
        ball();
        mirror([1,0,0])
            ball();
    }
    
}


color([188/254,198/254,204/254])
{
    newarmstrong(R,50,plate);
    goldball(R+1,plate);
    tag(plate,square_l,square_w,word_thickness);
}