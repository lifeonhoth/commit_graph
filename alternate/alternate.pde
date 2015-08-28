/*

 NYTimes Data Exploration
 johnefarrell18@gmail.com 
 Feb 3, 2014
 - The CSV war.csv can be replaced with any csv
 
 Modified Aug 3, 2015 for github league by Fletcher Bach
 
 */

import processing.pdf.*;

boolean setToExport = false; // set to "true" to export a pdf image

int[] numbers;
String[] colorList = {
  "fffff7f3", 
  "fffde0dd", 
  "fffcc5c0", 
  "fffa9fb5", 
  "fff768a1", 
  "ffdd3497", 
  "ffae017e", 
  "ff7a0177", 
  "ff49006a",
};

color getColor(float f) {
  //f is a number between 0 and 1
  //so let's convert it to an int to pick from the array
  int i = floor(f*(colorList.length-1));
  // ^^Note -1 to keep array in bounds
  color col = unhex(colorList[i]);
  return(col);
}

void setup() {
  size(1051, 105, P3D);
  smooth();
  loadData("brianchandotcom.csv");
  //loadData("test.csv");
  
  exportPDF();
}

void draw() {
  background(0);
  colorMode(HSB);
  drawGrid(numbers, 7, 15);

  endRecord(); //ends PDF frame export
}

void drawGrid(int[] nums, int cols, float s) {
  for (int i = 0; i < nums.length; i++) {
    //Draw every block in the grid
    int n = nums[i];
    float y = (i % cols) * s;
    float x = floor(i / cols) * s;
    //float c = map(n, 0, max(nums), 0, 255);
    //fill(c, 255, 255);
    color col = getColor(map(n, 0, max(nums), 0, 1));
    fill(col);
    rect(x, y, s, s);
  }
}

void loadData(String fileName) {
  String[] rows = loadStrings(fileName);
  numbers = new int[rows.length];
  for (int i = 0; i < rows.length; i++) numbers[i] = int(rows[i]);  //skips enclosures/does same thing
}

void exportPDF() {
  if (setToExport == true) {
    beginRecord(PDF, "graph.pdf"); // begins PDF frame export
  } else {
    // do not export 
  }
}






