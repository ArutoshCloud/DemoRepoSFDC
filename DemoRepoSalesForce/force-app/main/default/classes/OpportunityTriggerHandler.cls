public class OpportunityTriggerHandler {
    public static void OpportunitywithSameContactAsAccount(List<Opportunity> oppotntylist){
        Set<Id> myaccid = new Set<Id>();
        Map<Id,List<contact>> mapaccwithcon = new Map<Id,List<Contact>>();
        LisT<OpportunityContactRole> ocrlist = new List<OpportunityContactRole>();
        
        for(Opportunity opp : oppotntylist){
            system.debug(opp);
            if(opp.AccountId != Null){
                system.debug(opp);
                myaccid.add(opp.AccountId);
            }   
            
        }
        if(myaccid.size()>0){
            for(Contact con : [Select Id,AccountId From Contact Where AccountId IN : myaccid]){
                if(mapaccwithcon.containsKey(con.AccountId)){
                    mapaccwithcon.get(con.AccountId).add(con);
                }        
                else{
                    mapaccwithcon.put(con.AccountId,new List<Contact>{con});
                }
            }
            
            system.debug(mapaccwithcon);
            for(Opportunity opp : oppotntylist){
                if(mapaccwithcon.get(opp.AccountId) != Null){
                    for(Contact con :mapaccwithcon.get(opp.AccountId)){
                        OpportunityContactRole ocr = new OpportunityContactRole(OpportunityId= opp.Id,ContactId = con.Id);
                        ocrlist.add(ocr);
                    }
                }
                
            }
            if(ocrlist.size()>0){
                upsert ocrlist;
            }
        }    
        
    }
    public static void OpportunityToAlertUser(List<Opportunity> newoppotntylist,Map<Id,Opportunity> oldoppotntylist){
        boolean iscampaign = false;
        boolean isHasOpportOlis = false;
        for(Opportunity opp: newoppotntylist){
            if(opp.campaignId == null ){
                iscampaign = true;
            }
            
        }
        
        if(iscampaign == true ){
            
            
            for(Opportunity opp: newoppotntylist){
                System.debug(opp);
                if(oldoppotntylist.get(opp.id).Isclosed == false){
                    if(opp.HasOpportunityLineItem==false && opp.Isclosed ==true ){
                        System.debug(opp);
                        opp.addError('You cant Close the Opportunity if it have no Products ');
                        
                    }
                }
                
            }
        }
        
        
        
    }
    
    
    public static void ToStopOpportunitylineItemWhenmorethanTwo(List<OpportunityLineItem> opptlnitmlist){
        Set<Id> myoppids = new Set<Id>();
        Map<Id,Integer> mapOppwithOppLinItem = new Map<Id,Integer>();
        boolean iscampaign = false;
        for(OpportunityLineItem oli : opptlnitmlist){
            if(oli.OpportunityId != Null)
                myoppids.add(oli.OpportunityId);
        }
        for(AggregateResult oppLineItem : [Select OpportunityId,Count(Id)oliId From OpportunityLineItem
                                           Where OpportunityId iN : myoppids Group BY OpportunityId Having Count(Id)>0]){
                                               
                                               mapOppwithOppLinItem.put((Id)oppLineItem.get('OpportunityId'),Integer.ValueOf(oppLineItem.get('oliId')));
                                               
                                               
                                           }
        
        system.debug(mapOppwithOppLinItem);
        
        for(OpportunityLineItem oli : opptlnitmlist){           
         
                if(oli.OpportunityId != Null){
                    if(mapOppwithOppLinItem.containsKey(oli.OpportunityId)){
                        system.debug(mapOppwithOppLinItem);
                        Integer Count = mapOppwithOppLinItem.get(oli.OpportunityId);
                        system.debug(Count);
                        if(count>1){
                            system.debug(Count);
                            
                            oli.addError('Opportunity Already Has more than 2 opportunityLineItem');
                        }
                        else{
                            count += 1;
                            system.debug(Count);
                            
                            mapOppwithOppLinItem.put(oli.OpportunityId,Count);
                        }
                    }
                    else if(oli.OpportunityId != Null && !mapOppwithOppLinItem.ContainsKey(Oli.OpportunityId)){
                        system.debug(mapOppwithOppLinItem);
                        mapOppwithOppLinItem.put(oli.OpportunityId,1);
                    }
                }
                
            
        }
        
        
        
    }
    public static void OpportunityToCase(List<Opportunity> newoppotntylist,Map<Id,Opportunity> oldoppotntylist){
        List<case> caselist = new List<case>();
        List<Id> myids = new List<Id>();
        List<Id> myconids = new List<Id>();
        
        /*for(Opportunity o : oppotntylist){
if(o.StageName == 'Closed Lost'){
myids.add(o.Id);
}

}*/
        
        for(Opportunity opt: [Select CampaignId,AccountId,ContactId,StageName from Opportunity Where Id in : newoppotntylist]){
            if(oldoppotntylist.get(opt.Id).stageName != 'Closed Lost'){}
            if(opt.StageName == 'Closed Lost'){
                //system.debug(opt);
                if(opt.AccountId != Null || opt.ContactId != Null){
                    
                    Case cs = new Case(AccountId = opt.AccountID,ContactId= opt.ContactId,
                                       Status = 'Working',Origin='Phone',Subject = 'Making Footballs',
                                       Description = 'making football with solid materials');
                    caselist.add(cs);
                    
                }
                else{
                    //system.debug(opt);
                    Case cs = new Case(Status = 'Working',Origin='Phone',Subject = 'Making Footballs',
                                       Description = 'making football with solid materials');
                    caselist.add(cs);
                }
                
            }
        }
        
        if(caselist.size()>0){
            insert caselist;
        }
    }
    
    
    
    
    public static void OpportunitywithSelectedPriceBook(List<Opportunity> oppotntylist, Map<Id,Opportunity> mapoldoppotnty){
        List<String> pbNames = new List<String>{'ASIA','EMA','Na','SA'};
            
            Map<Id,list<String>> mapaccworkinNames =  new Map<Id,list<String>>();
        Map<Id,String> mapoppwithPbName =  new Map<Id,String>();
        List<String> accworkinNames = new List<String>();
        
        String str1;
        boolean istrue =false;
        set<Id> myaccidset = new set<Id>();
        List<Id> pbids = new List<Id>();
        //getting account ids
        for(Opportunity opp : oppotntylist){
            if(opp.AccountId != Null && opp.CampaignId == Null){
                myaccidset.add(opp.AccountId);  
            }
        }
        //getting pricebook ids
        for(Opportunity opp : oppotntylist){
            pbids.add(opp.PriceBook2Id);        
        }
        for(PriceBook2 pb : [Select Name From PriceBook2 Where Id IN : pbids ]){
            mapoppwithPbName.put(pb.Id,pb.Name);
        }
        
        
        if(myaccidset.size()>0){
            for(Account ac : [Select Working_in_ASIA_EMA_NA_SA__c From Account Where Id IN : myaccidset And 
                              Working_in_ASIA_EMA_NA_SA__c includes ('ASIA','EMA','NA','SA')]){
                                  str1 = ac.Working_in_ASIA_EMA_NA_SA__c;
                                  mapaccworkinNames.put(ac.Id,str1.split(';',4));
                                  
                              }
            
            
            //System.debug(mapaccworkinNames);
            // System.debug(mapoppwithPbName);
            
            for(Opportunity opp : oppotntylist){
                //System.debug(mapoppwithPbName);
                list<String> accNames = new List<String>();
                if(Opp.AccountId != Null && mapaccworkinNames.containsKey(opp.AccountID) && mapoppwithPbName.ContainsKey(opp.PriceBook2Id) && mapoppwithPbName.ContainsKey(mapoldoppotnty.get(opp.id).Pricebook2Id)==false)
                {
                    System.debug(mapoppwithPbName);
                    //  for(String Name : mapaccworkinNames.get(opp.AccountId)){
                    
                    //accNames.add(Name);
                    System.debug(mapaccworkinNames.get(opp.AccountId));
                    if(mapaccworkinNames.get(opp.AccountId).contains(mapoppwithPbName.get(opp.PriceBook2Id))){
                        system.debug('yes');
                    }
                    else{
                        system.debug('no');
                        opp.addError('PriceBook Name must matches with value present in workingin in Account');
                    }
                    //}
                }
                
            }
        }
    }
    
    
    
    
    public static void OpportunitywithNoPastClosedDate(List<Opportunity> oppotntylist){
        for(Opportunity opp : oppotntylist){
            if(opp.closeDate < System.Today()){
                opp.addError('Error : Please Select Close Date in Future');
            }
        }
    }
    
    public static void OpportunitywithAccountHavingtwoclosedOpportunity(List<Opportunity> oppotntylist){     
        
        Set<Id> accids = new Set<Id>();
        Set<Id> newaccids = new Set<Id>();
        Set<Id> newaccntids = new Set<Id>();
        
        
        
        for(Opportunity opp : oppotntylist){
            if(opp.AccountId != Null){
                accids.add(opp.AccountId);
            }
            
        }
        for(Account acc : [Select Name From Account Where Working_in_ASIA_EMA_NA_SA__c = 'ASIA' And Id IN : accids ]){
            
            newaccids.add(acc.Id);
        }
        for(AggregateResult opp : [Select AccountId,Count(Id) From Opportunity Where StageName = 'Closed Won'
                                   And AccountId In : newaccids Group By AccountId Having Count(Id)=2]){
                                       newaccntids.add((Id)opp.get('AccountId')) ;
                                   }
        for(Opportunity opp : oppotntylist){
            if(opp.AccountId != Null){
                if(newaccntids.contains(opp.AccountId)){
                    opp.addError('Error : This Opportunity cannot be insert/updated because It is Associated with Account Which contain company Working ASIA And 2 Opportunities with closed won stage');
                }
            }
            
        }
    }
    public static void ClosedOpportunityTrigger(List<Opportunity> oppotntylist){
        List<Task> oppwithtasks = new List<Task> ();
        for(Opportunity opp : [Select Name,CloseDate,StageName From Opportunity
                               Where StageName = 'Closed Won' And Id In : oppotntylist]){
                                   Task new_task = new Task();
                                   new_task.whatId = opp.id;
                                   new_task.Subject = 'Follow Up Test Task';
                                   
                                   oppwithtasks.add(new_task);
                               }
        if(oppwithtasks.size()>0){
            insert oppwithtasks;
        }
    }
}