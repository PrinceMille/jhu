global class CourseAPI{

    webservice static String createCourse(String courseName){
    
        String msg=' ';
    
        Course__c course = new Course__c(Name__c = courseName);
    
        try{
              insert course;
              msg = 'Record Inserted Successfully'+course.Id;
        }
    
        catch(Exception e){
        
            msg = 'Failled to Insert'+ e.getMessage();    
    
        }
    
        return msg;
    
    }

}