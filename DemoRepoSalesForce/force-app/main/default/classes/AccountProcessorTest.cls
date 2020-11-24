@istest
public class AccountProcessorTest {
    public static testmethod void testBatchable(){
        Test.StartTest();
        Id jobId = Database.executeBatch(new AccountProcessor());
        Test.StopTest();
       
    }
}