public class EmailManager {
	public static void SendEmailToUser(List<User> usrlist){
        list<String> usr_name = new list<String>();
        for(User usr : usrlist){
            usr_name.add(usr.Name);
        }
        User usr_1 = [Select LastLoginDate,Name,UserName,ProfileId,Email From User Where UserName In : usr_name limit 1];
            Id usr_id = usr_1.Id;               
            System.resetPassword(usr_id, true);    
    }
}