public class DisplayAccountlist {
	@auraenabled
    public static list<Account> getaccounts(){
        return [Select Name,NumberOfEmployees,Phone,Type,Industry from Account  Limit 10000];
    }
}