import { LightningElement, track } from 'lwc';

export default class ConditionRenderingComponent extends LightningElement {
    @track displayDiv = false;
    inputChangesHandler(event){
        this.displayDiv = event.target.checked;
    }
}