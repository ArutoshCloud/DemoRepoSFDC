public class CurrentRecordIdTest {
    public string CurrentRecordId{get;set;}
     ApexPages.StandardController scontroller;
    public string parameterValue{get;set;}
    public CurrentRecordIdTest(ApexPages.standardController controller){
        currentRecordId = ApexPages.currentPage().getparameters().get('Id');
         parameterValue = ApexPages.CurrentPage().getparameters().get('nameParam');
        sController = controller;
    }
        public pageReference saveCustom() {
        PageReference pr = scontroller.Edit();
        return null;
    }
    
}