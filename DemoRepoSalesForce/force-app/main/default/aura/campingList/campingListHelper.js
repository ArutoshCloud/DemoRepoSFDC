({
    createItem : function(component,Item){
        let action = component.get("c.saveItem");
    action.setParams({"campingItem":Item});
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