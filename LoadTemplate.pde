
class LoadTemplate{
  Table table;
  // move_1, move_2, …
  int []time;
  float []x;
  float []y;
  
  int head=0;
  
  LoadTemplate(){
    int templateRand = templateRandomOut.getRandom()+1;
    println("moveTemplate/move_"+templateRand+".csv");

    table = loadTable("moveTemplate/move_"+templateRand+".csv", "header");
    
    int c = table.getRowCount();
    time = new int[c];
    x = new float[c];
    y = new float[c];
 
    int n=0;
    for (int i =0; i< c; i++) { 
      time[i] = table.getRow(i).getInt("time");
      x[i] = table.getRow(i).getFloat("x");
      y[i] = table.getRow(i).getFloat("y");
    }
  }
  
  float getX(){
    return x[head];
  }
  
  float getY(){
    return y[head];
  }
  
  void next(){
    head++;
    if(head >= time.length){
      head=0;
    }
  }
}
