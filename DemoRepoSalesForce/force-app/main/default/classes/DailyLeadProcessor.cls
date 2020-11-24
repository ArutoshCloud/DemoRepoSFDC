global class DailyLeadProcessor implements schedulable {
    
    
    global void execute(SchedulableContext sc){
        
       
            /* AccountProcessor ap = new AccountProcessor();
            Database.ExecuteBatch(ap);
        
       AccountProcessor ap = new AccountProcessor();
            Database.ExecuteBatch(ap);*/
        /*AccountNewProcessor anp = new AccountNewProcessor();
        Database.executeBatch(anp);*/
        system.debug('Hello');
        LeadProcessor lp = new LeadProcessor();
         Database.executeBatch(lp);

        
    }
}