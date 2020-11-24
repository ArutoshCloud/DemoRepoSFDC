import { LightningElement, track, api} from 'lwc';

export default class PublicMethodChild extends LightningElement {
    value = ['red'];
    options = [
        {label:'Red Label', value:'red'},
        {label:'Green Label', value:'green'},
        {label:'Blue Label', value:'blue'},
        {label:'Black Label', value:'black'},
];
    @api
    SelectCheckBox(CheckBoxValue){
        console.log(CheckBoxValue);
        const SelectedCheckBox = this.options.find(CheckBox=>{
            console.log(CheckBox.value);
            return CheckBoxValue === CheckBox.value;
        });
        if(SelectedCheckBox){
            console.log(SelectedCheckBox.value);
            this.value = SelectedCheckBox.value;
            return 'Checked Succesfully';
        }
        return 'No checkBox Found';

    }
}