Dot run;

void setup()
{
  size(800, 800);
  run = new Dot();
}

void draw()
{
  background(255);
  run.move();
  run.show();
}
