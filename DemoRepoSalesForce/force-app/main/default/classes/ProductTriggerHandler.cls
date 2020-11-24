public class ProductTriggerHandler {
    public static void tocreatedefaultproducsinstdPriceBook(List<Product2> prolist){
        Pricebook2 stdpcb = [Select Name From Pricebook2 Where IsStandard=true];
    List<PriceBookEntry> stdpbelist = new List<PriceBookEntry>();
   
    for(Product2 pro : [Select Name From Product2 Where Id In : prolist]){
        PriceBookEntry stdpbe = new PriceBookEntry();
        stdpbe.Pricebook2Id = stdpcb.id;
        stdpbe.Product2Id = pro.id;        
        
        stdpbe.UnitPrice = 1;
        stdpbe.Isactive = true;
        stdpbelist.add(stdpbe);
    }
    if(stdpbelist.size()>0){
        insert stdpbelist;
    }
    }
}