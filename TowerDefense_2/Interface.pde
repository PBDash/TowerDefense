/**CONTIENT LES INFORMATIONS A DONNER A L'UTILISATEUR : 
PTS DE VIE, OR, TOURS A POSER, ETC.*/

import java.util.Set;

class Interface
{
  public Minicarte minicarte;
  public HashMap<String, Bouton> boutons;
  public HashMap<String, PopUp> popups;
  public HashMap<String, PointColore> rectangles;
  ArrayList<Point> pts = new ArrayList<Point>();
  
  public Interface()
  {
   
    minicarte = new Minicarte();
    boutons = new HashMap<String, Bouton>();
    popups = new HashMap<String, PopUp>();
    rectangles = new HashMap<String, PointColore>();
    
  }
  
  public void setBoutons(String type)
  {
    
    if(type.equals("JEU")){
      
      boutons.put("PAUSE", new Bouton(700, 50, 150, 50, "data/img/ui/pause.png", "PAUSE"));
      boutons.get("PAUSE").setPosImage(-25, 25, 25, 25);
      boutons.get("PAUSE").setPosTexte(0, 0, 100, 50);
      
      boutons.put("OR", new Bouton(650, 125, 100, 50, "data/img/ui/or.png", ""));
      boutons.get("OR").setPosImage(0, 25, 40, 40);
      boutons.get("OR").setPosTexte(25, 15, 50, 50);
      boutons.get("OR").setActualiser("OR");
      
      boutons.put("AJOUT", new Bouton(700, 550, 150, 50, null, "AJOUTER"));
      boutons.get("AJOUT").setPosTexte(-25, 10, 100, 50);
      
    }
    
  }
  
  public void actualiser(int mouseX, int mouseY, boolean mousePressed, boolean mouseClicked, Infojeu infos)
  {
    
    Carte car = (Carte)infos.get("CARTE");
    Point cam = (Point)infos.get("CAMERA");
    
    actualiserMinicarte(car, cam);
      
    if(mouseClicked){
 
      if(trouverBoutonHover(mouseX, mouseY).equals("PAUSE")){
        exit();
      }
      
      if(trouverBoutonHover(mouseX, mouseY).equals("AJOUT")){
        popups.put("AJOUT_POPUP", new PopUp(300, 300, 400, 400)); 
        popups.get("AJOUT_POPUP").ajouterBouton("TOUR-1", 0, 0, 200, 100, "img/objets/tour.png", "Ajouter tour de base");
        popups.get("AJOUT_POPUP").setBoutonPosImage("TOUR-1", -50, 0, 100, 100);
        popups.get("AJOUT_POPUP").setBoutonPosTexte("TOUR-1", 50, 0, 100, 100);
      }
      
      if(trouverPopUpHover(mouseX, mouseY).equals("AJOUT_POPUP")){

        if(popups.get("AJOUT_POPUP").trouverBoutonHover(mouseX, mouseY) != null && popups.get("AJOUT_POPUP").trouverBoutonHover(mouseX, mouseY).equals("TOUR-1")){
          infos.set("AJOUT_EN_COURS", true);
          popups.remove("AJOUT_POPUP");
        }        
      }

      
    }
    

    
    //(2) : A mettre avant le (1) car sinon, le texte n'est pas mis à jour
    
    if(infos.get("SELECTION") != null && infos.get("SELECTION") instanceof Tour){
      Tour tmp = (Tour)infos.get("SELECTION");
      rectangles.put("HALO", new PointColore(tmp.coord.x - tmp.coord.w/2, tmp.coord.y - tmp.coord.h/2, tmp.coord.w, tmp.coord.h, 125, 255, 125));
      boutons.put("CARAC", new Bouton(500, 525, 200, 100, "img/ui/coeur.png", ""+ tmp.pv));
      boutons.get("CARAC").setPosTexte(25, 0, 50, 50); 
      boutons.get("CARAC").setPosImage(0, 25, 60, 60);
      
    }
    
    else{
      rectangles.remove("HALO"); 
      boutons.remove("CARAC");  
    }

    //(1)
    
    Set<String> set = boutons.keySet();
    
    for(String s : set){
      
      String tmp = boutons.get(s).getActualiser();
    
      if(!tmp.equals("NULL")){
        
        boutons.get(s).setTexte(infos.getString(tmp));
        
      }
      
    }
  }
  
  public String trouverBoutonHover(int mouseX, int mouseY)
  {
    
    Set<String> set = boutons.keySet();
    
    for(String s : set){
     
      if(boutons.get(s).hover(mouseX, mouseY)){
        return s;
      }
      
    }
    
    return "NULL";
    
  }
  
  public String trouverPopUpHover(int mouseX, int mouseY)
  {
    
    Set<String> set = popups.keySet();
    println(set.size());
    
    for(String s : set){
     
      if(popups.get(s).hover(mouseX, mouseY)){
        return s;
      }
      
    }
    
    return "NULL";
    
  }
  public void afficher(final Infojeu infos)
  {
    
    
    Point cam = (Point)infos.get("CAMERA");
    
    Set<String> set;

    set = rectangles.keySet();
    
    for(String s : set){
     
      PointColore p = rectangles.get(s);
      noFill();
      stroke(p.couleur);
      strokeWeight(3);
      rectMode(CENTER);
      rect(p.x - cam.x, p.y - cam.y, p.w, p.h);
      strokeWeight(1);
      
    }
    
    minicarte.afficher();
    
    stroke(255);
    rectMode(CORNERS);
    fill(100, 80, 60);
    rect(600, 0, 800, 600);
    line(600, 0, 600, 600);
    line(600, 100, 800, 100);
    
    set = boutons.keySet();
    
    for(String s : set){
     
      boutons.get(s).afficher();
      
    }
    
    set = popups.keySet();
    
    for(String s : set){
     
      popups.get(s).afficher();
      
    }    
    
  }
  
  public void actualiserMinicarte(Carte a_carte, Point camera)
  {
    
    minicarte.clear();
    minicarte.setDimensions(a_carte.largeur, a_carte.hauteur);
    minicarte.setCamera(camera);
    
    for(int i = 0; i < a_carte.tours.size(); i++){
      
      minicarte.ajouterPoint(a_carte.tours.get(i).coord.x, a_carte.tours.get(i).coord.y, "TOUR");
      
    }
    
    for(int i = 0; i < a_carte.murs.size(); i++){
      
      minicarte.ajouterPoint(a_carte.murs.get(i).coord.x, a_carte.murs.get(i).coord.y, "MUR");
      
    }
    
  }
  
}

