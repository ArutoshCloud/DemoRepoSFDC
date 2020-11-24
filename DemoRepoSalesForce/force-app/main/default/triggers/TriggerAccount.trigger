trigger TriggerAccount on Account (After insert) {    

        if(trigger.IsBefore){
        
        
        if(trigger.IsInsert){        }
        if(trigger.Isupdate){        }
        if(trigger.Isdelete){        }
        if(trigger.Isundelete){		}
        
        
    }
    
    
    if(trigger.IsAfter){
        
        
        if(trigger.IsInsert){
            AccountTriggerHandler.AccountwithcontactasNoofEmployee(trigger.new);
            AccountTriggerHandler.OnAccountTORelated(trigger.new);
        }
        if(trigger.Isupdate){        }
        if(trigger.Isdelete){		} 
    }
}