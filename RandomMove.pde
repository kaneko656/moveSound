
class RandomMove{
  float ax=0;
  float ay=0;
  float vx=0;
  float vy=0;
  float valueX=0;
  float valueY=0;
  float x=0;
  float y=0;
  float rad =0;
  RandomMove(){
    rad = random(0,1);
    valueX = rad*100;
    valueY = rad*100;
  }
  
  void update(){
    ax += random(-0.2,0.2);
    ay += random(-0.2,0.2);
    ax *= 0.9;
    ay *= 0.9;
    vx += ax;
    vy += ay;
    vx *= 0.93;
    vy *= 0.93;
    valueX += vx;
    valueY += vy;
    x = (noise(1.0*valueX/(20+rad)));
    y = (noise(1.0*valueY/(20+rad)));
 
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  
}
