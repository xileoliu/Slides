/**
 * Sequential
 * by James Patterson.  
 * 
 * Displaying a sequence of images creates the illusion of motion. 
 * Twelve images are loaded and each is displayed individually in a loop. 
 */

int numFrames = 6;  // The number of frames in the animation
int frame = 0;

PImage[] images = new PImage[numFrames];

float offsetX = 0;
float easing = 0.25;
float imgX;
boolean locked = false;
boolean next = false;
boolean prev = false;

float dx = 0;
float targetX = 0;

//ParticleSystem ps;

void setup() {
  size(713, 800);
  //background(0);
  imgX = width/2;
  imageMode(CENTER);

  images[0]  = loadImage("0.png");
  images[1]  = loadImage("1.png");
  images[2]  = loadImage("2.png"); 
  images[3]  = loadImage("3.png");
  images[4]  = loadImage("4.png"); 
  images[5]  = loadImage("5.png");

  image(images[0], width/2, height/2, 713, 800);


  // If you don't want to load each image separately
  // and you know how many frames you have, you
  // can create the filenames as the program runs.
  // The nf() command does number formatting, which will
  // ensure that the number is (in this case) 4 digits.
  //for(int i=0; i<numFrames; i++) {
  //  String imageName = "PT_anim" + nf(i, 4) + ".gif";
  //  images[i] = loadImage(imageName);
  //}

  //  ps = new ParticleSystem(new PVect
} 

void draw() 
{ 
  background(0);
  frame = (frame) % numFrames;  // Use % to cycle through frames
  int frameP = frame - 1;
  int frameN = frame + 1;
  if (imgX > width/2) {
    if (frameP == -1) {
      frameP = numFrames-1;
    }
    tint (255, 255);
    image(images[frameP], width/2, height/2, 713, 800);
  } else {
    if (frameN == numFrames) {
      frameN = 0;
    }
    tint (255, 255);
    image(images[frameN], width/2, height/2, 713, 800);
  }
  //tint (255, 127);
  if (locked) {
    targetX = mouseX - offsetX;
    dx = targetX - imgX;
    imgX += dx * easing;
    tint (255, 127);
    image(images[frame], imgX, height/2, 713, 800);
  } else if (!next && !prev) {
    //next = false; //<>//
    //prev = false;
    targetX = width/2; //<>//
    dx = targetX - imgX;
    imgX += dx * easing;
    tint (255, 255);
    image(images[frame], imgX, height/2, 713, 800);
  } else { //<>//
    imgX = width/2;
  }

  ////Overlay trasparent image
  //float dx = (mouseX-images[frame].width/2) - offset;
  //offset += dx * easing; 
  //tint(255, 127);  // Display at half opacity
  //image(images[frame], offset, 0);


  text(frame+1, imgX, 20);
  //if (mouseX>width*9/10) {
  //  noStroke();
  //  fill(255, 63);
  //  rect(width*9/10, 0, width/10, height);
  //}
  //if (mouseX<width/10) {
  //  noStroke();
  //  fill(255, 63);
  //  rect(0, 0, width/10, height);
  //}
}

void mousePressed() {
  //if (mouseX<width*9/10) {
  //  locked = true;
  //} else {
  //  locked = false;
  //}
  locked = true;
  offsetX = mouseX - imgX;
  //targetX = mouseX - offsetX;
  //if (mouseX>width*9/10) {
  //  nextImage();
  //}
  //if (mouseX<width/10) {
  //  prevImage();
  //}
}

/*void mouseDragged() {
 if (locked) {
 imgX = mouseX-offsetX;
 }
 if (mouseX<width/10 || mouseX>width*9/10) {
 //tint(255, 127);
 } else {
 //tint(255, 255);
 }
 //background(0);
 //dx = (mouseX-images[frame].width/2) - xoffset;
 //xoffset += dx * easing; 
 ////tint(255, 127);  // Display at half opacity
 //image(images[frame], xoffset, 0);
 //if (mouseX>width*9/10) {
 //  nextImage();
 //  locked = false;
 //}
 //if (mouseX<width/10) {
 //  prevImage();
 //  locked = false;
 //}
 }*/

void mouseReleased() {
  locked = false;
  if (mouseX > width*9/10) {
    next = true;
    nextImage();
  } else if (mouseX < width/10) {
    prev = true;
    prevImage();
  }
  //imgX = width/2;
  //tint(255, 255);
}

void nextImage() {
  if (frame<6)
  { 
    frame++;
  } else frame = 0;
}

void prevImage() {
  if (frame>0)
  { 
    frame--;
  } else frame = 5;
}