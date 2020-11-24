import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountControllertoDisplayData.getAccounts';
export default class AccountDataList extends LightningElement {
     accounts;
    @wire(getAccounts) datarecords({data,error}){
        console.log(data);
        if(data){
            this.accounts = data;
            }
            else if(error){
                this.accounts = undefined;

            }
    }
    
        //console.log(data);
    
}