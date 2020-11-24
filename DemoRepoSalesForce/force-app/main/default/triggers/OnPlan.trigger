trigger OnPlan on Plan__c (before insert,before update){         
    if(trigger.IsBefore){        
                    PlanTriggerHandler.tostopcreateplanwhentotalhourisoverlimit(trigger.new);        
    }
}