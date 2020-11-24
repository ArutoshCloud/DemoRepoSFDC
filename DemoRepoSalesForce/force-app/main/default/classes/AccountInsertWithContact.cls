public class AccountInsertWithContact {
@auraenabled
public static account createRecord(string accName){
account accObj = new account();
try{
if(accName != Null && accName != ''){
    
    accObj.Name = accName;
    insert accObj;
}


}
catch(DmlException dex){
system.debug('Error During Insertion::: '+dex.getmessage());
}
return accObj;

}
@auraenabled
public static void createRecordandcontact(string accName){
    try{
        Account accObj = new Account();
        accObj = AccountInsertWithContact.createRecord(accName);
contact conObj = new contact();
conObj.LastName = accObj.Name;
conObj.accountId = accObj.id;
        insert conObj;
}
catch(DmlException dex){
system.debug('Error During Insertion::: '+dex.getmessage());
}
}

}