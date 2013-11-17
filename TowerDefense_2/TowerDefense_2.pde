Gestionnaire gest;
int dureeEcoulee, delta, dureeClic;
float frameRate;
boolean mouseClicked;
boolean locked = false;
char touche;
PFont font = createFont("Calibri", 20);

void setup()
{
  size(800, 600);
  frame.setResizable(true);
  noSmooth();
  
  gest = new Gestionnaire();
  gest.chargerCarte("data/niveaux/test.js");
  
  textFont(font, 20);
  
  dureeEcoulee = 0;
  delta = 0;
}

void draw()
{
  
  updateDelta();
  
  background(200, 200, 200);
  gest.actualiser(mouseX, mouseY, mousePressed, mouseClicked, touche, delta);
  touche = '0';
  gest.afficher(); 
  
  mouseClicked = false;
  overlapse();
  
}

void keyPressed()
{
  
  touche = key;
  
}

void updateDelta()
{
  
  delta = dureeEcoulee;
  dureeEcoulee = millis();
  delta = dureeEcoulee - delta;
  
  if(locked){
    dureeClic += delta; 
  }
  
}

void mouseReleased()
{
 
  if(dureeClic < 500){
    mouseClicked = true;
  }

  locked = false;
  dureeClic = 0;
  
}

void mousePressed()
{
  
  dureeClic += delta;
  locked = true;
  
}

void overlapse()
{
 
  if(delta != 0){
    frameRate = 1 / (delta * 0.001);
  }
  text("" + (int)frameRate, 50, 550);
  
}
