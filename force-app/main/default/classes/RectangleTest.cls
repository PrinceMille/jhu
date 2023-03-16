@isTest
public class RectangleTest {
    
    static testMethod void testRect(){
        
        Rectangle rect1 = new Rectangle(10,20);
        System.assertEquals(200,rect1.showResult());
        
    }

}