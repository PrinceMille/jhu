public class StandardListControllerPageExt {
    
    public StandardListControllerPageExt(ApexPages.StandardSetController con){
        
        con.setPageSize(Integer.valueOf(Org_Wide_Settings__c.getInstance().Page_Size__c));
        
    }

}