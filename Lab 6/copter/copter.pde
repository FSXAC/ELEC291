// helicopter game made using processing
// controlled using the f38x microcontroller

// sound libarry
import processing.sound.*;

// game constants
// map size
final int mapWidth = 3000;
final int mapDepth = 10000;

// number of concurrent blocks
final int maxBlocks = 75;

// font object
PFont font;
Title title;

// sound player
SoundFile victorySound;

// create player object
Player player;

// create obsticle objects
Block[] blocks = new Block[maxBlocks];
Megablock mBlock = new Megablock(new PVector(random(-mapWidth, mapWidth), mapDepth));

// lateral movement
float turnOffset_tgt;
float turnOffset = 0;
float trackOffset = 0;

void setup() {
    size(800, 600, P3D);
    player = new Player();

    // spawn random blocks
    for (int i = 0; i < blocks.length; i++) {
        blocks[i] = new Block(new PVector(random(-mapWidth, mapWidth), random(500, mapDepth)));
    }

    // load font
    font = createFont("data/big_noodle_titling_oblique.ttf", 100, true);

    // load sound
    victorySound = new SoundFile(this, "victory.mp3");
}

void draw() {
    // setup background and camera
    background(216, 251, 255);
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

    // screenshake
    if (player.getSpeed() > 60) {
        translate(random(-2, 2), random(-2, 2), random(-2, 2));
    }
    if (player.getCollide()) {
        float pSpeed = map(player.getSpeed(), 10, 100, 10, 50);
        translate(random(-pSpeed, pSpeed), 0,  random(-pSpeed, pSpeed));
    }

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
    if (mBlock.isEnabled()) mBlock.draw();
    else mBlock = new Megablock();

    // draw player
    player.draw();

    // end of drawing 3D world
    popMatrix();

    // draw on screen effects
    if (player.getSpeed() > 60) {
        // draw random camera effects
        // screenshake
        translate(random(-5, 5), random(-5, 5));

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
    }

    // draw title
    if (title != null) {
        title.draw();
    }

    fill(0);
    text(mBlock.position.y, 10, 10);
}

// mouse events
void mouseClicked() {
    title = new Title("Complete!");
}

// debug axis
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
