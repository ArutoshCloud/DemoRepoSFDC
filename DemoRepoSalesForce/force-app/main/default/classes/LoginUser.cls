public class LoginUser {
    @auraenabled
    public static string details(string usrname, string password){
        string result = '';
        system.debug(usrname);
        system.debug(password);
        list<contact> con = [Select Password__c,Username__c from Contact where Username__c =: usrname limit 1];
        system.debug(con);
        if(con.size()>0){
            if(con[0].Username__c != Null){
                if(con[0].Password__c != Null){
                    if(con[0].Password__c == password){
                        result = 'Password Matched';
                    }
                    else{
                        result = 'NO Matched Password';
                    }
                }
                else{
                    result = 'Password is Empty';
                }
                
            }
            else{
                result = 'No UserName Exists';
            }
        }
        else{
            result = 'No UserName Exists';
        }
        
        
            return result;
        
    }
}