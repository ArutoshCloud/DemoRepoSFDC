@RestResource(urlMapping='/Cases/*')
gLobal with sharing class CaseManager {
    @HttpGet
    global static case getCaseById(){
        RestRequest request = RestContext.request;
        //grab the caseId from the end of the URL
        String caseId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        case result = [Select CaseNumber,Subject,Status,Origin,Priority
                      from case WHERE Id =: caseId];
        return result;
        
    }
    @HttpPost
    global static Id createCase(String subject,String status, String origin,
                                String priority){
                                    case thisCase = new case(Subject=subject,
                                                            Status=status,
                                                            Origin=origin,
                                                            Priority=priority);
                                    insert thisCase;
                                    return thisCase.Id;
                                }
	@HttpDelete
    global static void deleteCase(){
        RestRequest req = RestContext.request;
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        case thisCase = [Select Id From Case WHERE Id =: caseId];
        delete thiscase;
    }
    @HttpPut
    global static Id upsertCase(String id, String Subject, String Status,
                                String Origin, String Priority){
                                    case thisCase = new Case(
                                    Id = id,
                                    Subject = Subject,
                                    Origin = Origin,
                                    Priority = Priority,
                                    Status = Status);
                                    upsert thisCase;
                                    return thisCase.id;
                                }
    @HttpPatch
    global static Id updateCaseFields(){
        RestRequest req = RestContext.request;
        String caseId = req.requestURI.substring(
        req.requestURI.lastIndexOf('/')+1);
        Case thisCase = [Select Id From Case Where Id=:caseId];
        Map<string, Object> params = (Map<String, Object>)JSON.deserializeUntyped(req.requestBody.toString());
        for(String fieldName : params.KeySet()){
            thisCase.put(fieldName, params.get(fieldName));
        }
        update thisCase;
        return thisCase.Id;
    }
}