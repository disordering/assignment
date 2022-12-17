class Population {
  Rocket[] rockets;
  int popsize;
  List<Rocket> matingpool;

  Population() {
    popsize = 25;
    rockets = new Rocket[popsize];
    matingpool = new ArrayList<Rocket>();

    for (int i = 0; i < popsize; i++) {
      rockets[i]  = new Rocket();
    }
  }

  float evaluate() {
    float avgfit = 0;
    float maxfit = 0;
    for (Rocket rocket : rockets) {
      rocket.calcFitness();
      if (rocket.fitness > maxfit) {
        maxfit = rocket.fitness;
      }
      avgfit += rocket.fitness;
    }
    avgfit /= rockets.length;

    for (Rocket rocket : rockets) {
      rocket.fitness /= maxfit;
    }

    matingpool = new ArrayList<Rocket>();

    for (Rocket rocket : rockets) {
      float n = rocket.fitness * 100;
      for (int j = 0; j < n; j++) {
        matingpool.add(rocket);
      }
    }

    return avgfit;
  }

  Rocket random(List<Rocket> list) {
    int r = (int)(Math.random() * (list.size()));
    return list.get(r);
  }

  void selection() {
    Rocket[] newRockets = new Rocket[popsize];
    for (int i = 0; i < rockets.length; i++) {
      DNA parentA = random(matingpool).dna;
      DNA parentB = random(matingpool).dna;
      DNA child = parentA.crossover(parentB);
      child.mutation();
      newRockets[i] = new Rocket(child);
    }

    rockets = newRockets;
  }

  void run() {
    for (Rocket rocket : rockets) {
      rocket.update();
      rocket.show();
    }
  }
}

//--------------------------------------

final float maxvelocity = 4;

class Rocket {
  PVector pos;
  PVector vel;
  PVector acc;
  DNA dna;
  float fitness = 0;
  boolean hitTarget = false;
  boolean crashed = false;

  Rocket() {
    this(new DNA());
  }

  Rocket(DNA dna_) {
    pos = new PVector(width / 2, height - 20);
    vel = new PVector();
    acc = new PVector(0, -0.01);
    dna = dna_;
    fitness = 0;
    hitTarget = false;
    crashed = false;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void calcFitness() {
    float d = distanceToTarget();
    fitness = map(d, 0, width, width, 0);
    if (hitTarget) {
      fitness *= 10;
    } else if (crashed) {
      fitness /= 10;
    }
  }

  float distanceToTarget() {
    return dist(pos.x, pos.y, target.x, target.y);
  }

  void update() {
    float d = distanceToTarget();
    if (d < 10) {
      hitTarget = true;
      pos = target.copy();
    }

    if (pos.x > barrierx && pos.x < (barrierx + barrierw) && pos.y > barriery && pos.y < (barriery + barrierh)) {
      crashed = true;
    }
    if (pos.x > width || pos.x < 0 || pos.y > height || pos.y < 0) {
      crashed = true;
    }

    applyForce(dna.genes[age]);

    if (!hitTarget && !crashed) {
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
      vel.limit(maxvelocity);
    }
  }

  void show() {
    pushMatrix();
    noStroke();
    if (hitTarget) {
      fill(50, 205, 50);
    } else if (this.crashed) {
      fill(128, 128, 128);
    } else {
      fill(255, 150);
    }

    translate(pos.x, pos.y);
    rotate(vel.heading());

    // draw rocket body
    rectMode(CENTER);
    rect(0, 0, 25, 5);
    ellipse(12, 0, 10, 5);

    if (!hitTarget && !crashed) {
      // draw thrust flame
      fill(255, 140 + random(0, 115), random(0, 128));
      beginShape();
      vertex(-14, -3);
      vertex(-35, 0);
      vertex(-14, 3);
      endShape();
    }

    popMatrix();
  }
}
