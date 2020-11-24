public class AccountList {
    public List<account> accMap  = new List<Account>();
    
    
    public List<Account> getaccmap(){        
        try{
            accMap=[Select Name from Account Limit 1001];           
            
        }
        catch ( exception e ){
            ApexPages.Message msg = new ApexPages.message(ApexPages.Severity.Error,'Error'+e.getMessage());
            //ApexPages.addMessage(msg);
            
        }  
        return accmap;
    }
    
    
    
    
}