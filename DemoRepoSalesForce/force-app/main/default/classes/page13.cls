public class page13 {   
    public List<Account> accounts1 {get;set;}
    public List<Account> accounts2  = new List<Account>();
    public Map<Id,integer> count1conts {get;set;}
    public Map<Id,Integer> count1Oppts {get;set;}
    public Map<Id,Integer> count1OppotsLineItem {get;set;}
    public Map<Id,Integer> sr1no {get;set;}
    
    
    public Map<Id,integer> count2conts = new Map<Id,integer>();
    public Map<Id,Integer> count2Oppts = new Map<Id,integer>();
    public Map<Id,Integer> count2OppotsLineItem = new Map<Id,integer>();
    public Map<Id,Integer> sr2no = new Map<Id,Integer>();
    
    public page13(){
         accounts2 = [Select Name,(Select lastName,FirstName From Contacts),(Select Name,accountId From Opportunities ) From Account limit 15];
         
        system.debug(accounts2);
       
        for(account a : accounts2){

                        
            integer con_count;
            if(a.contacts.size() != Null){
                con_count = a.contacts.size();                    
                count2conts.put(a.Id,con_count);
            }
            if(a.opportunities != null){
                count2Oppts.put(a.Id,a.opportunities.size());                
                integer oppcount = 0;
                for(Opportunity opp : a.Opportunities){
                    
                    if(opp.id != Null && opp.accountId == a.id){
                        //system.debug(opp.accountId);
                        oppcount += [Select count() From OpportunityLineItem Where OpportunityId =: opp.Id];
                        
                    }
                }
                count2OppotsLineItem.put(a.id,oppcount);
                
            }
        }
       
        
        count1conts = new map<id,integer>(count2conts);
        count1Oppts = new map<id,integer>(count2Oppts);
        count1OppotsLineItem = new map<id,integer>(count2OppotsLineItem);
        integer count =1;
		accounts1 = new List<account>(accounts2);
        for(account acc : accounts2){
            sr2no.put(acc.id,count);
            count +=1;
        }

        sr1no = new Map<Id,Integer>(sr2no);
        
       
        system.debug(count1conts);
        system.debug(count1Oppts);
        system.debug(count1OppotsLineItem);
        system.debug('countOppotsLineItem');
    }
    public pagereference showaccounts(){
       	
        return null;
    }
    
}