public class UpdateOpportunityCloseDate {
	@auraenabled
    public static void updateMyOpp(string oppId,Date oppDate){
        Opportunity opp = [Select CloseDate From Opportunity where Id =: oppId];
        //system.debug(opp);
        opp.CloseDate = oppDate;
       // system.debug(opp);
        try{
            update opp;
            //system.debug(opp);
        }
        catch(dmlexception er){
            system.debug('Error :-:'+er.getmessage());
        }
    }
    
}