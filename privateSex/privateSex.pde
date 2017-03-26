import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;


Movie couchDr;
Movie bedDr;
int movieW = 400;
int movieH = 280;
int wid = 150;
float colA;
float colB;
Obscure obs;
Obscure obs2;
Obscure obs3;

void movieEvent(Movie couchDr) {
  couchDr.read();
}

void bedDrEvent(Movie bedDr) {
  bedDr.read();
}

void setup() {
  size(1000, 900);
  background(0);

  obs = new Obscure(movieW-wid, movieH-wid, wid, wid);
  obs2 = new Obscure(movieW-wid, movieH-wid, wid, wid);
  obs3 = new Obscure(movieW-wid, movieH-wid, wid, wid);

  couchDr = new Movie(this, "couchDr.mp4"); 
  bedDr = new Movie(this, "bedDr.mp4"); 

  couchDr.loop();
  bedDr.loop();
}


void draw() {
  // Step 5. Display movie.
  image(couchDr, 0, 0, movieW, movieH);
  image(bedDr, width/2, 0, movieW, movieH);
  float k = 1.0;
  k-=.5;

  if (mouseX <width/2) {
    colA = 200;
    colB=100;

    couchDr.play();
    couchDr.speed(1);
    bedDr.play();
  } else if (mouseX>width/2+40) {
    colA = 100;
    colB = 255;
    // couchDr.pause();
    bedDr.pause();
  } else {
    bedDr.play();
    couchDr.speed(k);
    println("k = " + k);
    obs.display();
    obs2.display();
    obs3.display();
  }


  fill(colA);
  rect(10, 200, 70, 60);
  fill(colB, 100, 10);
  rect(width/2+10, 200, 70, 60);
}

/**
 
 long bodyStamp;
 void setup(){
 }
 void draw(){
 if (kinect2.getNumofUsers() > 0){
 println("num of users" + getNumofUsers());
 if (bodySensed == true){
 bodyStamp = millis();  //specifically for saving some body stuff
 if millis() - bodyStamp > interval){  
 safeFrame(timestamp()+"_##.png"); //so u wouldnt have this bit
 
 }
 
 }
 *
 */