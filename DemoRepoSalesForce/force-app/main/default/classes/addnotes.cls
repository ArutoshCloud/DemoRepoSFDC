public class addnotes {
    @AuraEnabled
    public static String saveNotesForAddNotes_Apex(String notesData, String recordId){
        System.debug('notesdata--->'+notesData);
        System.debug('recordId--->'+recordId);

        if(notesData == null || notesData.trim() == ''){
            if(recordId == null || recordId.trim() == ''){
                return null;
            }
        }

        Note noteInstance = new Note();
        noteInstance.Body = notesData;
        noteInstance.ParentId = recordId;
        noteInstance.Title = userInfo.getName()+' '+System.now();

        insert noteInstance;
        System.debug('NodeInstance--->'+noteInstance);
        return JSON.serialize(noteInstance);
    }

    @AuraEnabled
    public static List<Note> getTheNotesOfTheRecord_Apex(String recordId,String sObjectName){
        System.debug('recordId--->'+recordId);
        System.debug('sObjectName--->'+sObjectName);
        if(recordId == null || recordId.trim() == ''){
            return null;
        }
        String query ='SELECT Id FROM '+sObjectName+' '+'WHERE Id =: '+'recordId' +' '+ 'LIMIT 1';
        List<sObject> objectList = Database.query(query);
        System.debug('objectList---->'+objectList);
        List<Note> noteLIst = new List<Note>();
        noteLIst = [
                SELECT
                        Body,
                        CreatedById,
                        CreatedDate,
                        Id,
                        IsDeleted,
                        IsPrivate,
                        LastModifiedById,
                        LastModifiedDate,
                        OwnerId,
                        ParentId,
                        SystemModstamp,
                        Title
                FROM Note WHERE ParentId  IN: objectList ORDER BY ParentId,CreatedDate DESC ];
        System.debug('noteList---->'+noteLIst);
        for(note n : notelist){
            system.debug(n.body.length());
        }
        if(noteLIst == null){
            return null;
        }else{
            return noteLIst;
        }

    }

}