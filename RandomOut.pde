class RandomOut{
  int size = 3;
  ArrayList<Integer>value =new ArrayList<Integer>();
  RandomOut(int _size){
    setSize(_size);
  }
  
  void setSize(int _size){
    size = _size;
    for(int i=0; i<size;i++){
      value.add(i);
    }
  }
  
  int getRandom(){
    if(value == null || value.size()==0){
      return 0;
    }
    int n = (int)random(value.size());
    int n_value = value.get(n);
    value.remove(n);
    return n_value;
  }
}
