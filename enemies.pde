class Enemy
{
  float x, y;
  float velocity;
  color colour;
  Enemy(float x, float y,color colour) {
    this.x = x;
    this.y = y;
    this.velocity = 5;
    this.colour = colour;
  }


  void display() {
    int size=5;
    fill(this.colour);
    for (int i=0; i<7; i++)
    {
      rect(x+i*size, y, size, size);
    }
    for (int i=0; i<9; i++)
    {
      rect((x-size)+i*size, y+size, size, size);
    }
    for (int i=0; i<11; i++)
    {
      rect((x-10)+i*size, y+10, size, size);
      rect((x-10)+i*size, y+15, size, size);
      rect((x-10)+i*size, y+20, size, size);
    }
    for (int i=0; i<2; i++)
    {
      fill(this.colour);
      rect((x+25)+i*size, (y-size)-i*size, size, size);
      rect((x+size)-i*size, (y-size)-i*size, size, size);

      rect((x+size)+i*size, y+25, size, size);
      rect((x+20)+i*size, y+25, size, size);
      fill(0);
      rect((x+5)+i*20, y+size, size, size);
      rect((x-5)+i*40, y+15, size, size);
      rect((x-5)+i*40, y+20, size, size);
      rect((x+5)+i*5, y+20, size, size);
      rect((x+20)+i*5, y+20, size, size);
      rect(x+15, y+20, 5, size);
    }
  }
  
   void move() {
    this.x+=this.velocity;
    if (this.x > width*.9) {
      this.x = width*.9;
      this.velocity *= -1;
      this.y+=40;
    }
    if (this.x < width*.1) {
      this.velocity*=-1;
      this.x = width*.1;
      this.y+=40;
    }
  }  
}

