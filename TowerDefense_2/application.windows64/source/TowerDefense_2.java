import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import javax.script.ScriptEngineManager; 
import javax.script.ScriptEngine; 
import java.io.FileReader; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class TowerDefense_2 extends PApplet {

Gestionnaire gest;

public void setup()
{
  size(800, 600);
  noSmooth();
  
  gest = new Gestionnaire();
  gest.chargerCarte("data/niveaux/test.js");
  
}

public void draw()
{
  
  background(255, 255, 255);
  gest.afficher(); 
  
}
/**CONTIENT LES INFORMATIONS SUR L'ESPACE DE JEU :
MURS, TOURS, ENNEMIS, DEFENSES, ETC.*/

class Carte
{
  
  public int largeur, hauteur;  
  
  public ArrayList<Mur> murs;
  public ArrayList<Tour> tours;
  public ArrayList<Point> spawns;
  public ArrayList<Point> arrives;
  
  public Carte() //Ne possede qu'un constructeur, car toutes les donnees sont initialisees dans le script JS par le Gestionnaire
  {
   
    largeur = 0;
    hauteur = 0;    
    
    murs = new ArrayList<Mur>();
    tours = new ArrayList<Tour>();
    spawns = new ArrayList<Point>();
    arrives = new ArrayList<Point>();
    
  }
  
  public void definirTaille(int a_w, int a_h)
  {
    
    largeur = a_w;
    hauteur = a_h;
    
  }
  
  public void ajouterMur(int a_x, int a_y, String a_image, int a_w, int a_h)
  {
    
    murs.add(new Mur(a_x, a_y, a_image, a_w, a_h));
    
  }
  
  public void ajouterTour(int a_x, int a_y, String a_image, int a_w, int a_h)
  {
    
    tours.add(new Tour(a_x, a_y, a_image, a_w, a_h));
    
  }
  
  public void ajouterTourEtPortee(int a_x, int a_y, String a_image, int a_w, int a_h, int a_p)
  {
       
    tours.add(new Tour(a_x, a_y, a_image, a_w, a_h));
    tours.get(tours.size() - 1).setPortee(a_p);
    
  }
  
  public void ajouterSpawn(int a_x, int a_y)
  {
    
    spawns.add(new Point(a_x, a_y));
    
  }
  
  public void ajouterArrive(int a_x, int a_y)
  {
    
    arrives.add(new Point(a_x, a_y));
    
  }
  
  public void afficher()
  {
    
    for(int i = 0; i < murs.size(); i++){
      murs.get(i).afficher();
    }
    
    for(int i = 0; i < tours.size(); i++){
      tours.get(i).afficher(); 
    }
    
  }
  
}




class Gestionnaire
{    
  
  Carte carte;
  
  public Gestionnaire()
  {
    
    carte = new Carte();
    
  }
  
  public void chargerCarte(String a_script)
  {
    
    ScriptEngineManager manager = new ScriptEngineManager();  
    ScriptEngine interpreteur = manager.getEngineByName("JavaScript");
    
    FileReader reader;
    
    try{
      
      reader = new FileReader(a_script);
      interpreteur.put("carte", carte);
      interpreteur.eval(reader);
      carte = (Carte)interpreteur.get("carte");
      
    }
    
    catch(Exception e){
      
      e.printStackTrace();
      
    }
    
  }
  
  public String[] chargerFichier(String a_fichier)
  {
    
    String[] lignes = loadStrings(a_fichier);
    
    if(lignes == null) return null;
    return lignes;
    
  }
  
  public void afficher()
  {
    
    carte.afficher();
    
  }
  
}
/**CONTIENT LES INFORMATIONS A DONNER A L'UTILISATEUR : 
PTS DE VIE, OR, TOURS A POSER, ETC.
/** OBJET SUR LEQUEL POSER LES TOURS */

class Mur extends Objet
{
  
  public Mur()
  {
    
    super();
    
  }
  
  public Mur(int a_x, int a_y)
  {
    
    super(a_x, a_y);
    
  }
  
  public Mur(int a_x, int a_y, String a_image, int a_w, int a_h)
  {
    
    super(a_x, a_y, a_image, a_w, a_h);
    
  }
  
}
/** CLASSE DE BASE, OU LES AUTRES VONT HEITER */

class Objet
{
  
  Point coord;
  PImage image;
  
  public Objet()
  {
    
    image = loadImage("img/defaut.png");
    coord = new Point(0, 0, 0, 0);
    
  }
  
  public Objet(int a_x, int a_y)
  {
    
    image = loadImage("img/defaut.png");
    coord = new Point(a_x, a_y, 60, 60);
    
  }
  
  public Objet(int a_x, int a_y, String a_image)
  {
    
    image = loadImage(a_image);
    coord = new Point(a_x, a_y, 60, 60);
    
  }
  
  public Objet(int a_x, int a_y, String a_image, int a_w, int a_h)
  {
    
    image = loadImage(a_image);
    coord = new Point(a_x, a_y, a_w, a_h);
    
  }
  
  public void afficher()
  {

    rectMode(CENTER);
    tint(255, 255, 255, 255);
    image(this.image, coord.x - coord.w/2, coord.y - coord.h/2, coord.w, coord.h);
    
  }
  
}

/**CONSTITUEE D'UNE ABSISSE/ORDONEE/LARGEUR/HAUTEUR*/

class Point
{
  
  public int x, y, w, h;
  
  public Point(int a_x, int a_y)
  {
    
    this(a_x, a_y, 0, 0);
    
  }
  
  public Point(int a_x, int a_y, int a_w, int a_h)
  {
    
    x = a_x;
    y = a_y;    
    w = a_w;
    h = a_h;
    
  }
  
}
class Tour extends Objet
{
  
  int portee;
  
  public Tour()
  {
    
    super();
    portee = 0;
    
  }
  
  public Tour(int a_x, int a_y)
  {
    
    super(a_x, a_y);
    portee = 0;
    
  }
  
  public Tour(int a_x, int a_y, String a_image, int a_w, int a_h)
  {
    
    super(a_x, a_y, a_image, a_w, a_h);
    portee = 0;
    
  }
  
  public void setPortee(int a_portee)
  {
    
    portee = a_portee > 0 ? a_portee : portee;
    
  }
  
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TowerDefense_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
