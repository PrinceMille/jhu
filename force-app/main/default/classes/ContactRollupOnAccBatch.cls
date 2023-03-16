public class ContactRollupOnAccBatch implements Database.Batchable<Sobject>, Schedulable, Database.Stateful{
    String temp='';
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        
        temp='Start';
        System.debug(temp);
        
        String query = 'SELECT Id, Number_of_USA_Contacts__c FROM Account WHERE Number_of_USA_Contacts__c = null';
        return Database.getQueryLocator(query);
     
    }
    
    public void execute(Database.BatchableContext bc,List<Sobject> sobjects){
        
        temp='execute';
        System.debug(temp);
        
        Set<Id> accIds = new Set<Id>();
        for(Sobject sobj: sobjects){
            
            accIds.add(sobj.Id);
        }
        
         Map<Id,Integer> accIdConCountMap = new Map<Id,Integer>();
    Map<Id,List<Contact>> accIdConLstMap = new Map<Id,List<Contact>>();
    
    for(Contact con: [SELECT Id,AccountId FROM Contact WHERE AccountId in: accIds AND MailingCountry = 'USA']){
        
        if(accIdConCountMap.containsKey(con.AccountId)){
            Integer count = accIdConCountMap.get(con.AccountId)+1;
            
            accIdConCountMap.put(con.AccountId,count);
          }
            else {
                accIdConCountMap.put(con.AccountId,1);
             }
        }
    
    List<Account> accs4UpdLst = new List<Account>();
    
    for(Id accId: accIds){
        
        Account acc = new Account(
         Id = accId,
         Number_Of_USA_Contacts__c = accIdConCountMap.get(accId)
        );
      accs4UpdLst.add(acc);  
    }
    
    update accs4UpdLst;
    }

    public void finish(Database.BatchableContext bc){
        
        temp='finish';
        System.debug(temp);
       
        AsyncApexJob asyncJob = [SELECT Id, JobType, Status, TotalJobItems, NumberOfErrors, CreatedBy.Email FROM AsyncApexJob WHERE Id =: bc.getJobId()];
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new List<String> {asyncJob.CreatedBy.Email});
        mail.setSubject('Apex Status');
        mail.setPlainTextBody('total jobs'+asyncJob.TotalJobItems);
        //Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});
        
        Datetime sysTime = System.now();
        sysTime = sysTime.addMinutes(5);
        String chronExp = ''+sysTime.second()+' '+sysTime.minute()+' '+sysTime.hour()+' '+sysTime.day()+' '+sysTime.month()+' ? '+sysTime.year();
        System.schedule('ContactRollupOnAccBatch:'+system.now(), chronExp, new  ContactRollupOnAccBatch());
        
    }
    
    public void execute(SchedulableContext sc){
        
        Database.executeBatch(new ContactRollupOnAccBatch());
    }  
}