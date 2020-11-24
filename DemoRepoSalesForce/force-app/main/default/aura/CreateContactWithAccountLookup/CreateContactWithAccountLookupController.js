({
    handlesearch : function(component, event, helper) {
        helper.search(component);
    },
    handlesave : function(component, event, helper){
        var record = event.getParam('response');
        console.log(record.id);
        if(record.id != ''){
            console.log('Record has been Saved Successfully With Id ::: '+record.id);
            //console.log(record.id);
            /*var toastEvent = $A.get("e.force:showToast");
            console.log(toastEvent);
            toastEvent.setParams({
                title: "Success!",
                message: "Congrats, Contact is Saved!!",
                type: "success",
                duration:8000,
                mode:'dismissible'
            });
            toastEvent.fire();*/
        }
    }
})