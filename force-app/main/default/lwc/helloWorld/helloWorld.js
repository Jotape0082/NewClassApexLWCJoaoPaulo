import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  greeting = 'Jompa';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}