public class ChatterFeedTriggerHandler {
    public static void updatepostwithmentionUser(list<FeedItem> feeditemList){
        //string usr = system.UserInfo().getuserId();
        if(RecursiveTriggerHandler.IsFirstTime){
            //RecursiveTriggerHandler.IsFirstTime = false;
            for(FeedItem fditm : FeedItemList){
                list<user> usr = [Select username,firstname,lastName from user where id =: fditm.CreatedById ];
                caseTeamRole ctr = [Select Name From caseTeamRole Where Name = 'Watchers' limit 1];
                List<CaseTeamMember> caseTeamMemberList = [Select MemberId,ParentId From CaseTeamMember where TeamRoleId =: ctr.ID And ParentId =: fditm.ParentId];
                
                if(caseTeamMemberList != NUll && caseTeamMemberList.size()>0){
                    ConnectApi.FeedElement feedItem = ConnectApi.ChatterFeeds.getFeedElement(null, fditm.id);
                    Connectapi.feedItemInput feeditemInput = new Connectapi.feedItemInput();                
                    ConnectApi.MentionSegmentInput mentionSegment = new ConnectApi.MentionSegmentInput();                
                    ConnectApi.TextSegmentInput textSegment = new ConnectApi.TextSegmentInput();
                    ConnectApi.MessageBodyInput messageBodyInput = new ConnectApi.MessageBodyInput(); 
                    messageBodyInput.messageSegments = new list<connectapi.MessageSegmentInput>();
                    List<ConnectApi.MessageSegment> messageSegments = feedItem.body.messageSegments;
                    boolean j = true; 
                    list<id> memberidlist = new list<id>();
                    list<ID> memberstringlist = new list<ID>();
                    for(caseTeamMember ctm : caseTeamMemberList){
                        if(!memberstringlist.contains(string.valueOf(ctm.id))){
                            memberstringlist.add(ctm.id);
                        }
                        
                    }
                    for (ConnectApi.MessageSegment messageSegment : messageSegments) {
                        if (messageSegment instanceof ConnectApi.MentionSegment){
                            mentionSegment = new ConnectApi.MentionSegmentInput();
                            ConnectApi.MentionSegment mentionOutput = (ConnectApi.MentionSegment) messageSegment;
                            if(!memberidlist.contains(mentionOutput.record.id) && !memberstringlist.contains(mentionOutput.record.id)){
                                memberidlist.add(mentionOutput.record.id);
                                mentionSegment.id = mentionOutput.record.id;
                                messageBodyInput.messageSegments.add(mentionSegment);
                            }

                        }
                        else if (messageSegment instanceof ConnectApi.TextSegment) {
                            textSegment = new ConnectApi.TextSegmentInput();
                            ConnectApi.TextSegment textOutput = (ConnectApi.TextSegment) messageSegment;
                            //ConnectApi.TextSegmentInput textInput = new ConnectApi.TextSegmentInput();
                            textSegment.text = textOutput.text;
                            messageBodyInput.messageSegments.add(textSegment);
                        }
                    }
                    for(caseTeamMember ctm : caseTeamMemberList){
                        mentionSegment = new ConnectApi.MentionSegmentInput();
                        //ConnectApi.MentionSegment mentionOutput = (ConnectApi.MentionSegment) messageSegment;
                        //ConnectApi.MentionSegmentInput mentionInput = new ConnectApi.MentionSegmentInput();
                        if(!memberidlist.contains(ctm.Memberid)){
                        mentionSegment.id = ctm.Memberid;
                        messageBodyInput.messageSegments.add(mentionSegment);
                        }

                    }
                                    feeditemInput.body = messageBodyInput;
                system.debug(feeditemInput);
                ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.updateFeedElement(null,fditm.id, feeditemInput);
                }
                /*system.debug(fditm.body);
string bodywithtag = fditm.body.replace('</p>','<br>');
system.debug(bodywithtag);
string body = bodywithtag.stripHtmlTags();
system.debug(body);*/
                
                else{
                    
                     ConnectApi.FeedElement feedItem = ConnectApi.ChatterFeeds.getFeedElement(null, fditm.id);
                Connectapi.feedItemInput feeditemInput = new Connectapi.feedItemInput();                
                ConnectApi.MentionSegmentInput mentionSegment = new ConnectApi.MentionSegmentInput();                
                ConnectApi.TextSegmentInput textSegment = new ConnectApi.TextSegmentInput();
                ConnectApi.MessageBodyInput messageBodyInput = new ConnectApi.MessageBodyInput();                        
                list<id> memberidlist = new list<id>();
                messageBodyInput.messageSegments = new list<connectapi.MessageSegmentInput>();
                List<ConnectApi.MessageSegment> messageSegments = feedItem.body.messageSegments;
                boolean i = true; 
                for (ConnectApi.MessageSegment messageSegment : messageSegments) {
                    if (messageSegment instanceof ConnectApi.MentionSegment && i) {
                        //i =false;
                        mentionSegment = new ConnectApi.MentionSegmentInput();
                        ConnectApi.MentionSegment mentionOutput = (ConnectApi.MentionSegment) messageSegment;

                                if(!memberidlist.contains(mentionOutput.record.id)){
                                memberidlist.add(mentionOutput.record.id);
                                mentionSegment.id = mentionOutput.record.id;
                                messageBodyInput.messageSegments.add(mentionSegment);
                            }
                    }
                    else if (messageSegment instanceof ConnectApi.TextSegment) {
                        textSegment = new ConnectApi.TextSegmentInput();
                        ConnectApi.TextSegment textOutput = (ConnectApi.TextSegment) messageSegment;
                        //ConnectApi.TextSegmentInput textInput = new ConnectApi.TextSegmentInput();
                        textSegment.text = textOutput.text;
                        messageBodyInput.messageSegments.add(textSegment);
                    }
                }
                //list<user> usr = [Select username,firstname,lastName from user where id =: fditm.CreatedById];
                // if(!fditm.body.contains('@')){
                
                
                /*if(i){
                    mentionSegment.username = string.valueof(usr[0].username);                
                    messageBodyInput.messageSegments.add(mentionSegment);
                }*/
                
                
                feeditemInput.body = messageBodyInput;
                system.debug(feeditemInput);
                ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.updateFeedElement(null,fditm.id, feeditemInput);
                
                }
               
                //}
                
            }
        }
        
    }
}