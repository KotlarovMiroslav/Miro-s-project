int a = 300; //променливи за img
int a1 = 550; //променливи за img
int fire = a; // променлива за лазерът (a = 300)
int fire1 = a1; //променлива за лазерът (важи и за двата кода)
int fireX = 0; // променлива която определя от къде се стреля)
float enemy = 300; // определя къде ще е ньчьлния прот. кораб
float enemy1 = 200; // определя къде ще е ньчьлния прот. кораб
int r = 5; // радиуса на лазера
PImage img; // главен кораб
float fireR = random(1, 10); //радиус на лазерът
int enemyR = 80; //радиус на противников кораб
int score = 0; // променлива която определя резултата
int lives = 5; //променлива която опридиля живота
boolean defeat = false; //*под разработка*
int speed = 5; // скорост на противника
int money = 0; //*под разработка*

void setup() {
  size (600, 600);
  img = loadImage("img.jpg"); // снимка
}

void draw() {
  background(255);
  image(img, mouseX - 61, a1 - 50, img.width/2, img.height/2); // местоположение на снимка
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

  if (enemy1 > 600) { //какво става след като противниковия кораб мине границата
    enemy = random(10, 600);
    enemy1 = 100;
    enemy1 = enemy1 + random(2, 5);
    lives = lives - 1;
  } 

  if (dist(fireX, fire1, enemy, enemy1) < fireR + enemyR/2) {//унищожаване на противниковия кораб
    enemy = random(10, 600);
    enemy1 = - 5;
    enemy1 = enemy1 + speed + 5;
    score = score + 200;
    money++;
  }
  textSize(32);
  {
    fill(0);
    text("Score ="+ score, -1, 100 );//резултат
  }
  textSize(32);
  {
    fill(0);
    text("Lives ="+lives, 459, 100);//животи
  }
  textSize(32);
  {
    fill(0);
    text("Cores ="+money, -1, 200);// *под разработка*
  }

  if (lives == 0) {//какво става когато животите са под нула
    background(0);
    textSize(20);
    {
      fill(255, 0, 0);
      text("Hello There!...Welcome to Hell", 150, 300 );
      noLoop();
    }
  }
}
