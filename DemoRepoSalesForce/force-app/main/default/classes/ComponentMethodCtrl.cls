public class ComponentMethodCtrl {
	@auraenabled
    public static List<sObject> getrecords(string objName,string objFields){
        return database.query('Select id,'+objFields+' From '+objName+' Limit 10');
    }
}