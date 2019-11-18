const grid=1.6;            //elementarna odległośc między punktami (w pixelach)
const low=-0.005;          //minimalna losowana wartość
const high=7;              //maksymalna losowana wartość
const nScale=0.02*grid;    //skalowanie szumu Perlina
const power=5;             //potęga do której podnoszona jest wartość szumu
const scale_power=2;       //potęga do której ponoszony jest szum przy skalowaniu
const opacity=60;            //średnia przezroczystość sześcokątów

function setup() {
  createCanvas(700, 500);
  noStroke();
  colorMode(HSB,255);
 
}

function draw() {
  background(70);
  hex_shape(200,100,0.5,200,255);
}

function generate()
{
  background(255);
  for(let x=0;x<width;x+=grid)
  {
    for(let y=0;y<height;y+=grid)
    {
      if(random(low,high)<pow(noise(x*nScale,y*nScale),power))  //decydowanie czy pojawi się sześcokąt
      {
        //jeśli losowa wartość z przedziału jest mniejsza od potęgi szumu perlina dla danego 'x' i 'y'
        //w danym punkcie zaraz pojawi się sześcoikąt (czyli im większa wartośc szumu, tym większa szansa że pojawi się sześciokąt
  
        hex_shape(x*grid,y*grid,1-pow(noise(x*nScale,y*nScale),scale_power)*2,random(0,255),random(opacity-10,opacity+10));  
      }
    }
  }
}

function hex_shape(x,y,size,hue,alpha)
{
  translate(x,y);
  scale(size);
  fill(hue,255,255,alpha);
  beginShape();
  vertex(0,-100);
  vertex(86,-50);
  vertex(86,50);
  vertex(0,100);
  vertex(-86,50);
  vertex(-86,-50);
  vertex(0,-100);
  endShape();
}
