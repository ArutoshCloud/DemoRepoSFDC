({
    myAction : function(component, event, helper) {
        
    },
    login : function(component,event,helper){
         console.log('hi');
        var action = component.get('c.details');
        console.log('hi');
        //action.setParams({'usrname':component.get('v.Username'),
        //               'password':component.get('v.Password')});
        //$A.enqueueAction(action);
    }
})