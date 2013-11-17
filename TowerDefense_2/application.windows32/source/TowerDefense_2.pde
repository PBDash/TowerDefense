Gestionnaire gest;

void setup()
{
  size(800, 600);
  noSmooth();
  
  gest = new Gestionnaire();
  gest.chargerCarte("data/niveaux/test.js");
  
}

void draw()
{
  
  background(255, 255, 255);
  gest.afficher(); 
  
}
