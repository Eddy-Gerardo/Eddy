float Cajas[] = new float [10];
float c, aux;
int j, p;

void setup() {
  begin();
  background(255);
  fullScreen(P3D);
}

void draw() {

  if (mousePressed==true) //Click sostenido para ordenar el vector
  {
    p++;
    if ((p+1)>=Cajas.length) noLoop();
    aux=Cajas[p];
    j = p-1;

    while ((j>=0) && (aux<Cajas[j])) {
      Cajas[j+1] = Cajas[j];
      j--;
    }
    Cajas[j+1] = aux;
    mostrar();
  }
}
void begin() {
  for (int i = 0; i < Cajas.length; i++) {
    Cajas[i]=random(75);
  }
}
void mostrar() {
  background(255);
  for (int i = 0; i < Cajas.length; i++) {
    pushMatrix();
    stroke(0);
    translate(map(i, 0, Cajas.length, width/Cajas.length, width), height/2);
    noFill();
    box(Cajas[i]);
    popMatrix();
    delay(50);
    c=+1;
  }
}
