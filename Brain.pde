class Brain
{

  PVector[] direction;
  int step = 0;

  Brain(int size)
  {
    direction = new PVector[size];
    randomize();
  }

  void randomize()
  {
    for (int i = 0; i< direction.length; i++)
    {
      float randomAngle = random(2*PI);
      direction[i] = PVector.fromAngle(randomAngle);
    }
  }

  Brain clone()
  {
    Brain clone = new Brain(direction.length);

    {
      for (int i = 0; i< direction.length; i++)
      {
        clone.direction[i] = direction[i].copy();
      }
      return clone;
    }
  }

  void mutate()
  {
    float mutationrate = 0.01;
    for (int i = 0; i<direction.length; i++)   
    {
      float rand = random(1);
      if (rand < mutationrate)
      {
        float randomAngle = random(2*PI);
        direction[i] = PVector.fromAngle(randomAngle);
      }
    }
  }
}
