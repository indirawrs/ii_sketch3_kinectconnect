/**
 Indira Ardolic from the library of
 Thomas Sanchez Lengeling.
 http://codigogenerativo.com/
 KinectPV2, Kinect for Windows v2 library for processing
 Depth  and infrared Test
 **/

import KinectPV2.*;

KinectPV2 kinect;
PImage img; 
int kwidth = KinectPV2.WIDTHDepth;
int kheight = KinectPV2.HEIGHTDepth;
float minThresh = 10; // 480;
float maxThresh = 573; //830;

void setup() {
  size(1024, 848, P3D);

  kinect = new KinectPV2(this);
  kinect.enableDepthImg(true);
  kinect.enableInfraredImg(true);
  kinect.enableInfraredLongExposureImg(true);
  kinect.init();

  img = createImage(2*kwidth, 2*kheight, RGB); //  img = createImage(kwidth, kheight, RGB);
}

void draw() {
  background(0);
  img.loadPixels();

  //obtain the depth frame, 8 bit gray scale format
  // image(kinect.getDepthImage(), 0, 0);

  //obtain the depth frame as strips of 256 gray scale values
  image(kinect.getDepth256Image(), 0, 0, width, height);// image(kinect.getDepth256Image(), 512, 0);
  //infrared data
  //  image(kinect.getInfraredImage(), 0, 424);
  // image(kinect.getInfraredLongExposureImage(), 0, 0, kwidth, kheight);

  //  int [] rawData256 = kinect.getRawDepth256Data();

  int [] rawData = kinect.getRawDepthData();

  float sumX = 0;
  float sumY = 0;
  float totalPixels = 0;

  for (int x = 0; x < KinectPV2.WIDTHDepth; x++) {
    for (int y = 0; y < KinectPV2.HEIGHTDepth; y++) {
      int offset = x +y * KinectPV2.WIDTHDepth;
      int d = rawData[offset];    //check how far away thing is

      if (d > minThresh && d < maxThresh ) { //&& x > 100
        img.pixels[offset*2] = color(0, 250, 250);//  img.pixels[x] = color(0, 250, 250);

        sumX += x;
        sumY += y;
        totalPixels++;
      } else {
        img.pixels[offset*2] = color(0);
      }
    }
  }
  img.updatePixels();
  image(img,0, 0);//image(0, 0, width, height); //

  float avgX = sumX / totalPixels;
  float avgY = sumY / totalPixels;
  fill(0, 0, 255);
  ellipse(avgX*2, avgY*2, 64, 64);


  //values for [0 - 256] strip

  stroke(255);
  text(frameRate, 50, height - 50);
}