public class PlanTriggerHandler {
    public static void tostopcreateplanwhentotalhourisoverlimit(list<Plan__c> planlist){
    Map<String,List<Decimal>> maplocwithHours = new Map<string,List<Decimal>>();
    for(Plan__c pl : [Select Name,Travel_Location__c,Travel_hours__c From Plan__c Where 
                      Travel_Location__c = 'A' Or Travel_Location__c = 'B' Or Travel_Location__c = 'C']){
                          Decimal travelHours=0;
                          if(maplocwithHours.ContainsKey(pl.Travel_Location__c)){
                              maplocwithHours.get(pl.Travel_Location__c).add(pl.Travel_Hours__c);
                              
                          }
                          else{
                              maplocwithHours.put(pl.Travel_Location__c,new List<Decimal>{pl.Travel_Hours__c});
                              
                          }
                      }
       
        
        for(Plan__c pl : planlist){
            if(maplocwithHours.ContainsKey(pl.Travel_Location__c)){
                Decimal totalHours =0 ;
                for(Decimal hour  : maplocwithHours.get(pl.Travel_Location__c)){
                    
                    totalHours += hour+pl.Travel_Hours__c;                        
                }
                //System.debug(totalHours);
                if(totalHours > 100){
                    pl.adderror('You cant Create new Plan For this Location Because maximum limit for Travel Hours :100');
                }
            }
        }
    }
}