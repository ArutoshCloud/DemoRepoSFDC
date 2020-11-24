({
	handleClick : function(component, event, helper) {
		var childcomp = component.find('child');
        console.log(childcomp);
        childcomp.retrieveacaccnts(function(records){
            
            console.log(records);
            component.set('v.acctsrecords',records);
        },'Contact','Name');
        
	}
})