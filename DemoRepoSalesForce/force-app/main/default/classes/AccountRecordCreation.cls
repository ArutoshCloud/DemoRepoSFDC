public class AccountRecordCreation {
	@auraenabled
    public static void saveaccount(account accnt){
        upsert accnt;
    }
}