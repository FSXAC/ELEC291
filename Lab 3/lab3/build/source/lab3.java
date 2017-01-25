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



Serial  SPI_at89;
int     ADC_value;
int     BAUD_RATE = 115200;

public void setup() {
    

    // list number of ports
    printArray(Serial.list());

    // initialze serial
    SPI_at89 = new Serial(this, Serial.list()[0], BAUD_RATE);
    background(0);
}


int     ADC_number;
String  SPI_read;
float   V_out;
float   temperature;

int x = 0;
float y, y_prev, y_tgt;

public void draw() {
    if (SPI_at89.available() > 0) {
        SPI_read = SPI_at89.readString();
        println(SPI_read);

        if (SPI_read.length() > 3 && SPI_read != "\r\n") {
            SPI_read = SPI_read.substring(0, SPI_read.length()-2);
            SPI_read = SPI_read.replaceFirst("^0+(?!$)", "");

            try {
                ADC_number = Integer.parseInt(SPI_read);
            } catch (NumberFormatException e) {
                println(e);
            }

            V_out       = ADC_number / 1023.0f * 5;
            temperature = (V_out - 2.73f) * 100;

            // graphic
            if (temperature < -40) {
                temperature = -40;
            }
            y_prev = y;
            y_tgt  = map(temperature, -50, 120, height, 0);


            fill(0, 5);
            rect(0, 50, width, height-50);
            fill(0);
            rect(0, 0, width, 50);
            fill(20);
            rect(width - 80, 0, 80, height);

            y = lerp(y, y_tgt, 0.8f);
            stroke(
                map(y, 0.3f * height, 0.7f * height, 255, 0),
                (1 - sq(map(y, 0, height, -1, 1))) * 255,
                map(y, 0.3f * height, 0.7f * height, 0, 255)
                );
            strokeWeight(3);
            line(x, y, x-5, y_prev);
            if (x >= width - 80) {
                x = 0;
            } else {
                x+= 5;
            }
            noStroke();

            fill(255);
            text(String.format("%.2f", temperature) + " C", width - 75, y);
            text(String.format("%.4f", V_out) + " V", width - 75, y + 12);
        }
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
