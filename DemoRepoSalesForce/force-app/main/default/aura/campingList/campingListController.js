({
    doInit: function(component, event, helper) {
        // Create the action
        let action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
                component.set("v.columnsToDisplay",[{label: "CampingItem Name", fieldName:"Name", type:"text"},
                                                    {label: "CampingItem Price", fieldName:"Price__c", type:"number"},
                                                    {label: "CampingItem Quantity", fieldName:"Quantity__c", type:"number"},
                                                    {label: "CampingItem Packed", fieldName:"Packed__c", type:"checkbox"}]);
                
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    handleAddItem : function(component,event,helper){
        let action = component.get("c.saveItem");
        let item = event.getParams("item")
    action.setParams({"campingItem":item});
    action.setCallback(this,function(response){
  	let state = response.getState();
    if(state == "SUCCESS"){
    var CampingItems = component.get("v.items");
    CampingItems.push(response.getReturnValue());
    component.set("v.items",CampingItems);
}
});
$A.enqueueAction(action);
    }

})