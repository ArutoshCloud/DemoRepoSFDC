public class OppextensionClass {
    public Opportunity opp {get;set;}
      public String CurrentRecordId{get;set;}
    ApexPages.StandardController scontroller;
    public OppextensionClass(ApexPages.StandardController controller){
        scontroller = controller;   
        scontroller.addFields(new List<String>{'Name','StageName','CloseDate'});
        CurrentRecordId= scontroller.getId();
        opp = (Opportunity)scontroller.getrecord();
        
    }

    public pageReference saveCustom() {
        PageReference pr = scontroller.Edit();
        return pr;
    }
    public pageReference viewCustom() {
        PageReference pr = scontroller.view();
        return pr;
    }
        public pageReference resetCustom() {
        PageReference pr = new PageReference(System.currentPageReference().getURL());
            pr.setRedirect(true);
        return pr;
    }
    
}