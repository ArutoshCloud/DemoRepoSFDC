({
    handleclick : function(component, event, helper) {
        let payload = {
            data : component.get('v.input')
        }
        component.find("sampleMessageChannel").publish(payload);

    }
})