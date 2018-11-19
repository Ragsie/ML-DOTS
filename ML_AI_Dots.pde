Population run;
PVector goal = new PVector(400, 10);


void setup()
{
  size(800, 800);
  run = new Population(1000);
}

void draw()
{
  background(255);
  fill(0, 255, 0);
  ellipse(goal.x, goal.y, 10, 10);

  if (run.alldotsdead())
  {
    run.calfitness();
    run.naturalselection();
    run.mutate();
  } else {
    run.update();
    run.show();
  }
}
