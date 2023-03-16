//test

public class AjaxDemoCntrl {
    
    public String selVal {set;get;}
	public String styleInfo {set;get;}
    
    public  AjaxDemoCntrl(){
        selVal = 'India';
      }
    
    public void changeColor(){
        styleInfo = 'color:blue';
    }
    
   
    public Country_Info__mdt getCountry(){
        
        return [SELECT MasterLabel, Capital_City__c, Continent__c, ISD_Code__c FROM Country_Info__mdt WHERE MasterLabel =: selVal];
    }
    
    public List<SelectOption> getOptionsTest(){
        
         return new List<SelectOption>{
            new SelectOption('India','India'),
            new SelectOption('USA','USA'),
            new SelectOption('Canada','Canada')
        };
            
    }
    
    public List<Schema.PicklistEntry> getPickListValues(String objectApiName, String pickFieldApiName){
        
        return Schema.getGlobalDescribe().get(objectApiName).getDescribe().fields.getMap().get(pickFieldApiName).getDescribe().getPickListValues(); 
    }
    public List<SelectOption> getOptions(){
        
        List<SelectOption> options = new List<SelectOption>();
        /*for(Schema.PicklistEntry pe : getPickListValues('Applicant__c','Country__c'))
        	{
  				options.add(new SelectOption(pe.getLabel(),pe.getValue()));          
        	}*/
        
        for(Country_Info__mdt cmdt : [SELECT MasterLabel, Capital_City__c, Continent__c, ISD_Code__c FROM Country_Info__mdt]){
          options.add(new SelectOption(cmdt.MasterLabel,cmdt.MasterLabel));  
        }
        return options;
    }
    
    
}