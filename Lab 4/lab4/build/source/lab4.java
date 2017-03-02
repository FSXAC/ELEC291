import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class lab4 extends PApplet {



final int BAUD_RATE = 115200;
Serial ser;
String serin;
String[] serinp = {"0", "0", "F"};
String unit;

// graph
int vres = 5;
int hres = 8;
String[] units = {"s", "ms", "us", "ns", "ps"};
int unitsIndex = 0;

int frequency     = 0;
float capacitance = 0;
float tau;

public void setup() {
    
    stroke(5);

    // list number of ports
    printArray(Serial.list());

    // initialze serial
    ser = new Serial(this, Serial.list()[0], BAUD_RATE);
    background(0);

    // read garbage
    ser.readStringUntil('$');
}

public void draw() {
    // tau = map(mouseX, 0, width, 1, 100);
    if (ser.available() > 0) {
        serin = ser.readStringUntil('\n');
        if (serin != null) {
            background(250);
            serin       = serin.substring(1, serin.length()-2);
            serinp      = serin.split(",");
            frequency   = Integer.parseInt(serinp[0]);
            capacitance = Float.parseFloat(serinp[1]);
            unit = serinp[2];
            tau = map(capacitance, 100, 1000, 1, 100);
            drawGrid(5, ceil(frequency/500.0f)*500);

            // display info
            text("Frequency: " + str(frequency) + " Hz", 200, 100);
            text("Period: " + String.format("%.2e", 1.0f/frequency) + "s", 200, 120);
            text("Capacitance: " + String.format("%.2f", capacitance) + unit, 200, 140);
        }
    }
}

public void drawGrid(float amplitude, int frequency) {
    // title
    textSize(24);
    textAlign(CENTER, CENTER);
    fill(0);
    text("Voltage in Capacitor-Under-Testing", width / 2, 40);

    // vertical axis (at x = 100)
    textSize(16);
    stroke(50);
    strokeWeight(1);
    line(100, 100, 100, height - 100);
    text("v(t) [V]", 100, 80);

    // horizontal axis
    line(100, height-100, width-100, height-100);

    // zero
    text("0", 65, height-80);

    // vertical minor axis
    stroke(200);
    for (int i = 1; i <= vres; i++) {
        int y = height-100-i*(height-200)/(vres+1);
        line(101, y, width-100, y);
        text(String.format("%.2f", (amplitude) / vres * i), 65, y);
    }

    // horizontal minor axis
    float delta_t = 0.25f / frequency; // quarter period
    // change units
    unitsIndex = 0;
    while (delta_t < 0.1f && unitsIndex < 4) {
        delta_t *= 1000;
        unitsIndex++;
    }
    for (int i = 1; i <= hres; i++) {
        int x = 100+i*(width-200)/(hres+1);
        line(x, height-101, x, 100);
        text(String.format("%.2f", i * delta_t), x, height-80);
    }
    text("t [" + units[unitsIndex] + "]", width-60, height-100);


    float y=0, y_old;
    strokeWeight(2);
    stroke(255, 0, 0);
    for (int t = 100; t < 100+4*89; t++) {
        y_old = y;
        y = 390*(1-exp(-(t-100)/tau));
        line(t, y_old+209, t, y+209);
    }
    for (int t=456; t<456+4*89; t++) {
        y_old = y;
        y = 390*(exp(-(t-456)/tau));
        line(t, y_old+209, t, y+209);
    }
    for (int t=812; t<812+1*89; t++) {
        y_old = y;
        y = 390*(1-exp(-(t-812)/tau));
        line(t, y_old+209, t, y+209);
    }
}
  public void settings() {  size(1000, 700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#272727", "--stop-color=#cccccc", "lab4" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
