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

public class lab3 extends PApplet {



Serial  at89;
int     ADC_value;
int     BAUD_RATE = 115200;

int   adc_value;
float adc_temperature;
float adc_voltage;
float clc_temperature;

int x = 0;
float y, y_prev, y_tgt;
float y2, y2_prev, y2_tgt;

float v_offset     = 0;
float v_offset_tgt = 0;

public void setup() {
    

    // list number of ports
    printArray(Serial.list());

    // initialze serial
    at89 = new Serial(this, Serial.list()[0], BAUD_RATE);
    background(0);

    // get rid of garbage values
    if (getStringSPI(611) < 1000) {
        getStringSPI(611);
    }
}

public void draw() {
    if (at89.available() > 0) {

        adc_value       = getStringSPI(adc_value);
        adc_temperature = getStringSPI(PApplet.parseInt(adc_temperature * 100)) / 100;

        // println(str(adc_value) + '\t' + str(adc_temperature));

        adc_voltage = adc_value / 1023.0f * 5;
        clc_temperature = (adc_voltage - 2.73f) * 100;

        // bound
        if (clc_temperature < -40) {
            clc_temperature = -40;
        }

        // fix adc temperature to signed


        // for graphics
        // rectangles
        fill(0, 5);
        rect(0, 0, width, height);
        fill(20);
        rect(width - 80, 0, 80, height);

        // lerp
        y_prev   = y;
        y_tgt    = map(clc_temperature, 0, 40, height - 50, 50);
        y2_prev  = y2;
        y2_tgt   = map(adc_temperature, 0, 40, height - 50, 50);
        y        = lerp(y, y_tgt, 0.7f);
        y2       = lerp(y2, y2_tgt, 0.7f);
        v_offset = lerp(v_offset, v_offset_tgt, 0.5f);

        stroke(
            map(y, 0.3f * (height - 50), 0.7f * (height - 50), 255, 0),
            sq(map(y, 0, height, -1, 1)) * 255,
            map(y, 0.3f * (height - 50), 0.7f * (height - 50), 0, 255)
            );
        line(x, y2 + v_offset, x-5, y2_prev + v_offset);
        strokeWeight(3);
        stroke(
            map(y, 0.3f * (height - 50), 0.7f * (height - 50), 255, 0),
            (1 - sq(map(y, 0, height, -1, 1))) * 255,
            map(y, 0.3f * (height - 50), 0.7f * (height - 50), 0, 255)
            );
        line(x, y + v_offset, x-5, y_prev + v_offset);

        if (x >= width - 80) {
            x = 0;
        } else {
            x+= 5;
        }
        noStroke();

        fill(255);
        text(String.format("%.2f", clc_temperature) + " C", width - 75, y + v_offset);
        text(String.format("%.4f", adc_voltage) + " V", width - 75, y + 12 + v_offset);
    }
}

public void mouseWheel(MouseEvent event) {
    v_offset_tgt += 20 * event.getCount();
}

public int getStringSPI(int default_val) {
    char readChar        = 'x';
    String readStr       = "";
    Boolean isFirstDigit = true;

    // loop through the first number (ADC number)
    while (readChar != '\r') {
        readChar = at89.readChar();
        if (isFirstDigit == true && readChar == '0') {
        } if (readChar != '\r') {
            readStr = readStr + readChar;
        }
        isFirstDigit = false;
    }

    // read and ignore \n
    at89.readChar();

    // return
    try {
        return Integer.parseInt(readStr);
    } catch (NumberFormatException e) {
        return default_val;
    }
}
  public void settings() {  size(500, 300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#272727", "--stop-color=#cccccc", "lab3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
