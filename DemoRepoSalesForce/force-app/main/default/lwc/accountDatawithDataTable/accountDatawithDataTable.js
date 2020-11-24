import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountControllertoDisplayData.getAccounts';
export default class AccountDatawithDataTable extends LightningElement {
@track data;
@track column = [
    {label : 'Name' , fieldName : 'Name', type:'text'},
    {label : 'Industry' , fieldName : 'Industry', type:'text'},
    {label:'Phone',fieldName : 'phone',type:'phone'},
];
    @wire(getAccounts) datarecords({data,error}){
        if(data){
            this.data = data;
        }
        else if(error){
            this.data = undefined;
        }
    }
}