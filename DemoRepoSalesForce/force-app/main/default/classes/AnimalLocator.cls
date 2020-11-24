public class AnimalLocator {
    public static String getAnimalNameById(Integer idparam){
        String retVal = '';
        http Http = new http();
        httpRequest request = new httpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+idparam);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
        if (response.getStatusCode() != 201) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug('results-------->>>>>>> '+results);
            Map<string,object> mapOfAnimals = (map<string,object>) results.get('animal');
            system.debug('mapOfAnimals-------->>>>>>> '+mapOfAnimals);
            retVal = string.valueof(mapOfAnimals.get('name'));
        } else {
            System.debug(response.getBody());
        }
        
        return retVal;
    }

}