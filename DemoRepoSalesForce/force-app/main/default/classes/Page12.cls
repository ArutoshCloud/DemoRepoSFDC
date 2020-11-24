public class Page12 {
    public list<account> acclist = new List<Account>();
    public string keyword {get;set;}
    public string getKeykeyword(){
        return keyword;
    }
    public list<account> getacclist(){
        return acclist;
    }
    public void setKeykeyword(string myid){
        keyword = myid;
    }
    public pageReference search(){
        Account acc = [Select Name From Account Where Name =: keyword];
        acclist = [Select Name from Account Where ParentId =: acc.id];
        return null;
    }
}