public class Page_Five_Exts {
    contact con = new Contact();
    public string Name;
    ApexPages.standardController scontroller;
    public Page_Five_Exts(ApexPages.StandardController controller){
        scontroller = controller;
    }
    public void Autopopulate(){
        con = (Contact)scontroller.getRecord();
        con.Account=[Select Name From Account Where Id =: con.AccountId];
        con.ContactName__c = con.Account.Name;
    }
    public pageReference save(){
        insert con;
        return null;
    }
 	   
}