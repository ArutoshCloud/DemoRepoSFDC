public class FileUploadController {
    @AuraEnabled
    public static Id saveChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) {
        // check if fileId id ''(Always blank in first chunk), then call the saveTheFile method,
        //  which is save the check data and return the attachemnt Id after insert, 
        //  next time (in else) we are call the appentTOFile() method
        //   for update the attachment with reamins chunks   
        try{
            
            system.debug(parentId);
            system.debug(fileName);
            system.debug(base64Data);
            system.debug(contentType);
            system.debug(fileId);
            if (fileId == '') {
                fileId = saveTheFile(parentId, fileName, base64Data, contentType);
            } else {
                appendToFile(fileId, base64Data);
            }
        }
        
        catch(Exception ex){
            system.debug(ex.getMessage());
        }if(fileId != NUll){
            system.debug(fileId);
            return Id.valueOf(fileId);
        }
        return null;
        
    }
    
    public static Id saveTheFile(Id parentId, String fileName, String base64Data, String contentType) {
        try{
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        Attachment oAttachment = new Attachment();
        oAttachment.parentId = parentId;
        
        oAttachment.Body = EncodingUtil.base64Decode(base64Data);
        oAttachment.Name = fileName;
        oAttachment.ContentType = contentType;
        system.debug(oAttachment);
        insert oAttachment;
        
            return oAttachment.Id;
                }
        
        catch(Exception ex){
            system.debug(ex.getMessage());
        }
        return null;
    }
    
    private static void appendToFile(Id fileId, String base64Data) {
        try{
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        Attachment a = [
            SELECT Id, Body
            FROM Attachment
            WHERE Id =: fileId
        ];
        
        String existingBody = EncodingUtil.base64Encode(a.Body);
        
        a.Body = EncodingUtil.base64Decode(existingBody + base64Data);
        
        update a;
                }
        
        catch(Exception ex){
            system.debug(ex.getMessage());
        }
    }
    
}