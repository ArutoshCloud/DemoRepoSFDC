trigger OnCampaignToOpportunity on Campaign (Before update) {

    if(trigger.IsBefore){
        if(trigger.IsUpdate){
                CampaignTriggerHandler.setStageNameonOppWhenCampaignIsCompleted(trigger.new,trigger.oldMap);

            }
        }
    }