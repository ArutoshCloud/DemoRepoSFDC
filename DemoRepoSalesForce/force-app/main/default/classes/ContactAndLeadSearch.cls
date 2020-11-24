public class ContactAndLeadSearch {
    public static List<List<Sobject>> searchContactsAndLeads(String str){
        list<list<Sobject>> searchlist = [Find :str In All Fields Returning 
                                          Lead(LastName),Contact(LastName)];
        /*List<Lead> myleads = (List<Lead>)searchlist[0];
        List<Contact> mycontacts = (List<contact>)searchlist[1];
        list<list<Sobject>> new_searchlist = new LisT<List<sObject>>();
        
        List<Lead> leadlist = new List<Lead>();
        for(Lead ld:myleads){
            leadlist.add(ld);
        }
        
        List<Contact> contactlist = new List<Contact>();
        for(Contact con:mycontacts){
            contactlist.add(con);
        }
        new_searchlist.addAll((List<sObject>)leadlist);
		new_searchlist.addAll((List<sObject>)contactlist);
        
        */
        return searchlist ;
        
    }
}