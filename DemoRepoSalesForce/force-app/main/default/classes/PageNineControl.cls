public class PageNineControl {
	public account a = new account();
    public account geta(){
        return a;
    }
    public PageReference sav(){
        insert a;
        system.debug(a);    
        return null;
    }
}