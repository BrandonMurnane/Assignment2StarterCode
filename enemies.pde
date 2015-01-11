class enemy
{
  enemy()
  {
  }
  void display()
  {
    int size=5;
    fill( 255, 0, 0);
    for (int i=0; i<7; i++)
    {
      rect(100+i*size, 100, size, size);
    }
    for (int i=0; i<9; i++)
    {
      rect(95+i*size, 105, size, size);
    }
    for (int i=0; i<11; i++)
    {
      rect(90+i*5, 110, size, size);
      rect(90+i*5, 115, size, size);
      rect(90+i*5, 120, size, size);
    }
    for (int i=0; i<2; i++)
    {
      fill(255, 0, 0);
      rect(125+i*5, 95-i*5, 5, 5);
      rect(105-i*5, 95-i*5, 5, 5);

      rect(105+i*5, 125, 5, 5);
      rect(120+i*5, 125, 5, 5);
      fill(0);
      rect(105+i*20, 105, 5, 5);
      rect(95+i*40, 115, 5, 5);
      rect(95+i*40, 120, 5, 5);
      rect(105+i*5, 120, 5, 5);
      rect(120+i*5, 120, 5, 5);
      rect(115, 120, 5, 5);
    }
  }
}

