({
    getacclist : function(component) {
        var action = component.get("c.getaccounts");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == 'SUCCESS'){
                component.set('v.acclist',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    getcontact : function(cmp){
        var acc = cmp.get('v.selectvalue');
        var action = cmp.get('c.getcontacts');
        
        action.setParams({'accid':acc});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state =='SUCCESS'){
                cmp.set('v.conlist',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    getopportunity : function(cmp){
        var acc = cmp.get('v.selectvalue');
       
        var action = cmp.get('c.getopportunities');
        action.setParams({'accid':acc});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state =='SUCCESS'){
                cmp.set('v.opplist',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})