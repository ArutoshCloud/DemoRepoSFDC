@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource {
    @HttpGet
    global static Account getRecord() {
        // Add your code
        Account acc = new Account();
        return acc;
    }
}