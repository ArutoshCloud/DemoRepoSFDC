public with sharing class AccountControllertoDisplayData {

//public string searchvalue;
public AccountControllertoDisplayData() {

}
@AuraEnabled(cacheable = true)
public static list<account> getAccounts(){
    return [Select id,Name From Account Limit 10];
}
@AuraEnabled
    public static list<account> getAccountRecordsList(string searchKey){
        system.debug(searchKey);
        if(searchKey == ''){
            return [Select id,Name,Industry,Phone From Account Limit 10];
        }
        else{
            string searchvalue = searchKey+'%';
            return [Select id,Name,Industry,Phone From Account where Name Like : searchvalue Limit 10];
        }

}
}