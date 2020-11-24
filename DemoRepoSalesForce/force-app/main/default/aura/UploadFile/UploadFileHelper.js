({
    MAX_FILE_SIZE: 4500000, //Max file size 4.5 MB 
    CHUNK_SIZE: 750000,      //Chunk Max size 750Kb 
    
    uploadHelper: function(c, e) {
        try{
            console.log('uploadHelper');
                    // start/show the loading spinner   
        c.set("v.showLoadingSpinner", true);
        // get the selected files using aura:id [return array of files]
        var fileInput = c.find("fileId").get("v.files");
        // get the first file using array index[0]  
        console.log(fileInput[0]);
        var file = fileInput[0];
        var self = this;
        // check the selected file size, if select file size greter then MAX_FILE_SIZE,
        // then show a alert msg to user,hide the loading spinner and return from function  
        if (file.size > self.MAX_FILE_SIZE) {
            c.set("v.showLoadingSpinner", false);
            c.set("v.fileName", 'Alert : File size cannot exceed ' + self.MAX_FILE_SIZE + ' bytes.\n' + ' Selected file size: ' + file.size);
            return;
        }
 
        // create a FileReader object 
        var objFileReader = new FileReader();
        // set onload function of FileReader object   
        objFileReader.onload = $A.getCallback(function() {
            var fileContents = objFileReader.result;
            var base64 = 'base64,';
            console.log(fileContents);
            
            var dataStart = fileContents.indexOf(base64) + base64.length;
 	
            fileContents = fileContents.substring(dataStart);
            console.log(fileContents);
            // call the uploadProcess method 
            self.uploadProcess(c, file, fileContents);
        });
 
        objFileReader.readAsDataURL(file);
        }
        catch(error){
            console(error.message);
        }

    },
 
    uploadProcess: function(c, file, fileContents) {
        console.log('uploadProcess');
        // set a default size or startpostiton as 0 
        var startPosition = 0;
        // calculate the end size or endPostion using Math.min() function which is return the min. value   
        var endPosition = Math.min(fileContents.length, startPosition + this.CHUNK_SIZE);
 
        // start with the initial chunk, and set the attachId(last parameter)is null in begin
        this.uploadInChunk(c, file, fileContents, startPosition, endPosition, '');
    },
 
 
    uploadInChunk: function(c, file, fileContents, startPosition, endPosition, attachId) {
        // call the apex method 'saveChunk'
        try{
            console.log('uploadInChunk');
        var getchunk = fileContents.substring(startPosition, endPosition);
        var action = c.get("c.saveChunk");
            
        action.setParams({
            parentId: c.get("v.parentId"),
            fileName: file.name,
            base64Data: encodeURIComponent(getchunk),
            contentType: file.type,
            fileId: attachId
        });
 
        // set call back 
        action.setCallback(this, function(response) {
            // store the response / Attachment Id   
            attachId = response.getReturnValue();
            var state = response.getState();
            console.log(attachId);
            if (state === "SUCCESS") {
                console.log('Success');
                // update the start position with end postion
                startPosition = endPosition;
                endPosition = Math.min(fileContents.length, startPosition + this.CHUNK_SIZE);
                // check if the start postion is still less then end postion 
                // then call again 'uploadInChunk' method , 
                // else, diaply alert msg and hide the loading spinner
                if (startPosition < endPosition) {
                    this.uploadInChunk(c, file, fileContents, startPosition, endPosition, attachId);
                } else {
                    c.get('c.doInit');
                    alert('your File is uploaded successfully');
                    c.set("v.showLoadingSpinner", false);
                }
                // handel the response errors        
            } else if (state === "INCOMPLETE") {
                console.log('INCOMPLETE');
                alert("From server: " + response.getReturnValue());
            } else if (state === "ERROR") {
                console.log('error');
                var errors = response.getError();
                console.log(errors);
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        // enqueue the action
        $A.enqueueAction(action);
                }
        catch(error){
            console(error.message);
        }
    }
})