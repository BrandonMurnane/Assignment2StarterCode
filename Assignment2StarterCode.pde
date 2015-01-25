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
int numCol = 10;

void setup()
{
  size(500, 500);
  setUpPlayerControllers();
  background(0);
  generateEnemies();
}

void draw()
{
  background(0);
  for (Player player : players)
  {
    player.update();
    player.display();
  }
  handleEnemies();
  handleBullets();
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
    p.pos.y = 450;
    players.add(p);
  }
}

void generateEnemies() {
  for (int i = 0; i < 20; i++) {
    float x = width*.1 + i%numCol*60;
    float y = 60 + int(i/numCol)*70 ;
    color colour=color(random(0, 255), random(0, 255), random(0, 255));
    enemies.add(new Enemy(x, y,colour));
  }
}
void handleEnemies() {
  for (int i = 0; i < enemies.size (); i++) {
    Enemy enemy = (Enemy) enemies.get(i);
    enemy.move();
    enemy.display();
  }
}

void handleBullets() {
  for (int i = 0; i < bullets.size (); i++) {
    Bullet b = (Bullet) bullets.get(i);
    b.move();
    b.display();
  }
}

