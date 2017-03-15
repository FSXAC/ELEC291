class Player {
    private float speed;
    private float fanRotation;

    int collisions = 0;
    int collisionTimer = 0;

    int distance = 0;
    boolean boosting = false, boostAvailable = false;

    // constructor
    Player() {
        speed = 10;

        // initial fan rotation
        fanRotation = 0;
    }

    // draw the player
    public void draw() {
        stroke(0);
        noFill();
        // pushMatrix();
        translate(0, -height/2, 0);
        rotateY(map(turnValue, 0, width, PI/3, -PI/3));
        rotateZ(map(turnValue, 0, width, PI/12, -PI/12));
        this.render();
        // popMatrix();

        // call the update function to update player status
        update();
    }

    public float getSpeed() {
        return speed;
    }

    // collide with player
    public void collide() {
        collisions++;
        collisionTimer = 30;
        if (speed > 10) speed *= 0.5;
    }

    public boolean getCollide() {
        return (collisionTimer > 0);
    }

    private void update() {
        if (speed < 120) speed = lerp(speed, playerSpeed_tgt, 0.005);
        fanRotation = (fanRotation >= TWO_PI) ? 0 : fanRotation + 0.01 * speed;
        if (collisionTimer > 0) collisionTimer--;

        // accumulate distance
        if (!boosting && !boostAvailable) {
            distance += speed/10;
            if (distance > 6000) {
                boostAvailable = true;
            }
        }

        println(distance);
    }

    // render player frame
    private void render() {
        noFill();
        if (speed > 60) {
            stroke(
                constrain(map(speed, 60, 70, 0, 255), 0, 255),
                constrain(map(speed, 60, 100, 0, 255), 0, 255),
                constrain(map(speed, 80, 100, 0, 100), 0, 100)
                );
        }
        beginShape(QUADS);
        // front face
        vertex(-15, 50, -30);
        vertex(15, 50, -30);
        vertex(25, 40, 0);
        vertex(-25, 40, 0);

        // bottom face
        vertex(-25, 40, 0);
        vertex(25, 40, 0);
        vertex(50, -50, 0);
        vertex(-50, -50, 0);
        endShape();

        beginShape(TRIANGLES);
        // top
        vertex(-15, 50, -30);
        vertex(15, 50, -30);
        vertex(0, -50, -40);
        // left
        vertex(0, -50, -40);
        vertex(-50, -50, 0);
        vertex(-15, 50, -30);
        // right
        vertex(0, -50, -40);
        vertex(50, -50, 0);
        vertex(15, 50, -30);
        // back
        vertex(0, -50, -40);
        vertex(-50, -50, 0);
        vertex(50, -50, 0);
        endShape();

        // render propeellers
        renderFan();
    }

    // rander propellers
    private void renderFan() {
        pushMatrix();
        translate(0, -52, -15);
        stroke(0);
        box(10);
        if (speed < 60) {
            // rotation is a function of time
            rotateY(fanRotation);
            for (int i = 0; i < 4; i++)  {
                rotateY(i * TWO_PI / 4);
                beginShape(TRIANGLE);
                vertex(0, 0, -5);
                vertex(-5, 0, -30);
                vertex(5, 0, -20);
                endShape();
            }
        } else {
            // draw afterburner
            beginShape(TRIANGLE);
            fill(255, 255, 255);
            vertex(-10, 0, 0);
            vertex(10, 0, 0);
            fill(0, 255, 255);
            vertex(0, -random(80, 130) * map(speed, 60, 100, 0.5, 3), 0);
            endShape();

            // draw circular
            rotateX(PI/2);
            fill(255, 50);
            ellipse(0, 0, 60, 60);
        }
        popMatrix();
    }
}
