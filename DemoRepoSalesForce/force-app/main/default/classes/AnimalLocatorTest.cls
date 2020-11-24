@isTest
public class AnimalLocatorTest {
     
    static testMethod void testgetAnimalNameById(){

        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Call method to test
        string result = AnimalLocator.getAnimalNameById(1);
                System.assertNotEquals(null,result,
            'The callout returned a null response.');
                System.assertEquals('tiger',result);
        
    }

}