global class LeadProcessor implements Database.Batchable<sobject>, Database.Stateful { 
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Name,company,Status,LeadSource From Lead Where CreatedDate = YesterDay');
    }
    global integer recordsProcessed = 0;
    global void execute(Database.BatchableContext bs,List<Lead> leadlist){
        
        
    }
    global void finish(Database.BatchableContext bc) {
        // System.debug(recordsProcessed + ' records processed. Shazam!');
        /*List<AsyncApexJob> jobs = [SELECT Id, Status, NumberOfErrors, 
                                   JobItemsProcessed,
                                   TotalJobItems, CreatedBy.Email
                                   FROM AsyncApexJob
                                   WHERE Id = :bc.getJobId()];*/
        Profile sys_admin = [Select Id From Profile Where Name = 'System Administrator'];
        User sys_usr  = [Select Id,Email From User Where ProfileId =: sys_admin.Id limit 1];
        List<Lead> leadlist = [SELECT Name,company,Status,LeadSource From Lead Where CreatedDate = YesterDay];
        if(leadlist != Null && leadlist.size()>0){

            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setSaveAsActivity(false);
            mail.setSubject('Details of lead Created YesterDay');
            mail.setTargetObjectid(sys_usr.Id);
            mail.setPlainTextBody('Hello, <br/><br/>These are Details of leads that were created yesterDay.<br/></br>Lead Details::<br/>'+leadlist+'<br/></br>Regards<br/> Developer' );
            Messaging.SendEmail(new Messaging.SingleEmailMessage[]{mail});
            
        
}
  
    }
  
}