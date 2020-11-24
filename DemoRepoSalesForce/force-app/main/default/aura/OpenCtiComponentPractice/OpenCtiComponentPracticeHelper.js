({
    disableClickToDial : function(cmp,evt, helper) {
        sforce.opencti.disableClickToDial({callback : function(response){
            if(response.success){
                console.log('API method call executed successfully! returnValue:', response.returnValue);
            }
            else{
                console.error('Something went wrong! Errors:', response.errors);
            }

        }
    });

    },
    enableClickToDial_helper : function(cmp,evt, helper,calledFrom) {
        console.log('calledFrom-----'+calledFrom);
        sforce.opencti.enableClickToDial({
            callback : function(response){
            if(response.success){
                console.log('API method call executed successfully! returnValue:', response.returnValue);
            }
            else{
                console.error('Something went wrong! Errors:', response.errors);
            }

        }
    });

    },
    ClickToDial_helper : function(cmp,evt, helper) {

                sforce.opencti.onClickToDial({listener: function(payload) {
                console.log('Clicked phone number: ' + payload.number);
              }
            });

    },
    getAppViewInfo : function(cmp,evt, helper) {
        sforce.opencti.getAppViewInfo({callback : function(response){
            if(response.success){
                console.log('API method call executed successfully! returnValue:', response.returnValue.recordName);
            }
            else{
                console.error('Something went wrong! Errors:', response.errors);
            }

        }
    });

    },
    setSoftphonePanelHeight : function(cmp,evt, helper) {
        sforce.opencti.setSoftphonePanelHeight({heightPX :300 ,callback : function(response){
            if(response.success){
                console.log('API method call executed successfully! returnValue:', response.returnValue);
            }
            else{
                console.error('Something went wrong! Errors:', response.errors);
            }

        }
    });

    },

    /*onClickToDial : function(cmp,evt, helper){

            sforce.opencti.onClickToDial({listener: function(payload) {
                console.log('Clicked phone number: ' + payload.number);
              }
            });
          
        }*/
})