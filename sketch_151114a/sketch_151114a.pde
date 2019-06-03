int diax=200;
int diay=400;
int num = 500;
int shootscore = 0;
int s=0;
int up=1, down=0;
PImage img;
PImage img2;
PImage car;
PImage peo;
PImage clo;
PImage sun;
PImage title;
float x = 900;
float xx = 1000;
float a = -100;
Gar[]  gar;
Bull[] bull;
int score;
int lose = 0;
int start=0;
int j;
void setup(){
  size(800, 600);
  smooth();
  img = loadImage("di.png");
  img2 = loadImage("house.jpg");
  car = loadImage("car.jpg");
  peo = loadImage("people.jpg");
  clo = loadImage("yun.png");
  sun = loadImage("sun.png");
  title = loadImage("title.jpg");
  
  gar = new Gar[500];
  for ( int i = 0; i<500; i++){
    gar[i] = new Gar();
  }
  bull = new Bull[num];
for(int i=0; i<num; i++){
  bull[i] = new Bull();
}
}
void draw(){

  if(lose==0 && start == 0){
    
    background(255);
    image(title,160,80);
    textSize(50);
    fill(0, 255, 0);
    rect(300, 450, 200, 100);
    fill(0,0,0);
     text("START",320,530);
    if(mousePressed == true && mouseX>300 && mouseX<550 && mouseY>450 && mouseY<550){
      image(img,a,400);
      a += 10;
      if(a == 1000)
      start = 1;
    }
    else a=0;
  }
  
  if(lose==0 && start==1){
    background(255);
    fill(0);
    rect(0, 450, 800, 1);
    gar[0].show = true;
    gar[0].display();
    if(keyPressed == true && key == 'a' && s==0){
      bull[s].sett(diax+70, diay+25, true);
      s++;
    }
    if(keyPressed == true && key == 'a' && s!=0 && bull[s-1].live == false && bull[s-1].x<320){
      bull[s].sett(diax+70, diay+25, true);
      s++;
    }
  if(keyPressed == true && key == 'a' && bull[s-1].x>320 && s!=0){
      bull[s].sett(diax+70, diay+25, true);
      s++;
    }

  for ( j = 1; j<500; j++){
    if(gar[j-1].x < 700){
      gar[j].show = true;
    }
      gar[j].display();
  }
   x -= 5;
    image(clo,x,50);
    if(x<-50){
      x = 900;
    }
     xx -= 10;
    image(clo,xx,100);
    if(xx<-100){
      xx = 1000;
    }
  image(sun,730,20);
  fill(0);
  image(img,diax,diay);
  score += 1;
  if(mousePressed == true && mouseButton == LEFT){
    up=1;
  }
  for(int i=0; i<num; i++){
        bull[i].shoot();
        bull[i].front();
    }
  
  if(down==1)up=0;
  if(diay>=150 && diay<=400 && up==1) diay-=10;
  if(diay>=150 && diay<=400 && down==1) diay+=10;
  if(diay == 150){
      up = 0;
      down=1;
    }
  if(diay == 400)down=0;
  textSize(24);
  score = (-(gar[0].x)+1000)/10;
  text("SCORE: "+score, 20, 20);
  textSize(24);
  text("Enemy Hit Score: "+shootscore, 20, 50);
  for(int i = 0; i<500; i++){
    if((diax==gar[i].x || diax+50==gar[i].x )&& diay+50>gar[i].y){
      lose = 1;
      start = 0;
    }
  }
  for(int i=0; i<num; i++){
  for(int j=0; j<num; j++){
    if(gar[j].kind <= 2 && gar[j].kind > 1.2 && gar[i].show == true&& bull[i].y>gar[j].y && bull[i].y<gar[j].y+60 && (bull[i].x == gar[j].x || bull[i].x == gar[j].x+1 || bull[i].x == gar[j].x+2 || bull[i].x == gar[j].x+3 || bull[i].x == gar[j].x+4 || bull[i].x == gar[j].x+5)){
      gar[j].live = false;
      bull[i].live = false;
      gar[j].x = -100;
      gar[j].y = -100;
      bull[i].y = 0;
      bull[i].x = -100;
      shootscore +=50;
    }
  }
}
for(int i=0; i<num; i++){
  for(int j=0; j<num; j++){
    if(gar[j].kind <= 1.2 && gar[j].kind > 0.6 && gar[i].show == true&& bull[i].y>gar[j].y && bull[i].y<gar[j].y+109 && (bull[i].x == gar[j].x || bull[i].x == gar[j].x+1 || bull[i].x == gar[j].x+2 || bull[i].x == gar[j].x+3 || bull[i].x == gar[j].x+4 || bull[i].x == gar[j].x+5)){
      bull[i].live = false;
      bull[i].y = 0;
      bull[i].x = -100;
    }
  }
}
for(int i=0; i<num; i++){
  for(int j=0; j<num; j++){
    if(gar[j].kind < 0.6 && gar[i].show == true&& bull[i].y>gar[j].y && bull[i].y<gar[j].y+93 && (bull[i].x == gar[j].x || bull[i].x == gar[j].x+1 || bull[i].x == gar[j].x+2 || bull[i].x == gar[j].x+3 || bull[i].x == gar[j].x+4 || bull[i].x == gar[j].x+5)){
      bull[i].live = false;
      bull[i].y = 0;
      bull[i].x = -100;
    }
  }
}
  }
  if(lose==1 && start==0) {
    background(255);
    textSize(40);
    text("YOU LOSE", 285, 250);
    textSize(40);
    text("YOUR TOTAL SCORE: "+(score+shootscore), 160, 350); 
    fill(0, 255, 0);
    rect(300, 450, 200, 100);
    fill(0,0,0);
    text("Again",325,530);
    if(mousePressed == true && mouseButton == LEFT && mouseX>200 && mouseX<500 && mouseY>450 && mouseY<550){
      lose = 0;
      start = 0;
      score = 0;
      shootscore = 0;
      for ( int i = 0; i<500; i++){
    gar[i] = new Gar();
  }
  bull = new Bull[num];
for(int i=0; i<num; i++){
  bull[i] = new Bull();
}
    }
  }
}

class Gar{
  int x=1000, y;
  boolean show = false;
  boolean live = true;
  float kind = random(0, 2);
  void display(){
  if(kind >= 0 && kind <=0.6 && show == true && live == true){
    y=350;  
    fill(0);
      image(img2,x,y);
      x -= 5; 
    }
  if(kind <= 1.2 && kind > 0.6 && show == true && live == true){
    y=400; 
    fill(0);
     image(car,x,y);
     x -= 5; 
   }
   if(kind <= 2 && kind > 1.2 && show == true && live == true){
     y=413;
     fill(0);
     image(peo,x,y);
     x -= 5; 
   }
  }
}

class Bull{
  float x, y;
  boolean live = false;
  void sett(float xx, float yy, boolean zz){
    x = xx;
    y = yy;
    live = zz;
  }
  void shoot(){
    if(live == true){
      fill(0);
      ellipse(x, y, 20, 20);
    }
  }
  void front(){
    if(live == true){
      x++;
    }
    if(y>800)live = false;
  }
}