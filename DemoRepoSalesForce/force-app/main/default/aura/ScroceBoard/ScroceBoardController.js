({
    doInit : function(component, event, helper) {
        var url = $A.get('$Resource.Images');
        component.set('v.backgroundImageURL', url);
        
        
    },
    handleflow : function(component, event, helper){
        if(component.get('v.show4') == true){
            component.set('v.show1',true);
            var flow = component.find("flowData");
            var player1 = component.get('v.Player1');
            var run = component.get("v.run1");
            
            var runint = parseInt(run);
            console.log(typeof(runint));
            
            var inputVariables = [
                
                {
                    name : 'PlayerScore',
                    type : 'Number',
                    value : component.get("v.run1")
                },
                {
                    name : 'StrikeOut',
                    type : 'Number',
                    value : component.get("v.stkRate1")
                }
                ,
                {
                    name : 'NumberofBallsPlayed',
                    type : 'Number',
                    value : component.get("v.ball1")
                }
            ];
            console.log(inputVariables);
            flow.startFlow("Email_Alert", inputVariables);
        }
        
    },
    statusChange : function(cmp, evt){
        if(evt.getParam('status') == 'FINISHED'){
            cmp.set('v.show1',false);
        }
    },
    close1Modal  : function(component, event, helper){
        component.set('v.show',false);
    },
    setTarget : function(component, event, helper){
        try{
            component.set('v.show2',true);  
        }
        catch(ex){
            console.log(ex.message());
        }
        
        
    },
    close2Modal : function(component, event, helper){
        
        try{
            
            console.log(event.getSource().getLocalId());
            if(event.getSource().getLocalId() == 'set'){
                component.set('v.show3',true);
            }
            
            component.set('v.show2',false);
        }
        catch(ex){
            console.log(ex.message);
        }
        
    },
    close3Modal : function (component, event, helper){
        component.set('v.show1',false);
    },
    handleRun : function(component, event, helper) {
        var count = 0; 
        component.set('v.show',true);
        var run = event.getSource().getLocalId();
        //count = component.get('v.count');
        component.set('v.crrrun',run); 
        
        
        
    },
    closemodel : function(component, event, helper){
        component.set('v.show4',true);
        
        var count = 0;
        var swap =0;
        count = component.get('v.count');   
        var plyr = event.getSource().getLocalId();
        
        component.set('v.Player',plyr);
        var player1 = component.get('v.Player1');
        var player2 = component.get('v.Player2');
        var player = component.get('v.Player');
        var run = component.get('v.crrrun');
        var plyr2Id = event.getSource().getLocalId();
        console.log('player1--'+player1);
        console.log('player2--'+player2);
        console.log('player--'+player);
        console.log(typeof(run));
        try{
            component.set('v.batsman1',player1);
            var runint = parseInt(run);
            
            if(player == player1){
                component.set('v.run1',component.get('v.run1')+runint);
                component.set('v.ball1',component.get('v.ball1')+1);
                var r1 = component.get('v.run1');            
                var b1 = component.get('v.ball1');
                var stkRate1 = component.get('v.stkRate1');
                stkRate1 = (r1/b1)*100;
                stkRate1 = parseFloat(stkRate1);
                stkRate1 = stkRate1.toFixed(2);
                component.set('v.stkRate1',stkRate1);
                
                
            }
            else{
                component.set('v.run2',component.get('v.run2')+runint);
                component.set('v.ball2',component.get('v.ball2')+1);
                var r2 = component.get('v.run2');
                var b2 = component.get('v.ball2');
                var stkRate2 = component.get('v.stkRate2');
                console.log(r2);
                console.log(b2);
                stkRate2 = parseFloat(stkRate2);
                stkRate2 = (r2/b2)*100;            
                stkRate2 = stkRate2.toFixed(2);            
                component.set('v.stkRate2',stkRate2);
            }
            var batsman1 = component.get('v.Player1');
            var run1 = component.get('v.run1');
            var run2 = component.get('v.run2');
            var ball1 = component.get('v.ball1');
            var ball2 = component.get('v.ball2');
            var stkRate2 = component.get('v.stkRate2');
            var stkRate1 = component.get('v.stkRate1');
            
            //component.set('v.Player1',player);
            
            //if(run%2 != 0 ){
            console.log(count);
            if(run%2 != 0){
                if(plyr == 'Batsman1'){
                    component.set('v.showbatsman1',true);
                    component.set('v.showbatsman2',false);
                }else
                {
                    component.set('v.showbatsman2',true);
                    component.set('v.showbatsman1',false);
                }
                if(count%6 ==0){
                    if(plyr == 'Batsman1'){
                        console.log('hi');
                        component.set('v.showbatsman1',false);
                        component.set('v.showbatsman2',true);
                    }else
                    {
                        component.set('v.showbatsman2',false);
                        component.set('v.showbatsman1',true);
                    }
                }
                if(player != player1 ){
                    swap = 1;
                    component.set('v.Player1',player);
                    component.set('v.run1',run2);
                    component.set('v.ball1',ball2);
                    component.set('v.stkRate1',stkRate2);
                    //component.set('v.run1',component.get('v.run1')+runint);
                    console.log(batsman1);
                    component.set('v.Player2',batsman1);
                    component.set('v.run2',run1);
                    component.set('v.ball2',ball1);
                    component.set('v.stkRate2',stkRate1);                   
                    
                }
                else{
                    var batsman1 = component.get('v.Player1');
                    var run1 = component.get('v.run1');
                    var run2 = component.get('v.run2');
                    var ball1 = component.get('v.ball1');
                    var ball2 = component.get('v.ball2');
                    var stkRate2 = component.get('v.stkRate2');
                    var stkRate1 = component.get('v.stkRate1');
                    component.set('v.Player1',player2);
                    component.set('v.run1',run2);
                    component.set('v.ball1',ball2);
                    component.set('v.stkRate1',stkRate2);
                    //component.set('v.run1',component.get('v.run1')+runint);
                    console.log(batsman1);
                    component.set('v.Player2',batsman1);
                    component.set('v.run2',run1);
                    component.set('v.ball2',ball1);
                    component.set('v.stkRate2',stkRate1);                   
                    
                }
                if(count == 1 && plyr=='Batsman2'){
                    var player2 = component.get('v.Player2');
                    var batsman1 = component.get('v.Player1');
                    var run1 = component.get('v.run1');
                    var run2 = component.get('v.run2');
                    var ball1 = component.get('v.ball1');
                    var ball2 = component.get('v.ball2');
                    var stkRate2 = component.get('v.stkRate2');
                    var stkRate1 = component.get('v.stkRate1');
                    component.set('v.Player1',player2);
                    component.set('v.run1',run2);
                    component.set('v.ball1',ball2);
                    component.set('v.stkRate1',stkRate2);
                    //component.set('v.run1',component.get('v.run1')+runint);
                    console.log(batsman1);
                    component.set('v.Player2',batsman1);
                    component.set('v.run2',run1);
                    component.set('v.ball2',ball1);
                    component.set('v.stkRate2',stkRate1);
                }
                
                if(count%6 == 0){
                    var player2 = component.get('v.Player2');
                    var batsman1 = component.get('v.Player1');
                    var run1 = component.get('v.run1');
                    var run2 = component.get('v.run2');
                    var ball1 = component.get('v.ball1');
                    var ball2 = component.get('v.ball2');
                    var stkRate2 = component.get('v.stkRate2');
                    var stkRate1 = component.get('v.stkRate1');
                    component.set('v.Player1',player2);
                    component.set('v.run1',run2);
                    component.set('v.ball1',ball2);
                    component.set('v.stkRate1',stkRate2);
                    //component.set('v.run1',component.get('v.run1')+runint);
                    console.log(batsman1);
                    component.set('v.Player2',batsman1);
                    component.set('v.run2',run1);
                    component.set('v.ball2',ball1);
                    component.set('v.stkRate2',stkRate1);
                }            
            }
            else{
                if(plyr == 'Batsman1'){
                    component.set('v.showbatsman1',false);
                    component.set('v.showbatsman2',true);
                }else
                {
                    component.set('v.showbatsman2',false);
                    component.set('v.showbatsman1',true);
                }
                if(player != player1 ){
                    swap = 1;
                    component.set('v.Player1',player);
                    component.set('v.run1',run2);
                    component.set('v.ball1',ball2);
                    component.set('v.stkRate1',stkRate2);
                    //component.set('v.run1',component.get('v.run1')+runint);
                    console.log(batsman1);
                    component.set('v.Player2',batsman1);
                    component.set('v.run2',run1);
                    component.set('v.ball2',ball1);
                    component.set('v.stkRate2',stkRate1);                   
                    
                }
                if(count%6 ==0){
                    if(plyr == 'Batsman1'){
                        component.set('v.showbatsman1',true);
                        component.set('v.showbatsman2',false);
                    }else
                    {
                        component.set('v.showbatsman2',true);
                        component.set('v.showbatsman1',false);
                    }
                }
                if(count%6 == 0){
                    var player2 = component.get('v.Player2');
                    var batsman1 = component.get('v.Player1');
                    var run1 = component.get('v.run1');
                    var run2 = component.get('v.run2');
                    var ball1 = component.get('v.ball1');
                    var ball2 = component.get('v.ball2');
                    var stkRate2 = component.get('v.stkRate2');
                    var stkRate1 = component.get('v.stkRate1');
                    component.set('v.Player1',player2);
                    component.set('v.run1',run2);
                    component.set('v.ball1',ball2);
                    component.set('v.stkRate1',stkRate2);
                    //component.set('v.run1',component.get('v.run1')+runint);
                    console.log(batsman1);
                    component.set('v.Player2',batsman1);
                    component.set('v.run2',run1);
                    component.set('v.ball2',ball1);
                    component.set('v.stkRate2',stkRate1);
                }
            }
            
            /*else{
                component.set('v.run2',component.get('v.run2')+runint);
            }*/
            
            //}
            
        }
        catch(ex){
            console.log(ex.message);
        }
        
        if(count <= 5){
            component.set('v.count',component.get('v.count')+1);
            var cntovr = component.get('v.over');
            console.log(typeof(cntovr));
            cntovr = parseFloat(cntovr);
            cntovr += 0.1;
            
            console.log(cntovr);
            cntovr = cntovr.toFixed(1);
            console.log(cntovr);
            component.set('v.over',cntovr);
            
        }
        else{
            component.set('v.count',1);
            var cntovr = component.get('v.over');
            var setover = component.get('v.Totalover');
            //console.log(typeof(cntovr));
            cntovr = parseFloat(cntovr);
            cntovr += 0.5;            
            //console.log(cntovr);
            cntovr = cntovr.toFixed(1);
            //console.log(cntovr);
            component.set('v.over',cntovr);
            
        }
        
        /*var player11 = component.get('v.Player1');
        var player22 = component.get('v.Player2');
        console.log('player1--'+player11);
        console.log('player2--'+player22);*/
        component.set('v.run',component.get('v.run')+runint);
        var totalrun = component.get('v.run');
        var totalball = ball1+ball2;
        var runRate = (parseFloat(totalrun/totalball));
        runRate = runRate.toFixed(2);
        var targetrun = component.get('v.Targetrun');
        var targetover = component.get('v.Totalover');
        
        if(component.get('v.Setrun') == 0 && component.get('v.Setover') == 0){
            component.set('v.Setrun',targetrun);
            component.set('v.Setover',targetover);
        }
        var targetover1 = targetover;
        var reqrun = targetrun - totalrun;
        var over = targetover - totalball;
        var reqRunRate = reqrun/over;
        reqRunRate = reqRunRate.toFixed(2);
        if(reqRunRate >0){
            component.set('v.runReq',reqRunRate);
        }
        
        console.log(reqRunRate);
        if(runRate > 0){
            component.set('v.runRate',runRate);
        }
        
        component.set('v.Targetrun',component.get('v.Setrun')-component.get('v.run'));
        // console.log(targetover-component.get('v.over'));
        if(count == 1){
            component.set('v.Totalover',(component.get('v.Setover')-0.5).toFixed(1));
            component.set('v.Setover',component.get('v.Totalover'));
            
        }
        else{
            component.set('v.Totalover',(component.get('v.Setover')-0.1).toFixed(1));
            component.set('v.Setover',component.get('v.Totalover'));
        }
        /*if(player == 'Suresh Raina' ){
            //component.set('v.ball2',component.get('v.ball2')+1);
            component.set('v.run2',component.get('v.run2')+runint);
        }
        else{
            //component.set('v.ball1',component.get('v.ball1')+1);
            component.set('v.run1',component.get('v.run1')+runint);
        }*/
        component.set('v.show',false);
    },
    handleOver : function(component, event, helper) {
        console.log('hi');
        component.set('v.count',1);
        var cntovr = component.get('v.over');
        //console.log(typeof(cntovr));
        cntovr = parseFloat(cntovr);
        cntovr += 0.4;
        
        //console.log(cntovr);
        cntovr = cntovr.toFixed(1);
        //console.log(cntovr);
        component.set('v.over',cntovr);
    }
})