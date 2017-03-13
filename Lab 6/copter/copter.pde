// helicopter game made using processing
// controlled using the f38x microcontroller

// game constants
// map size
final int mapWidth = 3000;
final int mapDepth = 10000;

// number of concurrent blocks
final int maxBlocks = 150;

// font object
PFont font;

// another layer
PGraphics pg;

// create player object
Player player;

// create obsticle objects
Block[] blocks = new Block[maxBlocks];

// lateral movement
float turnOffset_tgt;
float turnOffset = 0;
float trackOffset = 0;

void setup() {
    size(800, 600, P3D);
    player = new Player();

    // spawn random blocks
    for (int i = 0; i < blocks.length; i++) {
        blocks[i] = new Block(new PVector(random(-mapWidth, mapWidth), random(0, mapDepth)));
    }

    // load font
    font = createFont("data/big_noodle_titling_oblique.ttf", 100);
}

void draw() {
    // setup background and camera
    background(255);
    ambientLight(50, 50, 50);
    directionalLight(255,255,255,0,1, 0);
    directionalLight(255,255,255,0,0, -1);

    // camera offsets
    pushMatrix();
    turnOffset_tgt = map(mouseX - width/2, -width/2, width/2, 80, -80);
    turnOffset = lerp(turnOffset, turnOffset_tgt, 0.1);
    trackOffset = lerp(trackOffset, (player.getSpeed() > 60) ? -200 : -100, 0.05);
    translate(width/2 + turnOffset, height/2+100, trackOffset);
    rotateX(3*PI/2 - radians(5));

    // draw ground
    pushMatrix();
    translate(0, 0, 50);
    rectMode(CENTER);
    fill(150, 150, 150);
    rect(0, 0, 4*mapWidth, 4*mapDepth);
    popMatrix();


    // draw block
    stroke(50);
    strokeWeight(10);
    fill(255);
    for (int i = 0; i < blocks.length; i++) {
        if (blocks[i].isEnabled()) {
            blocks[i].draw();
        } else {
            blocks[i] = new Block();
        }
    }

    // draw player
    player.draw();

    // end of drawing 3D world
    drawAxis();
    popMatrix();

    // draw on screen effects
    if (player.getSpeed() > 60) {
        // draw random camera effects

        // windsheild effects
        stroke(150);
        strokeWeight(5);
        float randomRStart = random(100, 300);
        float randomREnd = random(500, 800);
        float randomAngle = random(0, TWO_PI);
        line(
            width/2 + randomRStart * cos(randomAngle),
            height/2 + randomRStart * sin(randomAngle),
            width/2 + randomREnd * cos(randomAngle),
            height/2 + randomREnd * sin(randomAngle)
            );


        // FIXME
        fill(255, 200, 0);
        textAlign(CENTER, CENTER);
        textFont(font);
        text("MATCH COMPLETE", width/2, height/2);
    }
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
    private float speed;
    private float fanRotation;

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
        pushMatrix();
        translate(0, -height/2, 0);
        rotateY(map(mouseX, 0, width, PI/3, -PI/3));
        this.render();
        popMatrix();

        // call the update function to update player status
        update();
    }

    public float getSpeed() {
        return speed;
    }

    private void update() {
        speed = map(mouseY, 0, height, 100, 10);
        fanRotation = (fanRotation >= TWO_PI) ? 0 : fanRotation + 0.01 * speed;
    }

    // render player frame
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

        // render propeellers
        pushMatrix();
        translate(0, -50, -15);

        // rotation is a function of time
        rotateY(fanRotation);
        renderFan();
        popMatrix();
    }

    // rander propellers
    private void renderFan() {
        pushMatrix();
        translate(0, -2, 0);
        box(10);
        if (speed < 60) {
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
            beginShape(QUADS);
            fill(255, 255, 255);
            vertex(-10, 0, 0);
            vertex(10, 0, 0);
            fill(0, 255, 255);
            vertex(10, -100, 0);
            vertex(-10, -100, 0);
            endShape();

            // draw circular
            rotateX(PI/2);
            fill(255, 50);
            ellipse(0, 0, 60, 60);
        }
        popMatrix();
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
        position.x-=map(mouseX, 0, width, -15, 15);

        // check if it's out of bound, if so: reset
        if (position.y < -500 || position.x > mapWidth || position.x < -mapWidth) {
            isEnabled = false;
        }
    }
}
