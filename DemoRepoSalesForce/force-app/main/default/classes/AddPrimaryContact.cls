public class AddPrimaryContact implements queueable {
    private contact contacts;
    private string state;
    public AddPrimaryContact(Contact contacts,String State){
        this.contacts = contacts;
        this.state = state;
        
    }
    public void execute(queueableContext qc){
        List<Account> acclist = [Select Name From Account Where BillingState =: state limit 200];
        List<Contact> conlist = new List<Contact>();
        for(Account acc : acclist){
            Contact con = contacts.clone(false,false,false,false);
            con.accountId = acc.id;
            conlist.add(con);
        }
        if(conlist.size()>0){
            insert conlist;
        }

    }
}