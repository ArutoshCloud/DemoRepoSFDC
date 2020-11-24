public class EventTriggerHandler {
    public static void NoSameContactUnderSameEvent(List<Event_Participant__c> evtptcptlist){
        set<Id> myctsids = new set<Id>();
        Map<Id,List<Id>> eventwithcon = new  Map<Id,List<Id>>();
        List<Id> myconids = new List<ID>();
        Set<Id> myset =  new Set<Id>();
        for(Event_Participant__c evpt : evtptcptlist){
            System.debug(evpt);
            myctsids.add(evpt.Events__c);
        }
        System.debug(myctsids);
        for(Event_Participant__c ept : [Select Name,Events__c,Event_contacts__c,Contacts__c from Event_Participant__c Where
                                          Contacts__c != Null And Events__c IN : myctsids]){
                                              if(eventwithcon.containsKey(ept.Events__c)){
                                                  eventwithcon.get(ept.Events__c).add(ept.Contacts__c);
                                              }
                                              else{
                                                  eventwithcon.put(ept.Events__c,new List<Id>{ept.Contacts__c});
                                              }
                                            
                                        }
        
        
        
        System.debug(eventwithcon);
        Id evtpartcpt;
        for(Event_Participant__c evpt : evtptcptlist){
            if(eventwithcon.get(evpt.Events__c) != Null){
                if(eventwithcon.containsKey(evpt.Events__c) && evpt.contacts__c != Null){
                    for(Id i : eventwithcon.get(evpt.Events__c)){
                        if(i == evpt.Contacts__c){
                            System.debug('hi');
                            evpt.addError('You cant add two event Participant in Same Event ');
                        }
                        
                    }
                }
            }
            
            else{
                eventwithcon.put(evpt.Events__c,new List<Id>{evpt.Contacts__c});
            }
        }
    }
    public static void NoSameContactUnderEventWithSameEventDate(List<Event_Participant__c> evtptcptlist){
        set<Id> evtIds = new set<Id>();
        Set<Id> etIds = new Set<Id>();
        List<Id> conIds = new List<Id>();
        List<Datetime> datelist = new LisT<Datetime>();
        Map<Id,List<Event_Participant__c>> frstmapevtwitheventpartcpt = new Map<Id,List<Event_Participant__c>>();
        Map<Id,List<Event_Participant__c>> Secmapevtwitheventpartcpt = new Map<Id,List<Event_Participant__c>>();
        Datetime new_evt_date;
        
        
        for(Event_Participant__c evt : evtptcptlist){
            evtIds.add(evt.Events__c);
        }

        List<Event__c> evtlist = [Select Name,Event_Date__c From Event__c Where Id IN : evtIds];
        for(Event__c e : evtlist){
            if(datelist.contains(e.Event_Date__c)==false){
                datelist.add(e.Event_Date__c);
            }
            system.debug(datelist);
        }
        for(Event__c e : [Select Name,Event_Date__c From Event__c Where Event_Date__c In : datelist And id not in : evtIds]){
            System.debug(e);
            etIds.add(e.Id);
            
        }
        
        
        for(Event_Participant__c ept : [Select Events__c,Contacts__c From Event_Participant__c Where Contacts__c != Null And Events__c In : etIds]){                                              
            if(Secmapevtwitheventpartcpt.ContainsKey(ept.contacts__c)){
                Secmapevtwitheventpartcpt.get(ept.contacts__c).add(ept);
            }
            else{
                Secmapevtwitheventpartcpt.put(ept.contacts__c,new list<Event_Participant__c>{ept});
            }
        }
        
        
        boolean istrue =false;
        system.debug(Secmapevtwitheventpartcpt);
        for(Event_participant__c evtpt : evtptcptlist){

            System.debug(Secmapevtwitheventpartcpt.ContainsKey(evtpt.Contacts__c));

                    if(Secmapevtwitheventpartcpt.ContainsKey(evtpt.Contacts__c)){
                        evtpt.addError('Two Events with Same Date Cannot Have Same Event Participant Contact Lookup');
                        
                    } 

        }
        
        
    }
        
        
    }