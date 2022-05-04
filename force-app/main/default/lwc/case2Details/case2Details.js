import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import {fireEvent, registerListener} from 'c/pubsub';
import addNewCase from '@salesforce/apex/CaseController.addNewCase';
import { NavigationMixin} from 'lightning/navigation';

export default class Case2Details extends NavigationMixin (LightningElement) {


    @wire(CurrentPageReference) pageRef;
    @track account = [];
    @track nameAccount;
    @track idAccount = ''}

    connectedCallBack(){
        registerListener('selectedAccount',this.accountSelected, this);
    }

    accountSelected(accountParam){
        //this.account = accountParam;
        //console.log('this.accountParam', this.accountParam);
        this.account = [];
        //this.idAccount = '';
        this.account.push({...JSON.parse(accountParam)});
        //console.log('this.account', this.account);
        this.nameAccount = account[0].nome;
        this.idAccount = account[0].id;
    }

    get isSeletedAccount(){
        return this.account !='';
    }

}
//paramos nos 25 min de video
