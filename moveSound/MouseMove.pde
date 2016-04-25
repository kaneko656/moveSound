// マウスの状態

class MouseMove {
  int bfn = 5;
  Queue x;
  Queue y;
  float spX=0;
  float spY=0;
  boolean moved=false;
  

  MouseMove(int _bfn) {
    bfn = _bfn;
    x = new Queue(bfn);
    y = new Queue(bfn);
  }
  
  boolean moved(){
    return moved;
  }

  void update(int musX, int musY) {
    x.add(musX);
    y.add(musY);
    float[] xx=x.getValue();
    float[] yy=y.getValue();

    boolean move = false;   

    float spX = speed(xx);
    float spY = speed(yy);
    
    if (spX==0 && spY==0) {
      moved=false;
      return;
    } 
    // ゆっくりだとmove判定をゆるくする(止まりにくく) 速いほど判定きつくする   
    float lng = max(2, 1.0*bfn/sqrt(spX*2 + spY*2));
    boolean xm = move(xx, (int)lng);
    boolean ym = move(yy, (int)lng);
    if( xm || ym){
      moved = true;
    }else{
      moved = false;
    }
  }
  
  float speed(float v[]){
    float vv = v[0];
    float sp=0;
    for (int i=1; i<v.length; i++) {
      sp += abs(v[i]-v[i-1]);
      if (vv != v[i]) {
      }
    }
    sp/=v.length;
    return sp;
  }
  
  boolean move(float v[], int length){
    length = min(v.length,length);
    boolean move=false;
    float vv = v[0];
    for (int i=1; i<length; i++) {
      if(vv != v[i]){
        move = true;
      }
    }
    return move;
  }
}
