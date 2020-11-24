public class StringArrayTest {
    public static list<String> generateStringArray(integer i){
 		list <String> strlist = new list<String>();
        for(Integer n=0;n<i;n++){
            String str1 = 'Test '+n;
            strlist.add(str1);
            
        }
    	return strlist;
    }
    

}