import { LightningElement, track, api } from 'lwc';

import getSumResult from '@salesforce/apex/CalculateSumResult.getSumResult';
export default class ComponentToPassArgumentToApex extends LightningElement {
    @track sum = 0;
    @track fNumber = 0;
    @track sNumber = 0;
    @track errors; 
    @track previousResult = [];
    @api title;
    @track operator = '+';
    @track displaydiv = false;
    @track showpreviousresult = false;
    @api greetings;
    @track label ='';
    handlesubmit(event){
        console.log(this.sNumber);
        console.log(this.fNumber);
        this.displaydiv = true;
        console.log(this.displaydiv);
        this.label = event.target.label;
        this.operator = event.target.name;
        
        getSumResult({firstNumber:this.fNumber,secondNumber:this.sNumber,label : this.label})
            .then(result=>{
                this.sum = result;
                console.log(result);
            })
            .catch(error=>{
                this.errors = error;
            });
            //console.log(this.result);
            this.previousResult.push(this.sum);
            console.log(this.previousResult);
            if(this.previousResult.length()>3){
                this.previousResult.length = 0;
            }
            //console.log(this.previousResult);
    }
    handleSelectBox(event){
        this.showpreviousresult = event.target.checked;
        console.log(this.displaydiv);
    }
    handlechanges(event){
        if(event.target.name == 'fNumber'){
            this.fNumber = parseInt(event.target.value);
        }
        else if(event.target.name == 'sNumber'){
            this.sNumber = parseInt(event.target.value);
        }
        
    }

    
}