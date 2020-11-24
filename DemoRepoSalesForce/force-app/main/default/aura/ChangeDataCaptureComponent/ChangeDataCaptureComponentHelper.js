({
    setData : function(cmp){
        try{
        var action=cmp.get("c.getaccounts");
        action.setCallback(this,function(response){
            //console.log(response.getReturnValue());
            var state = response.getState();
            if(state="SUCCESS"){
                let acclist = response.getReturnValue();
                
                cmp.set('v.acclist',acclist);
            }
        });
        $A.enqueueAction(action);
    }
            
            catch(error){
            console.log(error);            
            }
    },

    changeTheRecievedValue_helper : function(c,e,h,messageRecieved){
        try{
            //console.log('message---->>>'+JSON.stringify(messageRecieved));
            let accList = c.get('v.acclist');
            let changedField = [];
            let changedName = messageRecieved.data.payload.Name;
            let changedPhone = messageRecieved.data.payload.Phone;
            let recordId = messageRecieved.data.payload.ChangeEventHeader.recordIds;
            //console.log(changedName);
            for(let t in accList){
                 if(recordId[0] === accList[t].Id){
                     
                    if(changedName !== undefined && changedName !== ''){
                        accList[t].Name = changedName;

                    }
                    if(changedPhone !== undefined && changedPhone !== ''){
                        accList[t].Phone = changedPhone;

                    }

                }
            }
            /*accList.forEach(ele=>{
                console.log(ele);
                if(recordId === ele.Id){
                    if(changedField.Name !== ''){
                        ele.Name = changedField.Name;

                    }
                    if(changedField.Phone !== ''){
                        ele.Phone = changedField.Phone;

                    }
                    
                }
            });*/
            c.set('v.acclist',accList);
        }
        catch(ex){
          console.log(ex.message);
        }
    }
})