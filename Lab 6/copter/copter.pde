// helicopter game made using processing
// controlled using the f38x microcontroller

Player player;

Block[] blocks = new Block[100];

// lateral movement
float turnOffset_tgt;
float turnOffset = 0;

void setup() {
    size(800, 600, P3D);
    player = new Player();

    for (int i = 0; i < 100; i++) {
        blocks[i] = new Block();
    }
}

void draw() {
    background(255);

    turnOffset_tgt = map(mouseX - width/2, -width/2, width/2, 80, -80);
    turnOffset = lerp(turnOffset, turnOffset_tgt, 0.1);
    translate(width/2 + turnOffset, height/2+100, -100);
    rotateX(3*PI/2 - radians(5));
    stroke(50);
    noFill();

    // draw block
    fill(255);
    strokeWeight(1);
    for (Block block:blocks) {
        block.draw();
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
        strokeWeight(1);
        noFill();
        pushMatrix();
        translate(0, -height/2, 0);
        rotateY(map(mouseX, 0, width, PI/3, -PI/3));
        this.render();
        popMatrix();
    }

    private void render() {
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
        strokeWeight(2);
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
    PVector position;

    Block() {
        position = new PVector(random(-2000, 2000), random(0, 3000));
    }

    void draw() {
        pushMatrix();
        translate(position.x, position.y, -50);
        box(100);
        popMatrix();
    }
}
