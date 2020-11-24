import { LightningElement } from 'lwc';

export default class PublicMethodParent extends LightningElement {
    value;
    onbuttonclick(){
        const buttonclick = this.template.querySelector('c-public-method-child');
        buttonclick.SelectCheckBox(this.value);
    }
    inputEventHandler(event){
        this.value = event.target.value;
    }
}