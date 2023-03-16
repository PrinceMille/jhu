public with sharing class LimitOffSetPaginationCtrl {
    
    Integer toSize =0, limitSize =5, offSetSize = 0;
    
    public LimitOffSetPaginationCtrl(){
        
        toSize = [SELECT count() FROM Account LIMIT: LIMITS.getLimitQueryRows()];
    }
    
    public List<Account> getAccounts(){
        
        return [SELECT Id, Name, Industry, Rating FROM Account LIMIT: Limits.getLimitQueryRows()];
    }
    
    public void first(){
        offSetSize = 0;
    }
    
    public void previous(){
        offSetSize = limitSize;
    }
    
    public void next(){
        offSetSize += limitSize;
    }
    
    public void last(){
        Integer reminder = Math.mod(toSize, limitSize);
        if(reminder == 0){
            offSetSize = toSize - limitSize;
        }
        else{
           offSetSize = toSize - reminder; 
        }
    }
    
    public Boolean getHasPrevious(){
        if(offSetSize ==0){
            return false;
        }
        return true;
    }
    public Boolean getHasNext(){
        if(limitSize + offSetSize >= toSize){
            return false;
        }
        return true;
    }
}