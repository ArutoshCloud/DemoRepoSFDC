({
	createAccountWithContact : function(cmp) {
                try{
                    var save = cmp.get('c.createRecordandcontact');
                save.setParams({'accName':cmp.get("v.name")});
        save.setCallback(this,function(response){
            var state = response.getState();
            if(state == 'SUCCESS'){
                console.log('Account and Contact is Inserted.');
            }   
            else{
                 console.log('Some Error');
            }
               
            
        });
		$A.enqueueAction(save);
        }
        catch(error){
            console.log(error.message);
        }

		
	},
    createAccount : function(cmp){
        try{
                var save = cmp.get('c.createRecord');
                save.setParams({'accName':cmp.get("v.name")});
        save.setCallback(this,function(response){
            var state = response.getState();
            if(state == 'SUCCESS'){
                console.log('Account Inserted.');
            }
            else{
                console.log('Some Error');
            }
        });
		$A.enqueueAction(save);            
        }
        catch(error){
            console.log(error.message);
        }

    }
})