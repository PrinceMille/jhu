public class CustomListControl {
    
    public ApexPages.StandardSetController con {
               
        get {
            
            if(con == null){
                
              con = new ApexPages.StandardSetController (
                	[SELECT Id, Name, Industry, Rating FROM Account LIMIT : LIMITS.getLimitQueryRows()]   
                );
                
                con.setPageSize(Integer.valueOf(Org_Wide_Settings__c.getInstance().Page_Size__c));
            }
            
            return con;
        }
        
        set;
    }
    
    public List<Account> getAccounts(){
        
        return con.getRecords();
    }

}