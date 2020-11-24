trigger OnUser on User (After insert) {
    if(trigger.IsAfter){
        if(trigger.IsInsert){
            for(User usr : trigger.New){
                System.resetPassword(usr.Id,true);
            }
        }
    }

}