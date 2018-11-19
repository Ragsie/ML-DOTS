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
}
