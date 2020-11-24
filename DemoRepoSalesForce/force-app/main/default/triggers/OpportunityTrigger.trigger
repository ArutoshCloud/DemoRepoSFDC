trigger OpportunityTrigger on Opportunity (before insert,before Update,before delete,After insert,After update,After Delete) {
    
    if(trigger.IsBefore){
        
        
        if(trigger.IsInsert){
			    
            OpportunityTriggerHandler.OpportunitywithAccountHavingtwoclosedOpportunity(trigger.new);
            OpportunityTriggerHandler.OpportunitywithSelectedPriceBook(trigger.new,trigger.oldmap);
            OpportunityTriggerHandler.OpportunitywithNoPastClosedDate(trigger.new);

        }
        if(trigger.Isupdate){
            OpportunityTriggerHandler.OpportunityToAlertUser(trigger.new,trigger.oldmap);

            OpportunityTriggerHandler.OpportunitywithAccountHavingtwoclosedOpportunity(trigger.new);
            OpportunityTriggerHandler.OpportunitywithSelectedPriceBook(trigger.new,trigger.oldmap);
            OpportunityTriggerHandler.OpportunityToCase(trigger.new,trigger.oldmap);
        }
        if(trigger.Isdelete){}
        if(trigger.Isundelete){}
        
        
    }
    
    
    if(trigger.IsAfter){
        
        
        if(trigger.IsInsert){
       		 OpportunityTriggerHandler.OpportunitywithSameContactAsAccount(trigger.new); 
            OpportunityTriggerHandler.ClosedOpportunityTrigger(trigger.new);
        }
        if(trigger.Isupdate){
            
            OpportunityTriggerHandler.ClosedOpportunityTrigger(trigger.new);
        }
        if(trigger.Isdelete){} 
    }
    
}