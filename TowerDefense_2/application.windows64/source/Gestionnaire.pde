import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;
import java.io.FileReader;

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
