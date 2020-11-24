({
    init : function(component, event, helper) {
        try{
            
            component.set('v.columns',[
                
                {label: 'Name',fieldName:'Name',type:'text'},
                {label: 'Empolyees',fieldName:'NumberOfEmployees',type:'number'},
                {label: 'Phone',fieldName:'Phone',type:'Phone'},
                {label: 'Type',fieldName:'Type',type:'text'},
                {label: 'Industry',fieldName:'Industry',type:'text'},
            ]);
                //let empApi = component.find('empApi');
                //empApi.onError($A.getCallback(error => {
                // Error can be any type of error (subscribe, unsubscribe...)
                //console.error('EMP API error: ', JSON.stringify(error));
                //}));
                
                
                }
                
                
                catch(error){
                console.log(error);            
                }
                },
                
                showAccounts : function(c, e, h){
                try{
                h.setData(c);
                }
                catch(error){
                console.log(error.message);
                }
                },
                
subscribeToCDC : function (c,e,h){
try{                console.log('Inside');
let empApi = c.find('empApi');
 let channel = '/data/AccountChangeEvent';
     let changeFields =[];
         let Operation;                 
 let replayId = -1;
let callback = function (message){
                
                 changeFields = message.data.payload.ChangeEventHeader.changedFields;
                 Operation = message.data.payload.ChangeEventHeader.changeType;
                console.log('messageRecieved----');
            
            if(Operation !== undefined && Operation === 'UPDATE'){
                console.log('update');

                h.changeTheRecievedValue_helper(c,e,h,message);
            }  
 }.bind(this);
           
 let errorHandler = function (message) {
cosnole.log('Error in subscribing----'+message);
 }.bind(this);
console.log('Inside3');      
empApi.onError(errorHandler);
console.log('Inside4');
                
    empApi.subscribe(channel, replayId, callback).then(function(value) {
            console.log("Subscribed to channel " + channel);
            c.set("v.subscription", value);
        });}catch(ex){
                console.log(`Error--${ex}`);
                }
                },    
        unsubscribe : function(component, event, helper) {
            try{
                
            
        // Get the empApi component
        const empApi = component.find('empApi');
        // Get the subscription that we saved when subscribing
        const subscription = component.get('v.subscription');

        // Unsubscribe from event
        empApi.unsubscribe(subscription, $A.getCallback(unsubscribed => {
          // Confirm that we have unsubscribed from the event channel
          console.log('Unsubscribed from channel '+ unsubscribed.subscription);
          component.set('v.subscription', null);
        }));
        }
            catch(error){
            console.log('error--->>'+error.message);
        }
    }
                })