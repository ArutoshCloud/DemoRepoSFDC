({
    doInit : function(c, e, h){
        console.log('hi');
        try{
            c.set('v.parentId', c.get('v.recordId'));
            console.log(c.get('v.parentId'));
        }catch(error){
            console.log(error.message);
        }
        
    },
    doSave: function(c, e, h) {
        try{
            
            if (c.find("fileId").get("v.files").length > 0) {
                h.uploadHelper(c, e);
            } else {
                alert('Please Select a Valid File');
            }
        }catch(error){
            console.log(error.message);
        }
        
    },
    
    handleFilesChange: function(c, e, h) {
        try{
            var fileName = 'No File Selected..';
            if (e.getSource().get("v.files").length > 0) {
                fileName = e.getSource().get("v.files")[0]['name'];
            }
            c.set("v.fileName", fileName);
            
        }catch(error){
            console.log(error.message);
        }
        
    }
})