//StringList poem[] = {"It’s bad enough you heard me sing in the shower", "But then you heard me say your name in my sleep" /
//  "I’m still embarrassed over" /
//  "How I woke up and instinctively said I love you" / 
//  "Please don’t judge me for knowing how I feel" /
//  "But I will never make that mistake again"};

StringList inventory;

void setup() {
  size(200, 200);
  inventory = new StringList();
  inventory.append("coffee");
  inventory.append("flour");
  inventory.append("tea");
  println(inventory);
  noLoop();
  fill(0);
  textAlign(CENTER);
}

void draw() {
  String item = inventory.get(2);
  text(item, width/2, height/2);
}