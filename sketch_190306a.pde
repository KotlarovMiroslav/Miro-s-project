int a = 300;
int a1 = 550;
int fire = a;
int fire1 = a1;
int fireX = 0;
float enemy = 300;
float enemy1 = 200;
int r = 5;
PImage img;
float fireR = random(1, 10);
int enemyR = 80; 
int score = 0;
int lives = 5;
boolean defeat = false;
int speed = 5;
int money = 0;

void setup() {
  size (600, 600);
  img = loadImage("img.jpg");
}

void draw() {
  background(255);
  image(img, mouseX - 61, a1 - 50, img.width/2, img.height/2);
  if (mousePressed) {
    fire1 = height - 20;
    fireX = mouseX;
  }
  fill(255, 0, 0);
  if (fire1 > -10) {
    fire1 -= 7;
  }

  ellipse(fireX, fire1, fireR, r*2);
  fill(129, 129, 129);
  ellipse(enemy, enemy1, enemyR, enemyR);
  enemy1 = enemy1 + speed;
  fill(0, 255, 0);
  ellipse(enemy, enemy1, enemyR/2, enemyR/2);

  if (enemy1 > 600) {
    enemy = random(10, 600);
    enemy1 = 100;
    enemy1 = enemy1 + random(2, 5);
    lives = lives - 1;
  } 

  if (dist(fireX, fire1, enemy, enemy1) < fireR + enemyR/2) {
    enemy = random(10, 600);
    enemy1 = - 5;
    enemy1 = enemy1 + speed + 5;
    score = score + 200;
    money++;
  }
  textSize(32);
  {
    fill(0);
    text("Score ="+ score, -1, 100 );
  }
  textSize(32);
  {
    fill(0);
    text("Lives ="+lives, 459, 100);
  }
  textSize(32);
  {
    fill(0);
    text("Cores ="+money, -1, 200);
  }

  if (lives == 0) {
    background(0);
    textSize(20);
    {
      fill(255, 0, 0);
      text("Hello There!...Welcome to Hell", 150, 300 );
      noLoop();
    }
  }
}
