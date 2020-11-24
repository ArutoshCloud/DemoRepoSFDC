public with sharing class CalculateSumResult {
    public CalculateSumResult() {

    }
    @AuraEnabled
    public static decimal getSumResult(decimal firstNumber, decimal secondNumber, string label){
        system.debug(firstNumber);
        system.debug(secondNumber);
        system.debug(label);
        decimal resultNumber;
        if(label == 'Add'){
            resultNumber = firstNumber+secondNumber;
        }
        else         if(label == 'Subtract'){
            resultNumber = firstNumber-secondNumber;
        }
        else         if(label == 'Multiply'){
            resultNumber = firstNumber*secondNumber;
        }
        else         if(label == 'Division'){
            resultNumber = firstNumber/secondNumber;
        }
        return resultNumber;
        
    }
}