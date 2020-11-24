public class createcontactcontroller {
    public static string accntId;
	@auraenabled
    public static List<Account> getaccount(string searchkeyword){
        string str = searchkeyword;
        List<account> accname = [select Name From Account Where Name Like :searchKeyword +'%'];
        system.debug(searchkeyword);
        return str == ''? [select Name From Account Where Name Like '%%' limit 6]:[select Name From Account Where Name Like :searchKeyword +'%'];
    }
    
    
}