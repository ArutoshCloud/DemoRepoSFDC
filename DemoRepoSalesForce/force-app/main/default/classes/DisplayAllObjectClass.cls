public class DisplayAllObjectClass {
    @auraenabled
    public static string selectvalue{get;set;}
    @auraenabled
    public  List<string> orgfields{get;set;}
    @auraenabled
    public  List<string> orgfieldsdataType{get;set;}
    @auraenabled
    public  List<string> orgfieldsAPIName{get;set;}
    @auraenabled
    public static list<string> getobjNames(){
        list<string> objs = new list<string>();
        list<Schema.SObjectType> sobjects = Schema.getGlobalDescribe().values();
        string slt = '-- Select --';
        objs.add(slt);
        for(Schema.SObjectType sobj : sobjects){
            objs.add(sobj.getDescribe().getName());
        }        
        objs.sort();
        system.debug(objs);
        return objs;
    }
    @auraenabled
    public static DisplayAllObjectClass getobjFields(string myvalue){
        DisplayAllObjectClass dspObj = new DisplayAllObjectClass();
        dspObj.orgfields = new list<string>();
        dspObj.orgfieldsdataType = new list<string>();
        dspObj.orgfieldsAPIName = new list<string>();
        list<string> objfields = new list<string>();
        string slt = '-- Select --';
        objfields.add(slt);
        if(!string.isBlank(myvalue)){
            Map<string, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType objSchema = schemaMap.get(myvalue);
            Map<string, Schema.SObjectField> fieldMap = objSchema.getDescribe().fields.getMap();
            /*for(string fieldName : fieldMap.KeySet()){
                objfields.add(fieldName);
                DisplayAllObjectClass.orgfields.add(fieldName);
            }*/
            for(Schema.SObjectField fieldapiName:fieldMap.values()){
                //objfields.add(fieldapiName.getDescribe().getLabel());
                dspObj.orgfields.add(fieldapiName.getDescribe().getLabel());
                dspObj.orgfieldsAPIName.add(fieldapiName.getDescribe().getName());
                Schema.DisplayType fldType = fieldapiName.getDescribe().getType();
                dspObj.orgfieldsdataType.add(string.valueof(fldType));
            }
        }       
        objfields.sort();
        //system.debug(objfields);
        system.debug(dspObj.orgfields);
        system.debug(dspObj.orgfieldsAPIName);
        return dspObj;
    }
    
}