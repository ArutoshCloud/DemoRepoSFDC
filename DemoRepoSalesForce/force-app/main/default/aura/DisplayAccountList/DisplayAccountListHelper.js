({
    
    setData : function(cmp){
        var action=cmp.get("c.getaccounts");
        action.setCallback(this,function(response){
            console.log(response.getReturnValue());
            var state = response.getState();
            if(state="SUCCESS"){
                cmp.set('v.acclist',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },    
    
    
    SortData: function(cmp, fieldName, sortDirection) {
        var data = cmp.get("v.acclist");
        //function to return the value stored in the field
        console.log('sortDirection '+sortDirection);
        var key = function(a) {return a[fieldName]; }
        var reverse = sortDirection == 'asc' ? 1: -1;
        //console.log('Key '+key);
        console.log('reverse '+reverse);
        // to handel number/currency type fields 
        if(fieldName == 'NumberOfEmployees'){ 
            data.sort(function(a,b){
                console.log('before '+key(a));
                console.log('before '+key(b));
                var a = key(a) ? key(a) : '';
                var b = key(b) ? key(b) : '';
                console.log('after '+a);
                console.log('after '+b);
                console.log('(a>b) '+((a>b)));
                console.log('(b>a) '+((b>a)));
                console.log('compare '+((a>b) - (b>a)));
                console.log('return '+(reverse*((a>b) - (b>a))));
                return reverse * ((a>b) - (b>a));
            }); 
        }
        else{// to handel text type fields 
            data.sort(function(a,b){ 
                var a = key(a) ? key(a).toLowerCase() : '';//To handle null values , uppercase records during sorting
                var b = key(b) ? key(b).toLowerCase() : '';
                return reverse * ((a>b) - (b>a));
            });    
        }
        //set sorted data to accountData attribute
        cmp.set("v.acclist",data);
        
        
        
    }
    
})