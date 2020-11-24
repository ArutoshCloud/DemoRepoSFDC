({
        myaction : function(component, event, helper) {
            helper.getacclist(component); 
        },
        getacc : function(cmp, evt, hlpr){
        	hlpr.getcontact(cmp);
            hlpr.getopportunity(cmp);
    	}
})