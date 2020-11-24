Global with sharing class CountRelatedObjectsToAccount implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
            return Database.getQueryLocator('Select Name,Number_of_Contacts__c,Number_Of_Opportunities__c From Account limit 10000');        
    }
    global void execute(Database.BatchableContext bc, List<Account> accountList){
        Map<Id,List<Contact>> accountVsContactsMap =  new Map<Id,List<Contact>>();
        Map<Id,List<Opportunity>> accountIdVsOpportuntiesMap =  new Map<Id,List<Opportunity>>();

        List<Id> accountListId = new List<Id>();
        List<Account> updatedAccountList = new List<Account>(); 
        try{
            if(accountList != Null && accountList.size()>0){

                for(Account acc : accountList){

                    accountListId.add(acc.Id);
                }        
            }
            for(contact con : [Select Id,AccountId From Contact Where AccountId in : accountListId ]){
                if(accountVsContactsMap.containsKey(con.AccountId)){
                    accountVsContactsMap.get(con.AccountId).add(con);
                }
                else{
                    accountVsContactsMap.put(con.accountID,new List<contact>{con});
                }
                
            }
            for(Opportunity opp : [Select Id,AccountId From Opportunity Where AccountId in : accountListId ]){
                if(accountIdVsOpportuntiesMap.containsKey(opp.AccountId)){
                    accountIdVsOpportuntiesMap.get(opp.AccountId).add(opp);
                }
                else{
                    accountIdVsOpportuntiesMap.put(opp.accountID,new List<Opportunity>{opp});
                }
            }

        


             System.debug('contactList----->'+accountVsContactsMap);                                   
             System.debug('OpportunityList----->'+accountIdVsOpportuntiesMap);                                   



            if(accountList != Null && accountList.size()>0){
                for(Account accObj : accountList){
                    if(accountVsContactsMap.containsKey(accObj.Id)){
                        accObj.Number_of_Contacts__c = accountVsContactsMap.get(accObj.Id).size();
                    }
                    if(accountIdVsOpportuntiesMap.containsKey(accObj.Id)){
                        accObj.Number_Of_Opportunities__c = accountIdVsOpportuntiesMap.get(accObj.Id).size();
                    }
                    updatedAccountList.add(accObj);    
                }
    
            }
            system.debug(updatedAccountList);
            update updatedAccountList;

        }
        catch(Exception ex){
           System.debug('Error : : - - '+ ex.getMessage());
        }
        


    }
    global void finish(Database.BatchableContext bc){

    }


}