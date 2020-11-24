trigger ProductsInSTDPRCBK on Product2 (after insert) {
    if(trigger.Isafter){
        if(trigger.IsInsert){
            ProductTriggerHandler.tocreatedefaultproducsinstdPriceBook(trigger.new);
        }
    }
    
}