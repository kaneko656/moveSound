/*
 * Queue クラス
 */


class Queue {
  private int head=0;
  private float value[];
  private int size=10;
  
  Queue(int _size) {
    size=_size;
    value=new float[size];
  }

  void add(float val) {
    value[head]=val;
    head++;
    if (head>=size) {
      head=0;
    }
  }
  
  float[] getValue(){
    float v[]=new float[size];
    int n=0;
    for(int i=head;i>=0;i--){
      v[n]=value[i];
      n++;
    }
    for(int i=size-1;i>head;i--){
      v[n]=value[i];
      n++;
    }
    return v;
  }
}
