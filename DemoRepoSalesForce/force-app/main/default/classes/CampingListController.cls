public with sharing class CampingListController {
    @auraEnabled
    public static List<Camping_item__c> getItems(){
        List<String> fieldstoCheck = new List<String>{'Id','Name','Quantity__c','Price__c','Packed__c',
            'CreatedDate'};
                Map<String,schema.SObjectField> fieldDescribeTokens = Schema.sobjectType.Camping_Item__c.fields.getMap();
        for(string field: fieldstoCheck){
            if(! fieldDescribeTokens.get(field).getDescribe().isAccessible()){
                throw new System.NoAccessException();
            }
        }
        
        return [Select Name,Quantity__c,Price__c,Packed__c from camping_item__c ];
    }
    
    
    
    @auraEnabled
    public static Camping_item__c saveItem(Camping_item__c campingItem){
        upsert campingItem;
        return campingItem;
        
    }
}