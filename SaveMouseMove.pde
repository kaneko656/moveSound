
class SaveMouseMove {
  Table table;
  ArrayList<Integer> count=new ArrayList<Integer>();
  ArrayList<Float> x=new ArrayList<Float>();
  ArrayList<Float> y=new ArrayList<Float>();
  int cnt=0;

  SaveMouseMove() {
    table = new Table();
  }

  void addPosition(float _x, float _y) {
    count.add(cnt);
    x.add(_x);
    y.add(_y);  
    cnt++;
  }

  void save() {
    table.addColumn("time");
    table.addColumn("x");
    table.addColumn("y");

    for (int i=0; i< cnt; i++) {
      TableRow newRow = table.addRow();
      newRow.setInt("time", count.get(i));
      newRow.setFloat("x", x.get(i));
      newRow.setFloat("y", y.get(i));
    }
    
    saveTable(table, "temp.csv");
    println("save");
  }
}
