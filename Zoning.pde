class Zones {

float x1, x2, y1, y2; // positions for each zone
FloatList P1, P2, rec, rw, rh, area;
Table plots;
int id = 0;
int purpose; // 8 = farm, 1 = res
color c;

Zones(){
  // width, height & surface area for zones
  rw = new FloatList();
  rw.set(0, 0);
  rh = new FloatList();
  rh.set(0, 0);
  area = new FloatList();
  area.set(0, 0);
  // zones data table
  plots = new Table();
  plots.addColumn("x1");
  plots.addColumn("y1");
  plots.addColumn("rw");
  plots.addColumn("rh");
  plots.addColumn("area");
  plots.addColumn("purpose"); 
  plots.addColumn("tick"); // Tick at which it was drawn
  plots.addColumn("span"); // age in Ticks since it was drawn
  plots.addRow();
  // set zones to farm
  fill(228,224,161); 
  purpose = 8;
  }

void Draw() {  
    if ((mousePressed == true) && (mouseButton == LEFT)) {
     diff();
     rect(x1, y1, -(x1-mouseX), -(y1-mouseY));
    }  
  }

void Drawn(){  
  // iterate over plots.table, set color, draw plot
  for (int i = 0; i < id; i = i + 1){
    
    if (plots.getFloat(i, 5) == 1){
      fill(163,224,161);
      } 
    if (plots.getFloat(i, 5) == 8){
      fill(228,224,161);
      }
  
  rect(
      plots.getFloat(i, 0), 
      plots.getFloat(i, 1), 
      plots.getFloat(i, 2), 
      plots.getFloat(i, 3));
    }
  }

void P1(){
  if ((mousePressed == true) && (mouseButton == LEFT)) {
  // grab 1st mouse coordinates to draw plot from
      P1 = new FloatList();
      P1.append(x1 = mouseX);
      P1.append(y1 = mouseY);
      //println(P1);
    }
  }
  
void P2(){
 if (mouseButton == LEFT) {
 // grab 2nd mouse coordinates to calculate plot width, height & surface area
      P2 = new FloatList();
      P2.append(x2 = mouseX);
      P2.append(y2 = mouseY);
      // println(P2);  
      rec = new FloatList();
      rec.append(x1);
      rec.append(y1);
      rec.append(x2);
      rec.append(y2);
      // println(rec);
      rec.sub(2, rec.get(0));
      rec.sub(3, rec.get(1));
      rw.set(0, rec.get(2));
      rh.set(0, rec.get(3));      
      area.set(0, rw.get(0));
      area.mult(0, rh.get(0));
      if ((area.get(0) < 0)){
        area.mult(0, -1);}
      // println(rw);       
      // add plot coordinates, width, height & surface area to table, write table and increase plot ID
      plots.addRow();
      plots.setFloat(id, 0, x1);
      plots.setFloat(id, 1, y1);
      plots.setFloat(id, 2, rw.get(0));
      plots.setFloat(id, 3, rh.get(0));
      plots.setFloat(id, 4, area.get(0));
      plots.setFloat(id, 5, purpose);
      plots.setInt(id, 6, Simulator.GT);
      saveTable(plots, "data/zones.csv");
      id = id + 1;
    }
  }

void diff(){
  // pass colors to Plot.draw
   if (key == 'f'){
        fill(228,224,161); 
        purpose = 8;
       }
 
    if (key == 'r'){
        fill(163,224,161);  
        purpose = 1;
      } 
    }
 
}