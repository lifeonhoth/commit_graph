
Table table;  // making table variable
float dataMax = MAX_FLOAT;  //establishing min and max values from data
float dataMin = MIN_FLOAT;
int rowCount;      //establishing length of data

void setup() {
  size(550, 550);
  background(255);

  table = loadTable("fabpot.csv", "header");  //importing csv data
  //int val1 = table.getInt(2, 1);
  //print(val1);

  rowCount = table.getRowCount();
  //print(dataMin);   //testing
  //print(rowCount);

  displayBlocks();  //calling display blocks function to display final blocks, colored according to data
}

void draw() {
}

//void displayBlocks() {
//  noStroke();
//  for (int i = 0; i < rowCount; i++) {
//    float containerVal = table.getFloat(i, 0);  // getting values for first column of each row
//    //println(containerVal);
//    float valMappedToColor = map(containerVal, dataMin, dataMax, 0, 255); //mapping max and min data values to color range
//    println(valMappedToColor);
//    for (int y = 0; y < height; y+=40) {
//      for (int x = 0; x < width; x +=40) {
//        fill(valMappedToColor);
//        rect(x, y, 40, 40);
//      }
//    }
//  }
//}

void displayBlocks() {
  noStroke();
  for (int i = 0; i < rowCount; i++) {
    float containerVal = table.getFloat(i, 0);  // getting values for first column of each row
    //println(containerVal);
    // put them in array? 
    float valMappedToColor = map(containerVal, dataMin, dataMax, 0, 255); //mapping max and min data values to color range
    println(valMappedToColor);

    //fill(valMappedToColor);
    //rect(100, 100, 40, 40);
  }
}

