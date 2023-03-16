public class AccountContactsExt {
    
    Id accId;
    List<ContactWrapper> conWrapLst;
    
    public String subject {get;set;}
    public String emailBody {get;set;}
    
    public AccountContactsExt(ApexPages.StandardController controller){
        accId = controller.getId();
    }
    
    public List<ContactWrapper> getContacts(){
        
        conWrapLst = new List<ContactWrapper>();
        for(Contact con: [SELECT  Id, FirstName, LastName, Email, MobilePhone FROM Contact WHERE AccountId =: accId])
        
        	{
            
            	ContactWrapper conWrap = new ContactWrapper();
            	conWrap.isTrue= false;
            	conWrap.con= con;
                conWrapLst.add(conWrap);
        	}
        
        return conWrapLst;
    }
    
    public class ContactWrapper {
        public Boolean isTrue{get;set;}
        public Contact con{get;set;}
    }
    
    public void saveCons(){
        List<Contact> conLst = new List<Contact>();  
        for(ContactWrapper conWrap : conWrapLst){
            if(conWrap.isTrue){
                conLst.add(conWrap.con);
            }  
        } 
        
        if(conLst.size() > 0){
            update conLst;
        }
    }
    
    public void sendEmail(){
        
        if(String.isBlank(subject) || String.isBlank(emailBody)){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter subject && body'));
        }
        else{
            List<String> toAddress = new List<String>();
            for(ContactWrapper conWrap : conWrapLst){
                
                if(conWrap.isTrue){
                    toAddress.add(conWrap.con.Email);
                }
            }
            
            if(toAddress.size() > 0){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(toAddress);
                mail.setSubject(subject);
                mail.setPlainTextBody(emailBody);
                
                Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});
            }
            else{
               ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter atlease one contact')); 
            }
        }
    }
    
}