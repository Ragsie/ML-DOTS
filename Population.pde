class Population
{
  Dot[] dots;

  float fitnesssum;
  int gen = 1;

  Population(int size)
  {
    dots = new Dot[size];
    for (int i = 0; i< size; i++)
    {
      dots[i] = new Dot();
    }
  }

  void show()
  {
    for (int i = 0; i< dots.length; i++)
    {
      dots[i].show();
      gen++;
    }
  }
  void update()
  {
    for (int i = 0; i< dots.length; i++)
    {
      dots[i].update();
    }
  }

  void calfitness()
  {
    for (int i= 0; i< dots.length; i++)
    {
      dots[i].calfitness();
    }
  }
  boolean alldotsdead()
  {
    for (int i =0; i<dots.length; i++)
    {
      if (!dots[i].dead && !dots[i].reachedgoal)
      {
        return false;
      }
    }
    return true;
  }

  void naturalselection()
  {
    Dot[] newDots = new Dot[dots.length];
    calfitnesssum();
    for (int i=0; i<newDots.length; i++)
    {
      Dot parent = selectparent();
      newDots[i] = parent.baby();
    }
    dots = newDots.clone();
  }


  void calfitnesssum()
  {
    fitnesssum= 0;
    for (int i=0; i< dots.length; i++)
    {
      fitnesssum += dots[i].fitness;
    }
  }

  Dot selectparent()
  {
    float rand = random(fitnesssum);

    float runningsum = 0;

    for (int i = 0; i<dots.length; i++) 
    {
      runningsum += dots[i].fitness;
      if (runningsum >rand)
      {
        return dots[i];
      }
    }
    return null;
  }

  void mutate()
  {
    for (int i = 0; i<dots.length; i++) 
    {
      dots[i].brain.mutate();
    }
  }
}
