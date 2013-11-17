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
    
    largeur = a_w > 0 ? a_w : largeur;
    hauteur = a_h > 0 ? a_h : hauteur;
    
  }
  
  public void ajouterMur(int a_x, int a_y, String a_image, int a_w, int a_h)
  {
    
    murs.add(new Mur(a_x, a_y, a_image, a_w, a_h));
    
  }
  
  public void ajouterTour(String a_type, int a_x, int a_y, String a_image, int a_w, int a_h)
  {
    
    tours.add(new Tour(a_x, a_y, a_image, a_w, a_h));
    
  }
  
  public void ajouterTourEtPortee(String a_type, int a_x, int a_y, String a_image, int a_w, int a_h, int a_p)
  {
       
    tours.add(new Tour(a_x, a_y, a_image, a_w, a_h));
    tours.get(tours.size() - 1).setPortee(a_p);
    
  }
  
  public void ajouterTourEtPorteeEtPV(String a_type, int a_x, int a_y, String a_image, int a_w, int a_h, int a_p, int a_pv)
  {
    
    tours.add(new Tour(a_x, a_y, a_image, a_w, a_h));
    tours.get(tours.size() - 1).setPortee(a_p);
    tours.get(tours.size() - 1).setPV(a_pv);
    
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
