@isTest
class CaseTriggerTest {

    static testMethod void caseTriggerUnitTest(){
        
		Case cs = TestDataUtility.newCase();
        cs.Status = 'Closed';
        insert cs;
        Test.startTest();
        try{
            delete cs;
        }
        catch(Exception e){
            System.assert(e.getMessage().contains('Case_Closed_Error_Msg'));
        }
        Test.stopTest();
    }

}