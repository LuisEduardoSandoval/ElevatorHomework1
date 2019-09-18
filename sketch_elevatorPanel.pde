import controlP5.*;
ControlP5 cp5,cp6;

PFont font;

Button panel;

elebtn myelebtn1;
elebtn myelebtn2;
elebtn myelebtn3;
elebtn myelebtn4;
FireButton myFireButton;
doorcontrol myDoor;

clock myclock;

weather myweather;

void setup()
{
  size(342,600);
  font = createFont("Calibri-Light-48",48); //font modification
  textFont(font);
  
  myFireButton = new FireButton(cp6 = new ControlP5(this),100,100);
  
  myclock = new clock(); //creates new clock object
  
  myweather = new weather(280,500); //creates new weather object
  
  
  cp5 = new ControlP5(this); //control p5 button initiation
  
  myelebtn4 = new elebtn(cp5 = new ControlP5(this),140,240,"4"); //buttons appended to elevator panel
  
  myelebtn3 = new elebtn(cp5 = new ControlP5(this),140,290,"3");
  
  myelebtn2 = new elebtn(cp5 = new ControlP5(this),140,340,"2");
  
  myelebtn1 = new elebtn(cp5 = new ControlP5(this),140,390,"1");
  

  
 
}

void draw()
{
  

  
  background(64,64,64);
  myFireButton.display();
  myelebtn4.display(140,240,4);
  myelebtn3.display(140,290,3);
  myelebtn2.display(140,340,2);
  myelebtn1.display(140,390,1);

  myclock.getTime();
  myclock.display();
  myweather.display();
  
}


class elebtn
{
  final ControlP5 cp5;
  int xpos;
  int ypos;
  int number;
  String btnN;
  

  void display(int xpos, int ypos, int number)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.number = number;
    noStroke();
    rectMode(CENTER);
    
    fill(0);
    rect(xpos+40,ypos,80,40);
    fill(160,160,160);
    rect(xpos,ypos,40,40);
    fill(200,200,200);
    textSize(40);
    text(number,xpos+50,ypos-27);

  }
  elebtn(final ControlP5 controlP5,int xpos, int ypos,String btnN)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    //(cp5 = controlP5).addButton("",1,xpos-15,ypos-15,30,30);
    
    
    (cp5 = controlP5).addButton(btnN)
      .setPosition(xpos-15,ypos-15)
      .setSize(30,30)
      .setValue(0)
      .setColorBackground(0xFF404040)
      .setColorForeground(0xFF404040)
      .setColorActive(0xFFFFFFFF)
      .setLabelVisible(false);
        
      
      
      
  }



}
class doorcontrol
{
  int xpos;
  int ypos;
  
  doorcontrol(final ControlP5 controlP5,int xpos,int ypos)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    (cp6 = controlP5).addButton("DoorControl")
    .setPosition(xpos,ypos);
    
  }
  void display()
  {
    
  }
}


class clock
{ int h,m,t;
  int d,mon,y;
  int weekday;
  String weekdayStr;
  String TimeDesignation;
  clock()
  {}
  void getTime()
  {
    h = hour();
    m = minute();
    d = day();
    mon = month();
    y = year();
    
    
    //determining am or pm
    if(hour() > 12)
    {
      TimeDesignation = "PM";
      h = h - 12;
    }
    else
    {
      TimeDesignation = "AM";
      
    }
    //algorithm to determine date of day
    
    weekday = (d+mon+y + (y/4) +23) % 7;
    
    if(weekday == 1)
    {
      weekdayStr = "SUN";
    }
    if(weekday == 2)
    {
      weekdayStr = "MON";
    }
    if(weekday == 3)
    {
      weekdayStr = "TUE";
    }
    if(weekday == 4)
    {
      weekdayStr = "WED";
    }
    if(weekday ==5)
    {
      weekdayStr = "THRS";
    }
    if(weekday ==6)
    {
      weekdayStr = "FRI";
    }
    if(weekday ==7)
    {
       weekdayStr = "SAT";  
     
    }
      
 }
  
  void display()
  {
    textSize(40);
    textAlign(CENTER,TOP);
    fill(255,255,255);
    text (h + ":" + nf(m, 2),100,500);
    
    //am or pm signal
    textSize(12);
    text(TimeDesignation,160,500);
    //date
    text(weekdayStr +" SEPTEMBER "+ nf(d),100,480);
    
    
    

  }

}


class weather
{
  int tempature =88;
  int xpos,ypos;
  
  
  
  weather(int xpos, int ypos)
  {
    this.xpos = xpos;
    this.ypos = ypos;
  }
  void display()
  {
    noStroke();
    fill(255,255,154);
    circle(xpos-45,ypos+27,30);
    fill(255,255,255);
    textSize(40);
    text(tempature,xpos,ypos);
    textSize(12);
    text("LUBBOCK",xpos,ypos-20); //280, 500
    text("F",xpos+28,ypos);
  }
  
}

class FireButton
{
  int xpos,ypos;
  FireButton(final ControlP5 controlP5, int xpos, int ypos)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    
      (cp6 = controlP5).addButton("fireControl")
      .setPosition(xpos+45,ypos-25)
      .setSize(50,25)
      .setValue(0)
      .setColorBackground(#ff2f00)
      .setColorForeground(#ff2f00)
      .setColorActive(0xFFFFFFFF)
      .setLabelVisible(false);
      (cp6 = controlP5).addButton("Assistance")
      .setPosition(xpos+45,ypos)
      .setSize(50,25)
      .setColorBackground(0xFF404040)
      .setColorForeground(0xFF404040)
      .setLabelVisible(false);
      
  }
  void display()
  {
    rectMode(CENTER);
    fill(255,51,51);
    rect(xpos,ypos,600,100);
    fill(255,255,255);
    text("Fire Operation",171,ypos-50);
    text("Assistance",171,ypos +30);
    rect(xpos+70,ypos,60,60);
    
  }
}


void controlEvent(ControlEvent theEvent)
{
  
  println(theEvent.getName());
  if(theEvent.getController().getName()=="1")
  {
    
  }
  if(theEvent.getController().getName() =="2");
  {
    
  }
}
