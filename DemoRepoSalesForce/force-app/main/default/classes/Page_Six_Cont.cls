public class Page_Six_Cont {
    public list<Account> acclist  = [select Name,Type,Industry,Phone,Fax From Account limit 200];
    public Page_six_cont(ApexPages.StandardSetController controller){ }
    public list<Account> getacclist(){
        return acclist;
    }

    

}