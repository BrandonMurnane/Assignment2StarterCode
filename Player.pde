class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
  boolean canShoot;
  int timeLastShot;
  int coolDown;

  Player()
  {
    pos = new PVector(50, 50);
    this.timeLastShot = 0;
    this.coolDown = 400;
  }

  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }

  Player(int index, color colour, XML xml)
  {
    this(index
      , colour
      , buttonNameToKey(xml, "up")
      , buttonNameToKey(xml, "down")
      , buttonNameToKey(xml, "left")
      , buttonNameToKey(xml, "right")
      , buttonNameToKey(xml, "start")
      , buttonNameToKey(xml, "button1")
      , buttonNameToKey(xml, "button2")
      );
  }
  void shoot() {
    if (millis() - timeLastShot > coolDown) {
      Bullet bullet = new Bullet(pos.x, pos.y, -5);
      bullets.add(bullet);
      timeLastShot = millis();
    }
  }

  void update()
  {
    if (checkKey(up))
    {
      // pos.y -= 1;
    }
    if (checkKey(down))
    {
      //pos.y += 1;
    }
    if (checkKey(left))
    {
      pos.x -= 1;
    }    
    if (checkKey(right))
    {
      pos.x += 1;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      for (Player player : players)
      {
        player.shoot();
      }
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }
  }

  void display()
  {    
    stroke(colour);
    fill(colour);    
    //rect(pos.x, pos.y, 20, 20);

    pushMatrix();
    translate(pos.x, pos.y);
    stroke(colour);
    float halfWidth = 20/ 2;
    float halfHeight = 20 / 2;
    fill(colour);
    triangle(-halfWidth, halfHeight, 0, - halfHeight, halfWidth, halfWidth);
    fill(0);
    stroke(0);
    triangle(halfWidth, halfHeight, 0, 0, - halfWidth, halfHeight);
    popMatrix();
  }
  void hitCheck() 
  {
    for (int i = 0; i < bullets.size (); i++) {
      Bullet b = (Bullet) bullets.get(i);
      float distBetween = dist(b.x, b.y, pos.x, pos.y);
      if (b.velocity > 0 && rectIntersect(pos.x-15, pos.y, 30, 30, b.x, b.y, 5, 20)) {
        bullets = new ArrayList();
      }
    }
  }
}

