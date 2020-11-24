public class AccountContactOppInPicklistController {
    @auraenabled
    public static List<Account> getaccounts(){
        return [select Name from Account ORDER BY createdDate Desc];
    }
    @auraenabled
    public static list<contact> getcontacts(string accid){
        return [select LastName,FirstName,Account.Name From Contact Where AccountId =: accid];
    }
    @auraenabled
    public static list<Opportunity> getopportunities(string accid){
        return [select Name From Opportunity Where AccountId =: accid];
    }
}