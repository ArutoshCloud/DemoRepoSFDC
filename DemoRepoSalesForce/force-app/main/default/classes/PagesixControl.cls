public class PagesixControl {
 
    
    public apexpages.standardsetcontroller setcon{
        get{
            if(setcon==null){
                setcon = new ApexPages.standardsetcontroller(database.getQueryLocator
                                   ([select name from account limit 200]));
                                                            
            }
            return setcon;
        }
        set;
    } 
    public list<account> getaccounts(){
        system.debug(setcon.getRecords());
        setcon.setpagesize(10);
        if(setcon!=null){
            return (list<account>)setcon.getRecords();
        }
        return null;
       
    }
    
}