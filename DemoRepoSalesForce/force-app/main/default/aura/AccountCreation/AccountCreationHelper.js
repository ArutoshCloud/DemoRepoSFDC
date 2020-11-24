({
	saverecord : function(component) {
        var save = component.get("c.saveaccount");
        save.setParams({'accnt':component.get("v.accobj")});
        save.setCallback(this,function(response){
            var state = response.getState();
        });
		$A.enqueueAction(save);
	}
    
})