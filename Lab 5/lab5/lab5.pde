import processing.serial.*;

final int BAUD_RATE = 115200;
Serial ser;
String serin;
String[] serinp = {"0", "0", "0", "0"};


void setup() {
    size(1000, 800);
    stroke(5);

    // list number of ports
    printArray(Serial.list());

    // initialze serial
    ser = new Serial(this, Serial.list()[0], BAUD_RATE);
    background(0);

    // read garbage
    ser.readStringUntil('$');
}

float halfPeriod, periodDiff_tgt, periodDiff, vRef, vTest;
void draw() {
    if (ser.available() > 0) {
        ser.readStringUntil('$');
        serin = ser.readStringUntil('!');
        if (serin != null) {
            serin = serin.substring(0, serin.length() - 1);
            serinp = serin.split(",");

            // get numerical values
            halfPeriod = Float.parseFloat(serinp[0]);
            periodDiff_tgt = Float.parseFloat(serinp[1]);
            vRef = Float.parseFloat(serinp[2]);
            vTest = Float.parseFloat(serinp[3]);
        }
        ser.readStringUntil('$');
    }

    // draw
    fill(0, 0, 50, 50);
    noStroke();
    rect(0, 0, width, height);
    drawGrid();

    textSize(18);
    fill(255, 255, 0);
    text("REFERENCE:", 50, 50);
    text("Vpp=" + str(2*vRef) +"V", 50, 70);
    text("Vmax=" + str(vRef) + "V", 50, 90);
    text("Freq=" + str(1000000/(2*halfPeriod)) + "Hz", 50, 110);
    text("Period=" + str(2*halfPeriod) + "us", 50, 130);

    fill(0, 255, 255);
    text("UNDER-TEST:", 350, 50);
    text("Vpp=" + str(2*vTest) +"V", 350, 70);
    text("Vmax=" + str(vTest) + "V", 350, 90);
    text("Freq=" + str(1000000/(2*halfPeriod)) + "Hz", 350, 110);
    text("Period=" + str(2*halfPeriod) + "us", 350, 130);
    text("Phase=" + String.format("%.2f", -360.0 * periodDiff / (2.0 * halfPeriod)) +"deg", 350, 150);

    stroke(255, 255, 0);
    drawSin(vRef, 100/halfPeriod, 0);

    stroke(0, 255, 255);
    periodDiff = lerp(periodDiff, periodDiff_tgt, 0.5);
    drawSin(vTest, 100/halfPeriod, periodDiff);
}

void drawSin(float amp, float freq, float phase) {
    float y=height/2, y_prev=height/2;
    for (int i = -width/2; i < width/2; i+= 1) {
        y_prev = y;
        y = (height/2)-80*amp*sin(freq * i * (360/TWO_PI) * 0.002 + phase * 0.0095833);
        strokeWeight(2);
        line(i+width/2-1, y_prev, i+width/2, y);
    }
}

void drawGrid() {
    stroke(150, 100);
    strokeWeight(1);
    for (int i = 0; i < height; i+=100) {
        line(0, i, width, i);
    }
    for (int j = 0; j < width; j+=100) {
        line(j, 0, j, height);
    }
}
