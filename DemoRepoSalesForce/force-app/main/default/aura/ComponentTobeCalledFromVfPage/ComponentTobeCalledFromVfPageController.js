({
    onClick : function(component, event, helper) {
        console.log(component.get('v.name'));
        try{
            
            if(component.get('v.name') != undefined &&component.get('v.name')!= ''){
                component.set('v.show',true);
            }
            
        }
        catch(error){
            console.log(error.message);
        }
        
        
    },
    createrecord : function(component, event,helper){
        //console.log(event.getSource().get('v.name'));
        try{
            component.set('v.show',false);
            var record = event.getSource().get('v.name');
        if(record === 'yes'){
            console.log('yes');
            helper.createAccountWithContact(component);
        }
        else if(record === 'no'){
            helper.createAccount(component);
        }
        }
        catch(error){
            console.log(error.message);
        }

    },
    close1Modal : function(component, event,helper){
                try{
            component.set('v.show',false);
        }
        catch(error){
            console.log(error.getmessage());
        }
        
        
    }
})