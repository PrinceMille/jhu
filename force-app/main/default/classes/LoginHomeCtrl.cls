public class LoginHomeCtrl {
    
    public String username{set;get;}
    public String password{set;get;}
    
    public PageReference validateLogin(){
        
         Pagereference pr;
        
        if(String.isBlank(username) || String.isBlank(password) ){
            
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,'please enter username/password');
            ApexPages.addMessage(msg);
        }
        else{
            
            List<Registration__c> regLst = [SELECT Email__c,Password__c FROM Registration__c WHERE Email__c =: username];
            if(regLst == null || regLst.size() == 0){
                ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,'user does not exist');
             ApexPages.addMessage(msg);
             }
            
            else if( regLst[0].Password__c != password){
                 ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,'Invalid Password');
             ApexPages.addMessage(msg);
                
            }
            else{
                
                pr = Page.LoginWelcome;
            }     
            
        }
        
       return pr;
    }

}