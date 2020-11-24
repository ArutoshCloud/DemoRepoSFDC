global class AccountProcessor implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        /*return Database.getQueryLocator('Select Name From Account Where CreatedDate = Last_N_Days : 10');*/
        return Database.getQueryLocator('Select Name From Opportunity limit 1');
    }
    global void execute(Database.BatchableContext bc, List<Opportunity> opplist){
        /*List<Account> Accounts = new List<Account>();
        for(Account acc : acclist){
            Accounts.add(acc);
        
        }
        Database.delete(Accounts,false);*/
       
        List<Opportunity> opportunities = new List<Opportunity>();
        for(integer i =0 ; i<5;i++){
        Opportunity opp = new Opportunity();
            opp.Name = 'Water Genrator'+i;
            opp.StageName = 'Need Analysis';
            opp.CloseDate = system.Today().addDays(25);
            opportunities.add(opp);
        }
        insert opportunities;
        
    }
    global void finish(Database.BatchableContext bc){
        AsyncApexJob job = [Select id,Status,NumberOfErrors,JobItemsProcessed,TotalJobItems
                           from AsyncApexJob Where id =: bc.getJobid()];
        System.debug(job);
    }
}