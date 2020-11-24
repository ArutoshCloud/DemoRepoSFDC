public class Page_Four_cont {
    Public string keyword;
    public boolean ischanged {get;set;}
   // public List<Account> accts;
    public list<Account> fullaccts = [Select Name,Phone,ShippingPostalCode,shippingCity From Account Limit 100];
   /* public List<Account> getaccts(){
        system.debug('getaccts');
        return accts;   
        
    }*/
    public List<Account> getfullaccts(){
        
        system.debug('getacc');
        
        return fullaccts;
    }

    public string getkeyword(){
        system.debug('get');
        return keyword;   
    }
    public void setkeyword(string s){
        system.debug('set');
        Keyword = s  ;
    }
    
    public pageReference search(){
        system.debug('page');
        system.debug(ischanged);
        
        fullaccts = (List<Account>)[Find :keyword Returning Account(Name,Phone,ShippingPostalCode,ShippingCity)][0];
        if(fullaccts != Null && fullaccts.size()>0){
            ischanged = true;
        }
        system.debug(ischanged);
        return null;
    }

}