public class CampaignTriggerHandler {
    public static void setStageNameonOppWhenCampaignIsCompleted(List<Campaign> camplist,Map<Id,Campaign> oldcampaign){
        List<Id> myids = new List<Id>();
        List<Opportunity> opplist = new List<Opportunity>();
        for(Campaign c : camplist){
            if(oldcampaign.get(c.id).Status != 'Completed'){
                if(c.Status == 'Completed'){
                    myids.add(c.Id);
                }
                
                
            }
            
            
        }
        
        for(Opportunity opp : [Select campaignId,HasOpportunityLineItem From Opportunity Where CampaignId In : myids]){
            
            if(opp.HasOpportunityLineItem == true){
                
                opp.StageName = 'Closed Won';
                
                opplist.add(opp);
            }
            else{
                
                opp.StageName = 'Closed Lost';
                
                opplist.add(opp);
            }
            
            
        }
        if(opplist.size()>0){
            upsert opplist;
        }
    }
}