public class customFileuploadcontroller {
    public string code {get;set;}
    public customFileuploadcontroller(){
        code = ApexPages.currentPage().getParameters().get('code');
    }

}