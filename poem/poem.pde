StringList poem;
PFont font;
boolean lines = false; //check where mouse is to advance the lines of the poem
float timer = 0; 
float a = 0.0;
int appear = 10; //how long we want them to wait before it goes, prob should disappear after a while or something?

void setup() {
  size(900, 900);
  background(100);
  poem = new StringList("IT  WAS BAD ENOUGH YOU HEARD", "ME SING IN THE SHOWER", "BUT THEN YOU HEARD", "ME SAY YOUR NAME IN MY SLEEP", "I’M STILL EMBARRASSED OVER", "HOW I WOKE UP AND INSTINCTIVELY", "SAID I LOVE YOU", "PLEASE DON’T JUDGE ME", "FOR KNOWING HOW I FEEL", "I PROMISE I WILL NEVER", "MAKE THAT MISTAKE AGAIN");
  font = createFont("cityburn", 30);
  textFont(font);
  fill(0);
  textAlign(CENTER);
}

void timeAdvance() {
  if (mouseX < 300) { // in future cases it'd be the ellipse tracker
    timer += 1;
    println("timer: " + timer);
    if (timer >appear){
      a+= .005;
     //the goal is to make the lines appear bit by bit, so maybe the fill opacity increases 
    }
  }else {
    timer = 0;
    println("timer reset: " + timer);
  }

}

void lineByLine(){
  
}

void draw() {
  timeAdvance();
//  line(mouseX, 20, mouseX, 80);  
  for (int i = 0; i < poem.size(); i++) {
    String item = poem.get(i);
    fill(random(10,50),0,0,a);
    text(item, 300, 200+25*i);  //timer value  can still be accessed anywhere
  }
  //  rect(pmouseX, pmouseY, 100,100);
}