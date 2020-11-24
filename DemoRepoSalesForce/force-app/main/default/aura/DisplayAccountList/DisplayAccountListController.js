({
    init : function(component, event, helper) {

        component.set('v.columns',[
            {label: 'Name',fieldName:'Name',sortable:true,type:'text'},
            {label: 'Empolyees',fieldName:'NumberOfEmployees',sortable:true,type:'number'},
            {label: 'Phone',fieldName:'Phone',type:'Phone',sortable:true},
            {label: 'Type',fieldName:'Type',type:'text',sortable:true},
            {label: 'Industry',fieldName:'Industry',type:'text',sortable:true},
        ]);
            helper.setData(component);
            
            },
            handleSort : function(component, event, helper){
            console.log('1');
            var fieldName = event.getParam('fieldName');
            var sortDirection = event.getParam('sortDirection');
            console.log(sortDirection);
            component.set("v.sortedBy", fieldName);
            component.set("v.sortDirection", sortDirection);
            helper.SortData(component,fieldName,sortDirection);
            }
            })