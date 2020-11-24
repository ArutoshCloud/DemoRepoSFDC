@isTest
public class AccountManagerTest {
    @isTest static void TestgetAccount(){
        Id thisAccId = AccountManagerTest.createTestAccount();
        RestRequest req = new RestRequest();
        req.requestURI = 
            'https://cloudanalogycom3-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+thisAccId+'/contacts/';
        req.httpMethod = 'GET';
        RestContext.request = req;
        account thisAcc = AccountManager.getAccount();
        System.assert(thisAcc != null);
        System.assertEquals(thisAcc.Name,'Test Account');
    }
    static Id createTestAccount(){
        Account acc = new Account(Name='Test Account');
        insert acc;
        contact contact = new contact(accountId = acc.id,LastName='Test Contact');
        insert contact;
        return acc.id;
    }
}