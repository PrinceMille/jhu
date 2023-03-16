/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-25-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DatatableLwcCtrl {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {

       return [SELECT Id, FirstName,LastName, MobilePhone, Email FROM Contact];
        
    }
}