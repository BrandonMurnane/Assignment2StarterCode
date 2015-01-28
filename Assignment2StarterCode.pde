/*
    DIT OOP Assignment 2 Starter Code
 =================================
 
 Loads player properties from an xml file
 See: https://github.com/skooter500/DT228-OOP 
 */
ArrayList<Player> players = new ArrayList();
ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Bullet> bullets  = new ArrayList();
boolean[] keys = new boolean[526];
int numCol = 15;
int lives=4;
int score=400;
boolean play=false;
char gameover;



void setup()
{
  size(800, 600);
  setUpPlayerControllers();
  background(0);
  generateEnemies();
  gameover='F';
  importHighscore();
  lives=4;
}

void draw()
{
  if (lives==0)
  {
    println("lives--");
    gameover='T';
    println("check1");
  }
  if (play==false)
  {
    //background(back);
    textAlign(CENTER, TOP);
    textSize(40);
    text("Press E to play", width/2, height/2-60);
    textSize(50);
    text("Controls", width/2, height/2);
    textSize(50);
    text("Right=D/L", width/2-60, height/2+60);
    text("Left=A/J", width/2, height/2+120);
    text("Shoot=E/U", width/2, height/2+180);
    for (Player player : players)
    {
      player.update();
      //player.display();
      player.hitCheck();
    }
  } else
  {
    if (gameover=='T');
    {
      background(0);
      println("check");
      textAlign(CENTER, TOP);
      textSize(50);
      fill(255, 0, 0);
      text("Your Score was", width/2, height/2);
      text("The Highscore is", width/2, height/2+120);
      fill(255, 102, 0);
      text("Game Over", width/2, height/2-60);
      text(score, width/2, height/2+60);//prints your score

      updateHighscore();//updates highscore
      text(highscore, width/2, height/2+180);//prints highscore
    }
    if (gameover=='F')
    {
      background(0);
      for (Player player : players)
      {
        player.update();
        player.display();
        player.hitCheck();
      }
      importHighscore();
      showLives();
      handleEnemies();
      handleBullets();
      if (frameCount%60==0)
      {
        score-=10;
      }
      println(gameover);
    }
  }
}




void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  return value.charAt(0);
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);

  for (int i = 0; i < children.length; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
    i
      , color(random(0, 255), random(0, 255), random(0, 255))
      , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = 550;
    players.add(p);
  }
}

void showLives() {
  for (int i = 0; i <= lives; i++) {
    fill(255);
    rect(width-40*i, 10, 30, 30);
  }
  println(lives);
}

void endgame()
{
}

void generateEnemies() {
  for (int i = 0; i < 30; i++) {
    float x = width*.1 + i%numCol*60;
    float y = 60 + int(i/numCol)*70 ;
    color colour=color(random(0, 255), random(0, 255), random(0, 255));
    enemies.add(new Enemy(x, y, colour));
  }
}
void handleEnemies() {
  for (int i = 0; i < enemies.size (); i++) {
    Enemy enemy = (Enemy) enemies.get(i);
    enemy.move();
    enemy.display();
    enemy.hitCheck();
    if (random(1) > .995) {
      enemy.shoot();
    }
  }
}

void handleBullets() {
  for (int i = 0; i < bullets.size (); i++) {
    Bullet b = (Bullet) bullets.get(i);
    b.move();
    b.display();
  }
}

