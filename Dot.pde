class Dot
{
  PVector vel;
  PVector acc;
  PVector pos;

  boolean dead = false;
  boolean reachedgoal = false;
  float fitness = 0;

  Brain brain;



  Dot()
  {
    brain = new Brain(400);

    pos = new PVector(width/2, height-10);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }


  void show()
  {
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, 4, 4);
  }


  void move()
  {
    if (brain.direction.length > brain.step)
    {
      acc = brain.direction[brain.step];
      brain.step++;
    } else
    {
      dead = true;
    }

    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
  }

  void update()
  {
    if (!dead && !reachedgoal)
    {
      move();
      if (pos.x < 2 || pos.y < 2||pos.x > width-2 ||pos.y > height-2)
      {
        dead = true;
      } else if (dist(pos.x, pos.y, goal.x, goal.y) < 5)
      {
        reachedgoal = true;
      }
    }
  }

  void calfitness()
  {
    if (reachedgoal)
    {
      fitness = 1.0/(float)(brain.step * brain.step);
    } else {   
      float distancetogoal = dist(pos.x, pos.y, goal.x, goal.y);
      fitness = 1.0/(distancetogoal * distancetogoal);
    }
  }

  Dot baby()
  {
    Dot bebs = new Dot();
    bebs.brain = brain.clone();
    return bebs;
  }
}
