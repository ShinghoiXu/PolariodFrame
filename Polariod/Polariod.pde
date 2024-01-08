color back;
int pixelGap = 20;
PImage img;
PGraphics mask;

void setup() {
  size(400, 500);
  colorMode(HSB, 360, 100, 100); 
  img = loadImage("profile.jpg");
  mask = createGraphics(img.width,img.height);
  mask.beginDraw();
  mask.ellipseMode(CENTER);
  mask.background(0);
  mask.noStroke();
  mask.fill(255);
  mask.smooth();
  mask.circle(img.width/2,img.height/2,min(img.width,img.height));
  mask.endDraw();
  imageMode(CENTER);
  img.mask(mask.get());
}

int hueReroll(int preHue){
  if(preHue>360) {return (preHue-360);}
    else if(preHue<0) {return (preHue+360);}
      else {return preHue;}
}

void draw() { 
  back = color(map(mouseX,0,width,0,360),100,100);
  noStroke();
  background(back);
  ellipseMode(CENTER);
  fill(hueReroll(int(hue(back))+360-29),100,82);
  circle(width/2,height*0.95f,width*0.97f);
  fill(hueReroll(int(hue(back))-43+88),74,74);
  for(int i = 0; i <= int(width/pixelGap); i++){
    rect(i*pixelGap+2,0,pixelGap/3,height);
  }
  fill(120,21,45);
  circle(width/2,height*0.4,width*0.86);
  image(img,width/2,height*0.4,width*0.86,width*0.86/img.width*img.height);
}

void keyPressed() {
  if (keyCode == 32) {    //press space key to save image
    saveFrame("PolariodFilterExport-####.jpg");
  }
}
