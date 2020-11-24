({
	submit : function(c, e, h) {
        var action = component.get('c.getweather');
        action.SetParams({'name' : c.get('v.cityName')})
        action.setCallback(this,function(r){
            if(r.getState() === 'SUCCESS'){
                console.log(r.getReturnValue());
            }
            
        });
        
		
	}
})