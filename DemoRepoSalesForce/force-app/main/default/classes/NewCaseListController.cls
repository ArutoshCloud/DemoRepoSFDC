public class NewCaseListController {
    public List<case> getnewcases(){
        List<case> cases = [Select CaseNumber From case where Status = 'New'];
        return cases;
    }

}