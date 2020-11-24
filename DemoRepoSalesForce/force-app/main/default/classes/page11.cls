public class page11 {
    public Boolean disable {get;set;}
    
    public ID myid {get;set;}
    public Opportunity opp {get;set;}
    public  page11(ApexPages.StandardController con){
        
        myid = con.getid();
        opp = [Select Name,StageName From opportunity Where Id =: myid];
        system.debug(opp);
        if(opp.StageName == 'Closed Won'){
            system.debug('yes');
            disable = True;
        }
        else{
            disable= False;
        }
    }
    
    
}