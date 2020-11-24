@isTest
public class LeadProcessorTest {
    @TestSetup
    public static void testfunction() {
        List<Lead> leadList = new List<Lead>();
        for(integer i=1; i<=200; i++) {
            Lead leadObj = new Lead();
            leadObj.FirstName = 'first'+i;
            leadObj.LastName = 'Last'+i;
            leadObj.Company = 'cloud analogy';
            leadObj.LeadSource = 'Web';
            leadList.add(leadObj);
            
        }
        insert(leadList);
    }
    public static testmethod void test() { 
        Test.startTest();
          LeadProcessor leadObj = new LeadProcessor();
          Id batchId = Database.executeBatch(leadObj);
        Test.stopTest();
        system.assertEquals(200,[Select count() From Lead Where LeadSource='Dreamforce']);
           
            
        }

}