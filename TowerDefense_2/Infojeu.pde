class Infojeu
{
  
  public HashMap<String, Object> valeurs;
  
  public Infojeu()
  {
    
    valeurs = new HashMap<String, Object>();
    valeurs.put("OR", 100);
    valeurs.put("VIES", 6);
    valeurs.put("SELECTION", "NULL");
    
  }
  
  public String getString(String val)
  {
    
    if(valeurs.get(val) instanceof String){
      return (String)valeurs.get(val);
    }
    
    if(valeurs.get(val) instanceof Integer) return ""+ (Integer)valeurs.get(val);
    
    return "NULL";
    
  }
  
  public Object get(String val)
  {
    
    return valeurs.get(val);
    
  }
  
  public void set(String num, Object arg)
  {
    
    valeurs.put(num, arg);
    
  }
  
}
