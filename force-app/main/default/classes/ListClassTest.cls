public class ListClassTest {
    
    public List<String> listStringObj = new List<String>();
    
    public void getMethodTest(){   
        listStringObj.add('Prince');
        listStringObj.add('varghese');
        listStringObj.add('Antony');
       
        listStringObj.sort();
        
        
        List<String> listStringObjRev = new List<String>();
        
        for(Integer i=listStringObj.size()-1;i>=0;i--){
            listStringObjRev.add(listStringObj[i]);
        }
        List<String> scndObj = new List<String>();
        scndObj.addAll(listStringObjRev);
        
        System.debug(scndObj);
    }
    
}