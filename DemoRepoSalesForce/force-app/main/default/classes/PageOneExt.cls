public class PageOneExt {
    public Account acc {get;set;}
      public String CurrentRecordId{get;set;}
    ApexPages.StandardController scontroller;
    public PageOneExt(ApexPages.StandardController controller){
        scontroller = controller;   
        scontroller.addFields(new List<String>{'Name','Type','Phone'});
        CurrentRecordId= scontroller.getId();
        acc = (Account)scontroller.getrecord();
        
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
        public pageReference deleteCustom() {
        
        return scontroller.delete();
    }
    
}