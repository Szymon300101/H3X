float grid=1.5;            //elementarna odległośc między punktami (w pixelach)
float low=-0.005;          //minimalna losowana wartość
float high=7;              //maksymalna losowana wartość
float nScale=0.02*grid;    //skalowanie szumu Perlina
float power=5;             //potęga do której podnoszona jest wartość szumu
float scale_power=2;       //potęga do której ponoszony jest szum przy skalowaniu
int opacity=50;            //średnia przezroczystość sześcokątów

PShape hex;

void setup()
{
  size(800,600);
  //fullScreen();
  noStroke();
  colorMode(HSB,255);
  
  hex = createShape();      //definiowanie sześciokąta
  hex.beginShape();
  hex.noStroke();
  hex.fill(255);
  hex.vertex(0,-100);
  hex.vertex(86,-50);
  hex.vertex(86,50);
  hex.vertex(0,100);
  hex.vertex(-86,50);
  hex.vertex(-86,-50);
  hex.vertex(0,-100);
  hex.endShape();
  
  generate();
}

void draw()
{
}

void generate()        //generowanie obrazu
{
  background(255);
  for(float x=0;x<width;x+=grid)
    for(float y=0;y<height;y+=grid)
      if(random(low,high)<pow(noise(x*nScale,y*nScale),power))  //decydowanie czy pojawi się sześcokąt
      {
        //jeśli losowa wartość z przedziału jest mniejsza od potęgi szumu perlina dla danego 'x' i 'y'
        //w danym punkcie zaraz pojawi się sześcoikąt (czyli im większa wartośc szumu, tym większa szansa że pojawi się sześciokąt
        
        pushMatrix();
        translate(x*grid,y*grid);
        scale(1-pow(noise(x*nScale,y*nScale),scale_power)*2);    //skalowanie sześcokąta do wyświetlenia (jest "odwrotnie proporcjonalne" do zagęszczenia sześciokątów)
        hex.setFill(color(random(0,255),255,255,random(opacity-10,opacity+10)));  //ustalanie losowego koloru sześcokąta
        shape(hex,0,0);
        popMatrix();
      }
}



void keyPressed()
{
  println(keyCode);
  if(keyCode==32) generate();
  if(keyCode==10) saveFrame();
}
