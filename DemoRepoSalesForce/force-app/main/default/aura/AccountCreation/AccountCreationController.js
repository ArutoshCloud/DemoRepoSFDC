({
    onClick : function(component, event, helper) {
        var allvalid = component.find('field').reduce(function(validSoFar, inputcmp){
            inputcmp.showHelpMessageIfInvalid();
            return validSoFar && inputcmp.get('v.validity').valid;
        },true);
        if(allvalid){
                        var name = component.get("v.accobj.Name");
            //alert(''+name+' has been Saved');
            var toastEvent = $A.get("e.force:showToast");            
            var name = component.get("v.accobj.Name");
            toastEvent.setParams({
                title: "Success!",
                message: "Congrats, Account with Name : "+name+" is Saved!!",
                type: "success",
                duration:8000,
                mode:'dismissible'
            });
            toastEvent.fire();
            helper.saverecord(component);

            
        }
    }
})