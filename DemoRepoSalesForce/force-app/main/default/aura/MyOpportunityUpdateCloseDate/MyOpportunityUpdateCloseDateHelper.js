({
    updatemyOppcloseDate : function(component) {
        console.log(component.get('v.recordId'));
        var recordId=component.get('v.recordId');
        var mydate = component.get('v.closeDate');
        var update = component.get('c.updateMyOpp');
        update.setParams({'oppId':recordId,
                          'oppDate':mydate});
        console.log(mydate);
        if(mydate != null ){
            update.setCallback(this,function(response){
                var state = response.getState();
                if(state == 'SUCCESS'){
                    $A.get("e.force:closeQuickAction").fire();
                    $A.get('e.force:refreshView').fire();
                }
            });
            
            $A.enqueueAction(update);
            var toastEvent = $A.get("e.force:showToast"); 
            toastEvent.setParams({
                title: "Success!",
                message: "Congrats, Oppourtunity is Updated!!",
                type: "success",
                duration:8000,
                mode:'dismissible'
            });
            toastEvent.fire();
        }
        
    }
})