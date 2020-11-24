({
    doInit_Helper : function (c,e,h) {
        try{
            let recordId = c.get('v.recordId');
            let sObjectName = c.get('v.sObjectName');
            let action = c.get('c.getTheNotesOfTheRecord_Apex');
            action.setParams({
                "recordId" : recordId,
                "sObjectName" : sObjectName
            });
            action.setCallback(this,function (response) {
                if(response.getState() === 'SUCCESS'){
                    let storeResponse = response.getReturnValue();
                    let notestodisplay = [];
                    //console.log(storeResponse.length);

                    //console.log(notestodisplay);
                    //console.log(storeResponse[0].Body);// Updated by kushagra mishra
                    //console.log(JSON.stringify(storeResponse));// Updated by kushagra mishra
                    //let stringifystoreResponse = JSON.stringify(storeResponse);
                    
                    
                    
                    if($A.util.isUndefinedOrNull(storeResponse) || storeResponse.length < 0){
                    }else{
                        c.set('v.notesList',storeResponse);
                    }
                }
            });
            $A.enqueueAction(action);
        }catch(ex){
            console.info('Error-->'+ex);
        }
    },
    
    saveNote_helper : function (c,e,h) {
        try{
            let notesData = c.get('v.noteContent');
            console.log('Added Notes---->>'+notesData);// Updated by kushagra mishra
            console.log('Stringified Added Notes---->>'+JSON.stringify(notesData));// Updated by kushagra mishra
            if(notesData === null || notesData === undefined || notesData.trim === ''){
                let toastEvent = $A.get("e.force:showToast"); // Fire the toast if the note data is empty.
                toastEvent.setParams({
                    title : "Error Message",
                    message : "Note data is empty",
                    duration :' 2000',
                    key: 'info_alt',
                    type: 'error',
                    mode: 'pester'
                });
                toastEvent.fire();
            }else {
                let action = c.get('c.saveNotesForAddNotes_Apex');
                action.setParams({
                    'notesData': notesData,
                    'recordId': c.get('v.recordId')
                });
                action.setCallback(this,function(response){
                    if(response.getState() === 'SUCCESS'){
                        let storedResponse = response.getReturnValue();
                        c.set('v.noteContent','');
                        let toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            title : "Success!",
                            message : "Note has been added successfully.",
                            duration :' 2000',
                            key: 'info_alt',
                            type: 'success',
                            mode: 'pester'
                        });
                        toastEvent.fire();
                        //To refresh the page with the new update in the record page
                        $A.get('e.force:refreshView').fire();
                        // To get the latest records from the system
                        h.doInit_Helper(c,e,h);
                        h.publishMessage_Helper(c,e,h);
                        // To refresh the consolidated view in the lead record page
                        $A.get("e.telegenta:Telegenta_SpinnerEvent").setParams({
                            showSpinner: false
                        }).fire();
                    }else if (response.getState() === 'ERROR'){
                        console.log('ERROR');
                        console.log(response.getError());
                    }
                });
                $A.enqueueAction(action);
            }
        }catch (ex) {
            console.info('Error-->'+ex);
        }
    },
    //This method will publish the data onto the messaging channel.
    publishMessage_Helper: function (c, e, h) {
        try {
            let payload = {
                source: "Aura_Component",
                messageBody: 'Telegenta_AddNotesHelper'
            };
            //console.log('payload-if disposition avaialble---'+JSON.stringify(payload));
            c.find("lmsDemohannel").publish(payload);
        } catch (ex) {
            
            console.log(`Error---${ex}`);
        }
    },
})