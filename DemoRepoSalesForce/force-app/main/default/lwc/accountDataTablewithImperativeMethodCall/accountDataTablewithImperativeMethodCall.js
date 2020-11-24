import { LightningElement,track} from 'lwc';
import getAccountRecordsList from '@salesforce/apex/AccountControllertoDisplayData.getAccountRecordsList';
export default class AccountDataTablewithImperativeMethodCall extends LightningElement {
    @track Accounts;
    @track error;
    searchKey = '';
    @track column = [
        {label : 'Name' , fieldName : 'Name', type:'text'},
        {label : 'Industry' , fieldName : 'Industry', type:'text'},
        {label:'Phone',fieldName : 'Phone',type:'Phone'},
    ];
    connectedCallback(){
        getAccountRecordsList({searchKey:this.searchKey})
        .then(result=>{
            this.Accounts = result;
        })
        .catch(error=>{
            this.error = error;
        });
    }
    handlechanges(event){
        this.searchKey = event.target.value;
        //console.log(this.searchKey);
        
        getAccountRecordsList({searchKey:this.searchKey})
        .then(result=>{
            this.Accounts = result;
        })
        .catch(error=>{
            this.error = error;
        });
    }

}