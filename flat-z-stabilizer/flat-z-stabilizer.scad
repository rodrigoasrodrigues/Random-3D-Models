
screw=8;
screw_length=screw*2;
height=2;
length=screw*5;
width=screw*2;
zip_w=1.5;
zip_l=4;
fit_margin=1;

module piece(){
difference(){
    cube([width,length,height]);
    translate([width/2-screw/2,0,0])
    cube([screw,screw_length,height+1]);
    
    //screw cuts
    translate([width-screw/2,length-screw_length,0])
    cube([screw,screw_length,height+1]);
    translate([-screw/2,length-screw_length,0])
    cube([screw,screw_length,height+1]);
    
    //zip ties
    translate([screw/6,screw_length/2,0])
    cube([zip_w,zip_l,height+1]);
    translate([width-screw/6-zip_w,screw_length/2,0])
    cube([zip_w,zip_l,height+1]);
    // upper zip ties
    translate([screw/2-zip_w/2,length-screw_length,0])
    cube([zip_w,zip_l,height+1]);
    translate([screw*3/2-zip_w/2,length-screw_length,0])
    cube([zip_w,zip_l,height+1]);
}}

difference(){
piece();
translate([width/2-height/2,screw_length,0])
cube([height,(length-screw_length)/2+fit_margin,10]);
}

translate([20,0,0])

difference(){
piece();
translate([width/2-height/2,length-(length-screw_length)/2,0])
cube([height,(length-screw_length)/2,10]);
}