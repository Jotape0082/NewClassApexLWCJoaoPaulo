import { LightningElement, track } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunitySummary.getOpportunities';
import { NavigationMixin } from 'lightning/navigation';

const columns = [
                    {
                        label: 'Id da oportunidade',
                        fieldName : 'Id',
                        type: 'text',
                        shortable : false
                    },
                    {
                        label: 'Nome da oportunidade',
                        fieldName : 'Name',
                        type: 'text',
                        shortable : true
                    },
                ];

export default class OpportunitySummary extends NavigationMixin(LightningElement) {

    @track columns = columns;
    @track data = [];
    @track rowOffset = 0;

    connectedCallback(){
        this.findOpportunities();
    }

    //cria um metod que vai chamar o backend e trazer as oportunidades para cá
    findOpportunities(){
        getOpportunities({}).then( (response) => {
            console.log('response', response);
            this.data = response;
        });
    }

    executeNewSale(){
        console.log('Clicou no Botão');
        this [NavigationMixin.Navigate]({
            type : 'standard__navItemPage',
            atributes: {
                apiName : 'Carrinho'
            }
        })
    }

}