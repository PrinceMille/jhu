public class Rectangle{

@TestVisible Decimal length=10, breadth=20;

public Rectangle(Decimal length,Decimal breadth){

        this.length = length;
        this.breadth = breadth;
        
    }
    public Decimal showResult(){
        return this.length * this.breadth;
    }  
    
    
  }