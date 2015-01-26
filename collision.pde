boolean rectIntersect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {

  float[] r1 = new float[8];
  float[] r2 = new float[8];

   r1[0] = x1;
   r1[1] = y1;
   r1[2] = x1+w1;
   r1[3] = y1+h1;
   r1[4] = r1[0];
   r1[5] = r1[3];
   r1[6] = r1[2];
   r1[7] = r1[1];

   r2[0] = x2;
   r2[1] = y2;
   r2[2] = x2+w2;
   r2[3] = y2+h2;
   r2[4] = r2[0];
   r2[5] = r2[3];
   r2[6] = r2[2];
   r2[7] = r2[1];
  
  boolean intersect = false;
  
  for (int i = 0; i < 8; i=i+2){
    if (pointInRectangle(r2[0], r2[2], r2[1], r2[3], r1[i], r1[i+1])){
    intersect = true;
    }
  }
  
  for (int i = 0; i < 8; i=i+2){
    if (pointInRectangle(r1[0], r1[2], r1[1], r1[3], r2[i], r2[i+1])){
    intersect = true;
    }
  }
  return intersect;
}

boolean isBetween(float v1, float v2, float test) {
  if (test < v1 && test > v2) {
    return true;
  }
  else {
    if (test > v1 && test < v2) {
      return true;
    }
    else {
      return false;
    }
  }
}

boolean pointInRectangle(float x1, float x2, float y1, float y2, float xT, float yT) {
  if (((xT < x1 && xT > x2) || (xT > x1 && xT < x2)) && 
    ((yT < y1 && yT > y2) || (yT > y1 && yT < y2))) {
    return true;
  }
  else {
    return false;
  }
}
