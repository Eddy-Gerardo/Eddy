float PELOTAS[] = new float[5];
int a;
void draw() {
  if (mousePressed) {
    quickSort(PELOTAS, 0, PELOTAS.length-1);
  }
  show();
}

void show() {
  background(255);
  for (int i = 0; i<PELOTAS.length; i++) {
    noFill();
    stroke(0);
    strokeWeight(0.5);
    pushMatrix();
    translate(map(i, 0, PELOTAS.length, width/PELOTAS.length, width), height/2);
    rotateX(a);
    rotateY(a);
    rotateZ(a);
    sphere(PELOTAS[i]);
    popMatrix();
    delay(50);
    a++;
  }
}

void begin() {
  for (int i=0; i<PELOTAS.length; i++) {
    PELOTAS[i]=random(150);
  }
}

void quickSort(float arr[], int begin, int end) {
  if (begin < end) {
    int partitionIndex = partition(arr, begin, end);

    quickSort(arr, begin, partitionIndex-1);
    quickSort(arr, partitionIndex+1, end);
  }
}
int partition(float arr[], int begin, int end) {
  float pivot = arr[end];
  int i = (begin-1);

  for (int j = begin; j < end; j++) {
    if (arr[j] <= pivot) {
      i++;

      float swapTemp = arr[i];
      arr[i] = arr[j];
      arr[j] = swapTemp;
    }
  }

  float swapTemp = arr[i+1];
  arr[i+1] = arr[end];
  arr[end] = swapTemp;

  return i+1;
}

void setup() {
  fullScreen(P3D);
  begin();
}
