@istest
public class TestDataUtility {

    public static Case newCase(){ 
        return new Case(
        Subject = 'test',
        Origin = 'Origin Test',
        Priority = 'HIGH',       
        Status = 'New'
        );
    }
    
    public static Account newAccount(){
        return new Account(
        Name = 'Test-Account--1'
        );
    }
}