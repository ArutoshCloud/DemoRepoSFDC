({
    retrieveacaccnts : function(component, event, helper) {
        var params = event.getParam('arguments');
        console.log(params.callback);
        console.log(params.ObjectName);
        if(params){
            
            var callback = params.callback;
            
        }
        var action = component.get('c.getrecords');
        action.setParams({'objName':params.ObjectName,
                           'objFields':params.ObjectFields});
        action.setCallback(this,function(response){
            
           var records = response.getReturnValue();
            console.log(records);
            callback(records);
        });
        $A.enqueueAction(action);
    }
})