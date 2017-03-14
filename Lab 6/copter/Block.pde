class Block {
    private PVector position;
    private boolean isEnabled;
    private PVector corner1;
    private PVector corner2;
    private PVector corner3;
    private PVector corner4;

    Block(PVector newVector) {
        position = newVector.copy();
        isEnabled = true;

        // generate random shapes
        corner1 = new PVector(random(25, 50), random(-50, -25), random(-200, -50));
        corner2 = new PVector(random(25, 50), random(25, 50), random(-200, -50));
        corner3 = new PVector(random(-50, -25), random(25, 50), random(-200, -50));
        corner4 = new PVector(random(-50, -25), random(-50, -25), random(-200, -50));
    }

    Block() {
        position = new PVector(random(-mapWidth, mapWidth), random(mapDepth-1000, mapDepth));
        isEnabled = true;

        // generate random shapes
        corner1 = new PVector(random(25, 50), random(-50, -25), random(-200, -50));
        corner2 = new PVector(random(25, 50), random(25, 50), random(-200, -50));
        corner3 = new PVector(random(-50, -25), random(25, 50), random(-200, -50));
        corner4 = new PVector(random(-50, -25), random(-50, -25), random(-200, -50));
    }

    public void draw() {
        stroke(map(dist(position.x, position.y, 0, 0), 1000, 8000, 100, 255));
        pushMatrix();
        translate(position.x, position.y, 0);
        renderBox();
        popMatrix();

        // update block
        update();
    }

    private void renderBox() {
        float k;
        if (position.y > 2000) {
            k = map(position.y, 2000, 8000, 1, 0);
        } else {
            k = 1;
        }
        beginShape(QUADS);
        // front
        vertex(50, -50, 0);
        vertex(corner1.x, corner1.y, k*corner1.z);
        vertex(corner4.x, corner4.y, k*corner4.z);
        vertex(-50, -50, 0);
        // left
        vertex(-50, -50, 0);
        vertex(corner4.x, corner4.y, k*corner4.z);
        vertex(corner3.x, corner3.y, k*corner3.z);
        vertex(-50, 50, 0);
        // right
        vertex(50, -50, 0);
        vertex(corner1.x, corner1.y, k*corner1.z);
        vertex(corner2.x, corner2.y, k*corner2.z);
        vertex(50, 50, 0);
        // top
        vertex(corner1.x, corner1.y, k*corner1.z);
        vertex(corner2.x, corner2.y, k*corner2.z);
        vertex(corner3.x, corner3.y, k*corner3.z);
        vertex(corner4.x, corner4.y, k*corner4.z);
        endShape(CLOSE);
    }

    public boolean isEnabled() {
        return isEnabled;
    }

    // move blocks towards players
    private void update() {

        // move blocks forward
        position.y-=player.getSpeed();

        // move blocks sideways
        position.x-=map(turnValue, 0, width, -15, 15);

        // check if it's out of bound, if so: reset
        if (position.y < -1000 || position.x > mapWidth || position.x < -mapWidth) {
            isEnabled = false;
        }

        // check if collision
        if ((position.y < -200 && position.y > -500) && abs(position.x) < 65) {
            isEnabled = false;
            player.collide();
        }
    }
}
