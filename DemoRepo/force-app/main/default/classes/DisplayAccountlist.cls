public class DisplayAccountlist {
	@auraenabled
    public static list<Account> getaccounts(){
        try{
                    return [Select Name,NumberOfEmployees,Phone,Type,Industry from Account Where NumberOfEmployees != Null
                And Phone != Null Limit 20];
        }
        catch(exception ex){
            System.debug('Error--->>>'+ex.getMessage());
        }
        return null;
    }
}