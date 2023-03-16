public class LoginRegistrationExt {
    
    public String confirmPwd {get;set;}
        
        Registration__c reg;
    public LoginRegistrationExt(ApexPages.StandardController stdContrl){
        
        reg = (Registration__c)stdContrl.getRecord();
    }
    
    public String getCityMsg(){
        
        if(reg.City__c == 'Banglore'){
            
            return 'Banglore is IT Hub';
        }
        return null;
    }
    
    public PageReference save(){
        
        PageReference pr;
        if(String.isBlank(reg.Password__c) || String.isBlank(confirmPwd)){
            
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter password or confirm password');
        	}
        
        else if(reg.Password__c != confirmPwd){
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter same password or confirm password');
        	}
        
        else{
            
            try{
                
                insert reg;
                pr = Page.LoginRegistrationSucess;
            	}
            Catch(Exception e){
                ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage());
                ApexPages.addMessage(msg);
            	
             } 
            
        	}
  
		return pr;
 	}
}