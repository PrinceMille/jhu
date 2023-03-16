@isTest
global class MockHttpResponseGenerator {

    @isTest global static void respond(){
        
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('https://catfact.ninja/fact');
        req.setMethod('GET');
        System.assertEquals('https://catfact.ninja/fact', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"example":"test"}');
        res.setStatusCode(200);
      
    }	
}