({
    createItem : function(component,CampingItem){
        let addItem = component.getEvent("addItem");
        addItem.setParams({"item":CampingItem});
        addItem.fire();
                    component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
                                       'Name': '',
                                       'Quantity__c': 0,
                                       'Price__c': 0,
                                       'Packed__c': false });
    }
})