class Dot
{
  PVector vel;
  PVector acc;
  PVector pos;

  Brain brain;


  Dot()
  {
    brain = new Brain(400);

    pos = new PVector(width/2, height-10);
    vel =new PVector(0, 0);
    acc =new PVector(0, 0);
  }


  void show()
  {
    fill(0);
    ellipse(pos.x, pos.y, 4, 4);
  }


  void move()
  {
    if (brain.direction.length > brain.step)
    {
      acc = brain.direction[brain.step];
      brain.step++;
    }

    vel.add(acc);
    pos.add(vel);
  }
}
