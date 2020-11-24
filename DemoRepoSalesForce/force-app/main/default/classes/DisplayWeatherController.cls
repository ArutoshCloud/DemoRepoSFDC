public class DisplayWeatherController {
    
    @AuraEnabled
    public static Map<String, Object> getweather(string name){
        try{
            if(name != null && name.trim() != ''){
                system.debug(name);
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setEndpoint('https://api.openweathermap.org/data/2.5/weather?q='+name+'&appid=87eff9880d9759e385a1703e49dae6ea');
                req.setMethod('GET');
                HttpResponse res =h.send(req);
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                system.debug(results);
                for(string val : results.keyset()){
                    system.debug(results.get(val));
                }
                //return results;
            }
        }
        
        catch(Exception ex){
            System.debug('Error--------->>'+ex.getMessage());
        }
        return null;
    }
    
}