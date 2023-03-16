@isTest
class ContactRollupOnAccBatchTest {
    
    @TestSetup
    static void makeData(){
        
        Account acc = TestDataUtility.newAccount();
        insert acc;
    }
    
    static testMethod void testContactRollupOnAccBatch(){
        
        ContactRollupOnAccBatch conRollup = new ContactRollupOnAccBatch();
        Database.executeBatch(conRollup);
    }
    
    @isTest static void testSchedulableClass(){
        
        Datetime sysTime = System.now();
        sysTime = sysTime.addMinutes(5);
        String chronExp = ''+sysTime.second()+' '+sysTime.minute()+' '+sysTime.hour()+' '+sysTime.day()+' '+sysTime.month()+' ? '+sysTime.year();
        System.schedule('ContactRollupOnAccBatch:'+system.now(), chronExp, new  ContactRollupOnAccBatch());
    }

}