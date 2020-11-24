public class PageNewNineControl {
    public account a  = new Account();
    public account geta(){
        return a;
    }
    
    public pageReference save(){       
        system.debug('insert');
        insert a;
        return null;  
       
    }
}