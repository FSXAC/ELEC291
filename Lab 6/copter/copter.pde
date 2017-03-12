// helicopter game made using processing
// controlled using the f38x microcontroller

// game constants
// map size
final int mapWidth = 3000;
final int mapDepth = 10000;

// number of concurrent blocks
final int maxBlocks = 150;

Player player;

Block[] blocks = new Block[maxBlocks];

// lateral movement
float turnOffset_tgt;
float turnOffset = 0;

void setup() {
    size(800, 600, P3D);
    player = new Player();

    for (int i = 0; i < blocks.length; i++) {
        blocks[i] = new Block(new PVector(random(-mapWidth, mapWidth), random(0, mapDepth)));
    }
}

void draw() {
    background(255);
    ambientLight(50, 50, 50);
    directionalLight(255,255,255,0,1, 0);
    directionalLight(255,255,255,0,0, -1);

    turnOffset_tgt = map(mouseX - width/2, -width/2, width/2, 80, -80);
    turnOffset = lerp(turnOffset, turnOffset_tgt, 0.1);
    translate(width/2 + turnOffset, height/2+100, -100);
    rotateX(3*PI/2 - radians(5));
    stroke(50);
    noFill();

    // draw block
    fill(255);
    // strokeWeight(1);
    for (int i = 0; i < blocks.length; i++) {
        if (blocks[i].isEnabled()) {
            blocks[i].draw();
        } else {
            blocks[i] = new Block();
        }
    }

    player.draw();
}

void drawAxis() {
    // x axis
    stroke(255, 0, 0);
    line(0, 0, 0, 100, 0, 0);

    // y
    stroke(0, 255, 0);
    line(0, 0, 0, 0, 100, 0);

    // z
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, -100);
}

class Player {
    Player() {
    }

    public void draw() {
        stroke(0);
        // strokeWeight(1);
        noFill();
        pushMatrix();
        translate(0, -height/2, 0);
        rotateY(map(mouseX, 0, width, PI/3, -PI/3));
        this.render();
        popMatrix();
    }

    private void render() {
        noFill();
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

        pushMatrix();
        translate(0, -50, -15);
        rotateY(0.3*radians(millis()));
        renderFan();
        popMatrix();
    }

    private void renderFan() {
        box(10);
        strokeWeight(1);
        for (int i = 0; i < 4; i++)  {
            rotateY(i * TWO_PI / 4);
            beginShape(TRIANGLE);
            vertex(0, 0, -5);
            vertex(-5, 0, -30);
            vertex(5, 0, -20);
            endShape();
        }
    }
}

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
        position = new PVector(random(-mapWidth, mapWidth), mapDepth);
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
        // box(100);
        renderBox();
        popMatrix();

        // update block
        update();
    }

    private void renderBox() {
        beginShape(QUADS);
        // front
        vertex(50, -50, 0);
        vertex(corner1.x, corner1.y, corner1.z);
        vertex(corner4.x, corner4.y, corner4.z);
        vertex(-50, -50, 0);
        // left
        vertex(-50, -50, 0);
        vertex(corner4.x, corner4.y, corner4.z);
        vertex(corner3.x, corner3.y, corner3.z);
        vertex(-50, 50, 0);
        // right
        vertex(50, -50, 0);
        vertex(corner1.x, corner1.y, corner1.z);
        vertex(corner2.x, corner2.y, corner2.z);
        vertex(50, 50, 0);
        // top
        vertex(corner1.x, corner1.y, corner1.z);
        vertex(corner2.x, corner2.y, corner2.z);
        vertex(corner3.x, corner3.y, corner3.z);
        vertex(corner4.x, corner4.y, corner4.z);
        endShape(CLOSE);
    }

    public boolean isEnabled() {
        return isEnabled;
    }

    private void update() {
        position.y-=map(mouseY, 0, height, 100, 1);

        // check if it's out of bound
        if (position.y < -500) {
            isEnabled = false;
        }
    }
}
