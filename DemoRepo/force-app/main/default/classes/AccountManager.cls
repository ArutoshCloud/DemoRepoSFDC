@RestResource(urlMapping='/Accounts//contacts')
global class AccountManager {
    @HttpGet
    global static account getAccount(){
        restRequest req = RestContext.request;
        String AccountId = req.requestURI.substringBetween('Accounts/', '/contacts');
        Account acc = [Select Name,(Select Name From Contacts) From Account Where Id=:AccountId];
        return acc;
        
    }

}