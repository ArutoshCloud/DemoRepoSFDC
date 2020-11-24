public class ContactTriggerHandler {
    public static void contactwithAccountAddress(List<Contact> contactlist){
        
        set<Id> myaccidset = new Set<Id>();
        Map<Id,List<Contact>> mapaccwithcon = new Map<Id,List<Contact>>();
        for(Contact c: contactlist){
            if(c.AccountId != Null){
                myaccidset.add(c.AccountID);
            }            
        }
        
        if(RecursiveTriggerHandler.IssecondTime){
            RecursiveTriggerHandler.IssecondTime = false;
            
            List<Contact> conlist = new List<Contact>();
            for(Account acc : [Select Shippingstreet,Shippingcity,Shippingstate,ShippingCountry,ShippingPostalCode From Account Where Id in : myaccidset]){
                for(contact con : contactlist){
                    if(con.AccountId != Null && con.AccountId == acc.Id){
                        //System.debug(con);
                        //System.debug(acc);                            
                        con.MailingStreet = acc.Shippingstreet;
                        con.MailingCity = acc.ShippingCity;
                        con.Mailingstate = acc.Shippingstate; 
                        con.Mailingcountry = acc.ShippingCountry;                             
                        con.MailingPostalCode = acc.ShippingPostalCode;
                        
                    }            	
                }
                
            }              
        }
    }
    public static void copycontactLastnameToAccountName(List<Contact> contactlist){
        List<Account> oldacclist = new List<Account>();
        List<Account> newacclist = new List<Account>();
        Map<Id,String> accNameMap = new Map<Id,String>();
        Map<Id,Account> newaccMap = new Map<Id,Account>();
        Map<Id,Id> accMap = new Map<Id,Id>();
        Set<Id> myids = new Set<Id>();
        for(contact con : contactlist){
            if(con.AccountID != Null){
                myids.add(con.AccountId);
            }
            
        }
        
        boolean istrue = true;
        
        if(myids.size()>0){
            oldacclist = [select Name,NumberOfEmployees From Account Where ID In : Myids];
            for(Account ac : oldacclist){
                if(ac.NumberOfEmployees >100){
                    istrue = false;
                }
                accNameMap.put(ac.id,ac.Name);
            }
            Id accid;
            string str1;
            string str;
            if(istrue==false){
                for(contact con : contactlist){
                    if(con.AccountId != Null){                   
                        if(myids.size()>1 ){
                            if(accid != con.AccountId){
                                str1='';
                            }
                        }
                        
                        accid = con.AccountId;                 
                        
                        Account acc = new Account();
                        acc.id = con.AccountId;
                        if(accMap.containsKey(con.AccountId)){
                            if(myids.size()>1){
                                acc.Name = str1 + con.LastName; 
                                str1 = acc.Name;
                            }else{
                                acc.Name = str + con.LastName; 
                                str = acc.Name;
                            } 
                            
                        }
                        else{
                            
                            accMap.put(con.AccountId,acc.id);
                            if(myids.size()>1){
                                acc.Name = accNameMap.get(con.accountId) + con.LastName;                    
                                str1 = acc.Name;
                            }
                            else{
                                acc.Name = accNameMap.get(con.accountId) + con.LastName;                    
                                str = acc.Name;
                            }
                            
                        }
                        
                        newacclist.add(acc); 
                        
                        
                        
                    }
                }
                
            }
            
            
            
            System.debug(newacclist);
            
            newaccMap.putAll(newacclist);
            
            if(newaccMap.size()>0){
                System.debug(newaccMap.values());
                update newaccMap.values();
            }
            
        }
        
    }
    
    public static void deletecontactLastnameFromAccountName(List<Contact> contactlist){
        List<Account> myacclist = new List<Account>();
        List<Account> newacclist = new List<Account>();
        Map<Id,String> accNameMap = new Map<Id,String>();
        Map<Id,Account> newaccMap = new Map<Id,Account>();
        Map<Id,Id> accMap = new Map<Id,Id>();
        Set<Id> myids = new Set<Id>();
        string str1,str;
        for(contact con : contactlist){
            system.debug(con);
            if(con.AccountID != Null){
                myids.add(con.AccountId);
            }
            
        }
        /*if(myids.size()>0){
            
            myacclist = [select Name From Account Where ID In : Myids];
            for(Account ac : myacclist){
                accNameMap.put(ac.id,ac.Name);
            }
            
            for(Contact con : contactlist){
                Account acc = new Account();
                System.debug(con);
                if(accNameMap.containskey(con.AccountId)){
                    acc.id = con.AccountId;
                    if(str == Null){
                        acc.Name = accNameMap.get(con.AccountId).removeEnd(con.LastName);
                        str = acc.Name;
                    }
                    else{
                        str = str.removeEnd(con.LastName);
                        acc.Name = str;
                    }
                    
                }
                
                newacclist.add(acc);
            }
            system.debug(newacclist);
            
            
            newaccMap.putAll(newacclist);
            
            if(newaccMap.size()>0){
                System.debug(newaccMap.values());
                update newaccMap.values();
            }
        }*/
        
    }
    public static void copyuserAddressToContactNAccount(List<Contact> contactlist){
        Id usrId = System.userinfo.getUserId();
        String Street,city,state,country,zipcode ;
        List<Account> acclist = new List<Account>();
        List<Contact> conlist = new List<Contact>();
        Map<Id,Account> accmap = new Map<Id,Account>();
        User usr = [Select UserName,Address,Postalcode From User Where Id =: usrId];
        Address address = usr.Address;
        Street = address.getstreet();
        city = address.getcity();
        state = address.getstate();
        Country = address.getCountry();
        zipcode = address.getPostalCode();
        
        if(RecursiveTriggerHandler.IsFirstTime){
            RecursiveTriggerHandler.IsFirstTime = false;
            for(Contact c : [Select LastName,Mailingstreet,Mailingcity,Mailingstate,MailingCountry,MailingPostalCode
                             ,Account.Billingstreet,Account.Billingcity,Account.Billingstate,Account.BillingCountry,Account.Name
                             ,Account.BillingPostalCode,AccountId From Contact Where AccountId != Null And Id In : contactlist]){
                                 
                                 
                                 Account acc = new Account(Id = c.AccountId,
                                                           Name = c.Account.Name);
                                 
                                 if(c.Mailingstreet==Null || c.Account.BillingStreet==Null){
                                     c.Mailingstreet = street;
                                     acc.BillingStreet = street;
                                         
                                         }
                                 if(c.Mailingcity == Null || c.Account.Billingcity == Null){
                                     c.Mailingcity = city;
                                     acc.Billingcity = city;
                                 }
                                 if(c.Mailingstate==Null || c.Account.Billingstate==Null){
                                     c.Mailingstate = state;
                                     acc.Billingstate = state;
                                 }
                                 if(c.MailingCountry==Null || c.Account.BillingCountry==Null){
                                     c.MailingCountry = Country;
                                     acc.BillingCountry = Country;
                                 }
                                 if(c.MailingPostalCode==Null || c.Account.BillingPostalCode==Null){
                                     c.MailingPostalCode = zipcode;
                                     acc.BillingPostalCode = zipcode;
                                 }
                                 
                                 acclist.add(acc);
                                 conlist.add(c);
                             }
        }
        accmap.putall(acclist);
        if(acclist.size()>0 || conlist.size()>0){
            update conlist;
            update accmap.values();
            System.debug(conlist);  
            System.debug(acclist);
            
        }
    }
    public static void contactwithsameuserNaccountCountry(List<Contact> contactlist){
        Id i = System.UserInfo.getUserId();
        User usr = [Select Address From User Where Id =: i];
        Address add = usr.Address;
        String usrCountry = add.getCountry();
        String accCountry ;
        set<Id> accidlist= new set<Id>();
        Map<ID,String> mapacccountry = new Map<Id,String>();
        for(Contact c : contactlist){
            if(c.MailingCountry != Null){
                accidlist.add(c.AccountId);
            }
            
            
        }
        if(accidlist.size()>0){
            for(Account acc :[Select BillingCountry From Account Where Id In : accidlist]){
                mapacccountry.put(acc.id,acc.BillingCountry);
            }
            
            for(Contact c : contactlist){
                if(mapacccountry.get(c.AccountId) != Null){
                    if(c.MailingCountry  == usrCountry && c.MailingCountry == mapacccountry.get(c.AccountId) ){                    
                        c.addError('Error: Contact is having same MailingCountry as User & Company');
                    }
                }
                
                
            }
        }
        
    }
    public static void contactwithoneOrmultipleAccount(List<Contact> contactlist){
        Set<ID> accid = new set<Id>();
        List<Id> conids = new List<Id>();
        Map<Id,list<contact>> mapaccIdwithCons = new Map<Id,list<contact>>();
        map<Id,boolean> accwithbool = new map<Id,boolean>();
        
        for(Contact c : contactlist){
            if(c.AccountId != Null){
                accid.add(c.AccountId);
            }
            
        }
        
        list<Contact>conlist = [Select AccountId,Id,LastName From Contact Where AccountId In : accid ];
        system.debug(conlist);
        for(Contact con : conlist){
            if(mapaccIdwithCons.containsKey(con.AccountId)){
                mapaccIdwithCons.get(con.AccountId).add(con);
            }
            else{
                mapaccIdwithCons.put(con.accountID,new List<contact>{con});
            }
            conids.add(con.Id);
            
            
        }
        
        system.debug(mapaccIdwithcons);
        for(Account acc : [Select Name,Allow_Multiple_Contacts__c From Account Where Id =: accid]){
            accwithbool.put(acc.id,acc.Allow_Multiple_Contacts__c);
        }
        
        
        
        system.debug(mapaccIdwithcons);
        system.debug(accwithbool);
        for(Contact con : contactlist){
            system.debug(mapaccIdwithcons.get(con.Accountid));
            system.debug(accwithbool.get(con.AccountId));
            if(mapaccIdwithcons.get(con.Accountid) != null){
                
                if(accwithbool.get(con.AccountId)==false){
                    con.AddError('Error : You cannot add Multiple Contacts on selected Account Until You check Allow Multiple Contacts box in selected Account');    
                }
                
            }
            
            
            
            else{
                system.debug('yes');
            }
            
            
        }
    }
}