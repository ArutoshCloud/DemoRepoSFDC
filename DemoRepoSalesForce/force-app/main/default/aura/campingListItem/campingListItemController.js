({
    myAction : function(component, event, helper) {
        
    },
    packItem : function(component, event, helper){
        let checkbox = component.get("v.item");
        checkbox.Packed__c = true;
        
        component.set("v.item",checkbox);
        event.getSource.set("v.disabled",true);
        
    }
})