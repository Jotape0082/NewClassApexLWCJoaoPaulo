import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import {fireEvent, registerListener} from 'c/pubsub';
import addNewCase from '@salesforce/apex/CaseController.addNewCase';
import { NavigationMixin} from 'lightning/navigation';

export default class Case2Details extends NavigationMixin (LightningElement) {


}
//paramos nos 25 min de video
