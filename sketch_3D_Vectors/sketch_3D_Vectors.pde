import peasy.*;

ArrayList<PVector> vectors = new ArrayList<PVector>();
PVector mean = new PVector();

PeasyCam cam;
float scale = 50;
void setup() {
  fullScreen(P3D);
  cam = new PeasyCam(this, 100);
  float t = -TWO_PI;
  while (t < TWO_PI) {
    PVector p = eqn(t);
    mean.x += p.x;
    mean.y += p.y;
    mean.z += p.z;
    vectors.add(p);
    t+=0.001;
  }
  mean.x /= (float)vectors.size();
  mean.y /= (float)vectors.size();
  mean.z /= (float)vectors.size();
}

PVector eqn(float t) {
  return new PVector(2*sin(3*t), -2*cos(3*t), 0);
}

PVector eqn1(float t) {
  float ft = (exp(cos(t)) - 2*cos(4*t) - pow(sin(t/12), 5));
  return new PVector(sin(t)*ft, cos(t)*ft, 0);
}

PVector eqn2(float t) {
  return new PVector(sin(33*t)*cos(9*t), sin(40*t)*sin(7*t), 0);
}

PVector eqn3(float t) {
  return new PVector(2*cos(t) + sin(2*t)*cos(60*t), sin(2*t)+sin(60*t), 0);
}

PVector eqn4(float t) {
  return new PVector(t-1.6*cos(24*t), t-1.6*cos(25*t), 0);
}

PVector eqn5(float t) {
  return new PVector(1/cos(t), tan(t), 0);
}

PVector eqn6(float t) {
  return new PVector(2*sin(t), 2*cos(t), t);
}

PVector eqn7(float t) {
  return new PVector(sin(t) + 2*sin(2*t), cos(t) - 2*cos(2*t), -sin(3*t));
}

PVector eqn8(float t) {
  return new PVector((2+cos(3*t))*cos(2*t),(2+cos(3*t))*sin(2*t),sin(3*t));
}

PVector eqn9(float t) {
  float r = 1;
  float k = 2.1;
  return new PVector(r*(k+1)*cos(t) - r*cos((k+1)*t), r*(k+1)*sin(t) - r*sin((k+1)*t), t/10);
}

PVector eqn10(float t) {
  return new PVector(t-sin(t), 1-cos(t), t+2*sin(t));
}

PVector eqn11(float t){
  return new PVector(t*t, 2*t, 0);
}

PVector eqn12(float t){
  return new PVector(sin(t), cos(t), 0);
}

PVector eqn13(float t){
  return new PVector(2*sin(t), 0.5*cos(t), 0);
}

PVector eqn14(float t){
  return new PVector(cos(t), 0.5*sin(t), t);
}

void draw() {
  background(0);
  stroke(255);
  //strokeWeight(8);
  noFill();
  beginShape();
  scale(1, -1, 1);
  for (PVector p : vectors) {
    vertex((p.x - mean.x)*scale, (p.y - mean.y)*scale, (p.z - mean.z)*scale);
  }
  endShape();
}
