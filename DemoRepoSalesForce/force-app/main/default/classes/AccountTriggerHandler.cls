public class AccountTriggerHandler {
    Public static void OnAccountTORelated(List<Account> acclist){
        boolean Isdefault = false;
        List<Contact> conlist = new List<Contact>();
        List<Case> caselist = new List<Case>();
        List<Opportunity> opplist = new List<Opportunity>();
        List<OpportunityContactRole> conwithopp = new List<OpportunityContactRole>();
        
        List<Id> myids = new List<Id>();
        
        
        for(Account a : acclist){
            if(a.NumberOfEmployees > 100){
                //System.debug('noOfEmployees > 100');
                Isdefault = true;
                Contact con = new Contact();
                con.LastName = ' Default Contact';
                con.AccountId = a.Id;
                conlist.add(con);
                Opportunity oppo = new Opportunity(AccountId=a.Id,
                                                   Name = ' Default Opportunity',
                                                   StageName = 'Prospecting',
                                                   CloseDate = System.Today().addmonths(1));
                opplist.add(oppo);
            }
            
        }
        if(conlist.size()>0 && opplist.size()>0){
            //System.debug('noOfEmployees > 100');
            insert conlist;
            insert opplist;
            
        }
        for(Opportunity opt : opplist){
            for(Contact cnt : conlist){
                if(opt.AccountId == cnt.AccountId){
                    //System.debug(opt.Id);
                    //System.debug(cnt.Id);
                    OpportunityContactRole oppncon = new OpportunityContactRole(OpportunityId=opt.Id,
                                                                                ContactId = cnt.Id);
                    conwithopp.add(oppncon);
                    
                }
                
            }
        }
        
        for(integer i =0 ;i<conlist.size();i++){
            
            case cs = new case(ContactId = conlist[i].Id,Status = 'New',Origin = 'Email');
            caselist.add(cs);
        }
        if(conwithopp.size()>0 && caselist.size()>0){
            insert conwithopp;
            insert caselist;
        }
    }
    public static void AccountwithcontactasNoofEmployee(List<Account> acclist){
        Set<Id> accid = new Set<Id>();
        integer total_no_of_emp;
        Map<Id,Integer> mapaccwithnoe = new Map<Id,Integer>();
        List<Contact> conlist = new List<Contact>();
        		
        		
                for(Account acc : [Select Name,NumberOfEmployees,AnnualRevenue From Account Where Id IN : acclist]){
                    if(acc.NumberOfEmployees != Null ){
                        mapaccwithnoe.put(acc.Id,acc.NumberOfEmployees);
                        accid.add(acc.Id);
                    }
                    
                }
        		
        
             if(accid.size()>0){
                    for(Id ids : accid){
                        total_no_of_emp = mapaccwithnoe.get(ids);
                        for(Integer i =0 ;i < total_no_of_emp;i++){
                            Contact con = new Contact();
                            con.AccountId = ids;
                            con.LastName = 'Default '+i;
                            conlist.add(con);
                        }
                    }
                    
                    if(conlist.size()>0){
                        insert conlist;
                    }
                }
        
               
                
            
        
    }
    public static void AccountAddressTrigger(List<Account> acclist){
        for(Account a :acclist){
            if(a.Match_Billing_Address__c==true  && a.BillingPostalCode  != NULL){
                a.ShippingPostalCode = a.BillingPostalCode;           
            }  
            
        }
    }
    
    
}