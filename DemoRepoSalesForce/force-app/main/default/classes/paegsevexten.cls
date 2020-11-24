public class paegsevexten {
    Public Opportunity opp {get;set;}
    
    public Id currentrecId;
    Datetime closedate;
    public paegsevexten(apexpages.StandardController con){

            Opportunity oppr = [Select Name,closedate,stageName From Opportunity Where Id =: ApexPages.currentPage().getParameters().get('Id')];
        	 system.debug(oppr);
        closedate= oppr.closeDate;
          
    }
    public void getopport(){
        
            if(closeDate == System.Today().addDays(6)){
                system.debug(closeDate);
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'CloseDate is Near'));
            }
        
    }
    
}