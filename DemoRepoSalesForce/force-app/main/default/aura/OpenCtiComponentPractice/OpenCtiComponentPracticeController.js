({
    doInit : function (cmp,evt,helper){
        helper.enableClickToDial_helper(cmp,evt,helper);
        window.addEventListener('Load',helper.ClickToDial_helper(cmp,evt,helper));
        

    },
    /*disableClickToDial : function(cmp, event, helper) {
        helper.disableClickToDial(cmp,event);

    },
    enableClickToDial : function(cmp, event, helper) {
        helper.enableClickToDial(cmp,event);

    },
    getAppViewInfo : function(cmp, event, helper) {
        helper.getAppViewInfo(cmp,event);

    },
    setSoftphonePanelHeight : function(cmp, event, helper){
        helper.setSoftphonePanelHeight(cmp,event);
    },
    onClickToDial : function(cmp, event, helper){
        try{
            console.log('----Inside onClickToDial-----');
            helper.onClickToDial(cmp,event,helper);
        }catch(ex){
            console.log(`Error----${ex}`);
        }
        
    }*/
    
    

})