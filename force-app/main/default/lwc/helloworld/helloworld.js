import { LightningElement,track } from 'lwc';
export default class HelloWorld extends LightningElement {
 
 @track greeting = 'Prince Salesforce World';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}