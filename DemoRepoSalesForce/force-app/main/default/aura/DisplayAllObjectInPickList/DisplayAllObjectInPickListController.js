({
    myaction : function(component, event, helper) {
        var record = component.get('c.getobjNames');
        //var field=component.get('c.getobjFields');
        
        record.setCallback(this,function(response){
            //console.log(response.getReturnValue());
            var state= response.getState();
            if(state=='SUCCESS'){
                var values = response.getReturnValue();
                component.set("v.options",values);
            }
            else if(state=='ERROR'){
                var errors = response.getError();
                if(errors){
                    if(error[0] && errors[0].message){
                        console.log("Error message: "+errors[0].message);
                        
                    }
                }
                else{
                    console.log("unknown Error");
                }
            }
        });
        
        
        $A.enqueueAction(record);
    },
    getfield : function(component){
        //this.superRerender();
        var field=component.get('c.getobjFields');
        var objname = component.get('v.selectvalue');
        console.log(objname);
        field.setParams({'myvalue':objname});
        field.setCallback(this,function(response){
            var state=response.getState();
                        if(state=='SUCCESS'){
                var values = response.getReturnValue();
                //component.set("v.fields",values);
                            component.set("v.wrapper",values);
            }
            else if(state=='ERROR'){
                var errors = response.getError();
                if(errors){
                    if(error[0] && errors[0].message){
                        console.log("Error message: "+errors[0].message);
                        
                    }
                }
                else{
                    console.log("unknown Error");
                }
            }
        });
        $A.enqueueAction(field);
    }
})