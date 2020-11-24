@istest
public class AddPrimaryContactTest {

    static testmethod void testqueueable(){
                List<Account> acclist =new List<Account>();
        for(integer i = 0;i<50;i++){
            acclist.add(new Account(Name='Account'+i,BillingState = 'NY'));
        }
        for(integer i = 0;i<50;i++){
            acclist.add(new Account(Name='Account'+i,BillingState = 'CA'));
        }
        insert acclist;
        Contact con = new contact();
        con.LastName = 'Roshan';
        insert con;
        string str='CA';

        Test.startTest();
        AddPrimaryContact apt = new AddPrimaryContact(con,str);
        System.enqueuejob(apt);
        Test.StopTest();
        System.assertequals(Integer.valueof([Select count() from contact where AccountId in : acclist ANd Account.BillingState = 'CA']),50);
        
    }
    
}