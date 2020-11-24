@istest
public class DailyLeadProcessorTest {
    public static string cron_exp = '0 0 10 * * ?';
    static testmethod void testscheduledjob(){
        List<Lead> leadlist = new List<Lead>();
        for(integer i =0 ;i<200;i++){
            Lead ld = new Lead();
            ld.LastName = 'stark'+i;
            ld.Company = 'Stark Industries';
            leadlist.add(ld);
        }
        if(leadlist.size()>0){
            insert leadlist;
        }
        Test.startTest();
        Id jobId = System.schedule('New lead',cron_exp, new DailyLeadProcessor());
        test.stopTest();
        System.assertEquals(200,integer.valueof([Select count() From lead Where Id in : leadlist And LeadSource = 'Dreamforce']));
        
        
    }

}