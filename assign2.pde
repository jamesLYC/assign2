int m = 0;
int n = -640;
float enemyx = 0;
float enemyy = 240;
float k = random(0,599);
float s = random(0,439);
float l = 38;
float fighterx = 589;
float fightery = 240;
float speed = 5;
boolean GameState;
boolean GameOver;
boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;
boolean heal;
PImage bg1;
PImage bg2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage start;
PImage end;


void setup () {
  size(640, 480) ;
   bg2 = loadImage("img/bg2.png");
   bg1 = loadImage("img/bg1.png");
   enemy = loadImage("img/enemy.png");
   fighter = loadImage("img/fighter.png");
   hp = loadImage("img/hp.png");
   treasure = loadImage("img/treasure.png");
   start = loadImage("img/start2.png");
   end = loadImage("img/end2.png");
   GameState = false;
   GameOver = false;
   heal = false;
}

void draw() {
  image(bg2,m,0);
  image(bg1,n,0);
  image(enemy,enemyx,enemyy);
  image(fighter,fighterx,fightery);
  fill(225,0,0);
  rect(13,5,l,15);
  image(hp,0,0);
  image(treasure,k,s);
  if(GameState == false){
    image(start,0,0);
    enemyx = 0;
  }

  if(upPressed){
    fightery -= speed;;
  }
  if(downPressed){
    fightery += speed;
  }
  if(leftPressed){
    fighterx -= speed;
  }
  if(rightPressed){
    fighterx += speed;
  }
  if (fighterx > width){
    fighterx = 0;
  }
  if (fighterx < 0){
    fighterx = width;
  }
  if (fightery > height){
    fightery = 0;
  }
  if (fightery < 0){
   fightery = height;
  }
  if(m > 640){
    m = 0;
  }
   if(GameOver == true){
    image(end,0,0);
    fighterx = 589;
    fightery = 240;
    enemyx = 0;
    enemyy = 240;
    l = 38;
    m = 0;
    n = -640;
   }
  if(enemyx-fighterx<=61&&enemyx-fighterx>=-61&&enemyy-fightery<=61&&enemyy-fightery>=-61){
    enemyx = 0;
    enemyy = 240;
    l = l-38;
  }
  if(k-fighterx<=41&&k-fighterx>=-41&&s-fightery<=41&&s-fightery>=-41){
    k = random(0,599);
    s = random(0,439);  
    l = l+19;
  }
  if(l > 190){
    l = 190;
  }
  if(l <= 0){
  GameOver = true;
  }
  m++;
  n++;
  while(m>640){
    m = -640;
  }
  while(n>640){
    n = -640;
  }
  enemyx+=4;
  if(fightery > enemyy){
  enemyy += 3.5;
  }
  if(fightery < enemyy){
  enemyy -= 3.5;
  }
  if (enemyx > 640){
    enemyx = 0;
    enemyy = 240;
  }
  if (enemyy > 480){
    enemyx = 0;
    enemyy = 240;
  }
  if (enemyy < -61){
    enemyx = 0;
    enemyy = 240;
  }
}
void keyPressed(){
  GameState = true;
  GameOver = false;
  if (key == CODED){
    switch(keyCode){
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
}
}
void keyReleased(){
    if (key == CODED){
    switch(keyCode){
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
      }
      }
}
