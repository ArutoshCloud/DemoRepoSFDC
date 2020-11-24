global class AccountNewProcessor implements Database.Batchable<sobject> {
    global Database.QueryLocator start (Database.BatchableContext bc)
    {
        return database.getquerylocator('Select Id From Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> acclist){
        List<Account> accounts = new List<Account>();
        Map<Id,Integer> mapconcount = new Map<Id,Integer>();
        for(AggregateResult agrt : [Select accountId,count(Id)conid from contact Where AccountId in : acclist
                                    Group By accountId Having count(Id)>0]){
                                        mapconcount.put((Id) agrt.get('AccountID'),Integer.valueof(agrt.get('conid')));
                                    }
        for(Account acc : acclist){
            if(mapconcount.containsKey(acc.id)){
                acc.Number_of_contacts__c = mapconcount.get(acc.id);
                accounts.add(acc);
            }
        }
        update accounts;
        
    }
    global void finish(Database.BatchableContext bc){
        
    }

}