@RestResource(urlMapping='/Case/v1/*')
global class CaseManager {

    @HttpGet
    global static Case getCase(){
        
        RestRequest req = RestContext.request;
        String caseNum = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        return [SELECT Id, CaseNumber, Status FROM Case WHERE CaseNumber =: caseNum];
    }
    
    @HttpPost
    global static ID createCase(String subject,String status,  String origin, String priority){
    
    Case thisCase = new Case(Subject=subject,Status=status,Origin=origin,Priority=priority);
    insert thisCase;
    
    return thisCase.Id;
    
    }
    
    @HttpPut
    global static ID upsertCase(String subject,String status,  String origin, String priority, String id){
    
    Case thisCase = new Case(Id=id,Subject=subject,Status=status,Origin=origin,Priority=priority);
    upsert thisCase;
    
    return thisCase.Id;
    
    }
}