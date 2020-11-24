({
	Tologin : function(component) {
		        var action = component.get('c.details');
        console.log(component.get('v.Username'));
        action.setParams({'usrname':component.get('v.Username'),
                          'password':component.get('v.Password')});
        action.setCallback(this,function(response){
            var state = response.getState();
            var toastEvent = $A.get('e.force:showToast');
            if(state == 'SUCCESS'){
                
                var result = response.getReturnValue();
                console.log(result);
                if(result == 'Password Matched'){
                    toastEvent.setParams({
                        title : 'Success',
                        message: 'Congrats!! You are Successfully Logged In.',
                        type : 'success',
                        mode:'dismissible'
                    });
                }
                else if(result == 'NO Matched Password'){
                    toastEvent.setParams({
                        title : 'Error',
                        message: 'Try Again!! Password is Incorrect.',
                        type : 'error',
                        mode:'dismissible'
                    });
                }
                    else if(result == 'Password is Empty'){
                        toastEvent.setParams({
                            title : 'Error',
                            message: 'Try Again!! Password is Empty.',
                            type : 'error',
                            mode:'dismissible'
                        });
                    }
                        else if(result == 'No UserName Exists'){
                            toastEvent.setParams({
                                title : 'Error',
                                message: 'Try Again!! UserName Does not Exists.',
                                type : 'error',
                                mode:'dismissible'
                            });
                        } 
                toastEvent.fire();
            }
            
        });
        $A.enqueueAction(action);
        component.set('v.Username','');
        component.set('v.Password','');
	}
})