({
	myAction : function(component, e, h){
        component.set("v.Columns", [
    {label:"First Name", fieldName:"FirstName", type:"text"},
    {label:"Last Name", fieldName:"LastName", type:"text"},
    {label:"Phone", fieldName:"Phone", type:"phone"}
]);
        let action = component.get('c.getContacts');
        console.log(component.get('v.recordId'));
        action.setParams({recordId : component.get('v.recordId')});
        action.setCallback(this,function(response){
            console.log(response.getReturnValue());
           component.set('v.Contacts',response.getReturnValue());
            /*let state = response.state;
            if(state === 'SUCCESS'){
                
            }*/
        });
        $A.enqueueAction(action);
	}
})