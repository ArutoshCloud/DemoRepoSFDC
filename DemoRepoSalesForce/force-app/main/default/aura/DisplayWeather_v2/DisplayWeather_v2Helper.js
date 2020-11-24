({
	helperMethod : function(c, e, h) {
        try{
		    var action = c.get('c.getweather');
            action.setParams({'name' : c.get('v.cityName')})
            action.setCallback(this,function(r){
                if(r.getState() === 'SUCCESS'){
                    let data = [];
                    console.log(r.getReturnValue());
                    let values = r.getReturnvalue();
                    console.log(values.main);
                    if(values !== null){
                        for(var k in values){
                            data.push({value:values[k],key:key});
                        }
                        console.log(data);
                        c.set('v.data',data);
                    }
                    
                }
                
            });
            $A.enqueueAction(action);
        }
        catch(error){
            console.log(JSON.stringify(error)); 
            console.log(error.message);   

        }
	}
})