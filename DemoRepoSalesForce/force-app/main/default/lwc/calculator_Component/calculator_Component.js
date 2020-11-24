import { LightningElement, track } from 'lwc';

export default class Calculator_Component extends LightningElement {
      firstNumber = 0;
      secondNumber = 0;
    @track result = 0;
    handlechanges(event){
        if(event.target.name == "fNumber"){
            this.firstNumber = parseInt(event.target.value);
        }
        else if(event.target.name == "sNumber"){
            this.secondNumber = parseInt(event.target.value);

        }
        this.result = this.firstNumber+this.secondNumber;
    }
    //this.result = this.firstNumber+this.secondNumber;
    

}