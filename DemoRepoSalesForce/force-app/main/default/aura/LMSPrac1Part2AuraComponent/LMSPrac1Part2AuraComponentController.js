({
    handleMessage : function(component, message, helper) {
        try{     
        console.log('message.getParam(\'data\')>>>'+message.getParam('data'));
        if(message.getParam('data') !== undefined && message.getParam('data') !== ''){
            component.set('v.messageFromPublisher',message.getParam('data'));
        }
    }
        catch(exp){
            console.log(exp.message);
        }
    },
    handleclick : function(component, event, helper) {
        let payload = {
            data : component.get('v.input')
        }
        component.find("sampleMessageChannel").publish(payload);

    },
})