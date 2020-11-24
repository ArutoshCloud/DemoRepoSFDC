public class LeadTriggerHandler {
    public static void toStopUserToCreateLeadOnLimit(List<Lead> ldlist){
            Map<Id,Integer> mapleadwithowner = new  Map<Id,Integer>();
    		Integer count;
    
                  for(AggregateResult ld : [Select OwnerId,Count(Id)countLead From Lead Where CreatedDate = This_Month Group By ownerId Having count(Id)>0]){
                      mapleadwithowner.put((id)ld.get('ownerId'),integer.valueof(ld.get('countlead')));
    						}
    for(Lead ld : ldlist){
        count = mapleadwithowner.get(ld.ownerId);
        system.debug(count);
        if(count>29){
            ld.addError('Error : You Have Crossed Maximum Limit :30: of Creating a new Lead Total Leads excluding this One'+string.valueof(count));
        }
        if(ldlist.size()>1){
            count +=1;
        }
    }
                 
    }
}