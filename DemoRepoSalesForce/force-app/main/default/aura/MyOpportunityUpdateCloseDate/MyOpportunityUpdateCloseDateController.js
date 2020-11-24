({
    closeModel : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
    },
    updateopp : function(component, event, helper) {
        helper.updatemyOppcloseDate(component);  

        
    }
})