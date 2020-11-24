trigger ChatterFeedTrigger on FeedItem (After insert) {
    if(trigger.IsAfter && trigger.IsInsert){
        ChatterFeedTriggerHandler.updatepostwithmentionUser(trigger.new);
    }
}