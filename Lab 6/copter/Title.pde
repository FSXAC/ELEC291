class Title {
    boolean enabled = true;

    // contains the string of the message
    String message;

    // color of text
    color textColor;

    // keyframes - time
    int time = 0;
    int maxTime = 260;

    // flashing star and circle
    boolean flashC;

    // random flashing text offsets
    float x, y;
    boolean flash;

    // flash intial letter
    boolean flashI;

    Title(String msg, boolean playMusic) {
        message = msg;
        if (playMusic) victorySound.play();
    }

    public void draw() {
        if (enabled) {
            // draw dimming
            noStroke();
            rectMode(CORNER);
            fill(0, constrain(map(time, 0, 20, 0, 175), 0, 175) - constrain(map(time, 178, maxTime, 0, 175), 0, 175));
            rect(0, 155, width, 200);

            // change fill
            textColor = color(
                // rgb
                255,
                constrain(map(time, 40, 120, 255, 213), 0, 255),
                constrain(map(time, 30, 40, 255, 0), 0, 255) + constrain(map(time, 40, 120, 0, 74), 0, 255),

                // alpha
                constrain(map(time, 10, 20, 0, 255), 0, 255) - constrain(map(time, 178, 230, 0, 255), 0, 255));

            textAlign(CENTER, CENTER);
            textFont(font);

            // change text size
            textSize(int(map(time, 10, 230, 150, 100)));

            // flash
            flashCircle();

            // flashing text
            flashText();

            // actual text
            fill(textColor);
            text(message, width/2, height/2 - 50);

            // flash initials
            flashInitial();

            // update text status
            update();
        }
    }

    private void flashCircle() {
        if (flashC) {
            noFill();
            stroke(255);
            strokeWeight(constrain(map(time, 10, 40, 30, 0), 0, 30));
            float diam = map(time, 10, 60, 50, 500);
            ellipse(width/2-20*message.length(), height/2 - 60, diam, diam);
        }
    }

    private void flashText() {
        if (flash) {
            x = random(-10, 10);
            y = random(-10, 10);
            fill(textColor);
            pushMatrix();
            translate(width/2 + x, height/2 - 50 + y);
            for (int v = -1; v < 2; v++) {
                text(message, 3*v, 0);
                text(message, 0, 3*v);
            }
            fill(0);
            text(message, 0, 0);
            popMatrix();
        }
    }

    private void flashInitial() {
        if (flashI) {
            fill(255);
            textSize(int(map(time, 0, 15, 800, 150)));
            text(message.charAt(0), width/2-20*message.length(), height/2-50);
        }
    }

    private void update() {
        flash = (time > 20 && time < 70) && !flash;
        flashC = (time > 10 && time < 40);
        flashI = (time < 15);
        if (time < maxTime) {
            time++;
        } else {
            enabled = false;
        }
    }
}
