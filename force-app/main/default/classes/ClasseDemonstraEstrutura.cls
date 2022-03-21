//Nome da classe
public with sharing class ClasseDemonstraEstrutura { // inicio da classe

    //Metodo da classe, uma classe pode ter varios metodos
    public static Boolean nomeDoMetodo() { //inicio do metodo

        //TIPO VARIAVEL | NOME VARIAVEL | VALR VARIAVEL
        Boolean bTrue = true;
        Boolean bFalse = false;
        String exemploString = 'teste1355';
        Integer exemploInterger = 1;
        Decimal exemploDecimal = 1.02;
        Double exemploDouble = 1.23652365;

        //coleções
        List<String> exemploLista = new List<String>();
        //[0] - Edgar
        //[1] - João Paulo
        //[2] - Arnaldo
        //[3] - Guilherme

        exemploLista.add ('Edgar');
        exemploLista.add ('João Paulo');
        exemploLista.add ('Arnaldo');
        exemploLista.add ('Guilherme');

        system.debug('exemploList = ' + exemploLista);
        system.debug('exemploList posição 2 = ' + exemploLista.get(2));
        system.debug('exemploList tamanho = ' + exemploLista.size());

        List<Integer> exemploListaInteger = new List<Integer>();
        exemploListaInteger.add(Null);
        exemploListaInteger.add(1);
        exemploListaInteger.add(2);
        exemploListaInteger.add(3);

        system.debug('exemploListaInteger - '+ exemploListaInteger);

        //coleção
        Set<String> exemploSet = new Set<String>();
        exemploSet.add ('Edgar');
        exemploSet.add ('João Paulo');
        exemploSet.add ('Arnaldo');
        exemploSet.add ('Guilherme');
        exemploSet.add ('Guilherme');
        exemploSet.add ('Guilherme');
        exemploSet.add ('Guilherme');

        system.debug('exemploSet - '+ exemploSet);
        system.debug('exemploSet - '+ exemploSet.size());

        List<Opportunity> OpportunityList = new List<Opportunity>([SELECT Id, name FROM Opportunity]);


        system.debug('OpportunityList - '+ OpportunityList);
        system.debug('OpportunityList Posição 2 - '+ OpportunityList.get(2));
        system.debug('OpportunityList Posição 2 - '+ OpportunityList.get(2).Name);
              

        return bFalse;

      

    }// Fim do metodo

    //Classe sem retorno
    public static void metodoSemRetorno(){

    }

    //Estrutura do SOQL
    private static List<Account> getAccounts(){
        List<Account> accountList = new List<Account>([SELECT id, Name FROM Account WHERE Id !='']);

        return accountList;
    }

    public static void getAccountPrivate(){
        system.debug(ClasseDemonstraEstrutura.getAccounts());
    }

    public static List<Opportunity> getOpportunitiesClosedWon(){
        List<Opportunity> oppList = new List<Opportunity>();

        oppList = [SELECT id, StageName FROM Opportunity WHERE StageName = 'Closed Won'];

        system.debug(oppList);
        system.debug('tamanho - ' + oppList.size());

        return OppList;
    }

    //Exemplo Parametros

    public static Integer exemploParametro(Integer pInt, Integer pDiv){

        Integer intTest = (10 + pInt)/ pDiv;

        system.debug('O valor de intTest é -'+ intTest);

        return intTest;

        // Debug no SF - Open Execute Anonymous Window
        // Classe . metodo
        // ClasseDemonstraEstrutura.exemploParametro(100,5);
    }

    public static void exibNome (String Nome, String Sobrenome){

        system.debug('Olá '+ Nome +' '+ Sobrenome);

    }

    //Execução DML 
    public static Account dmlAccountInsert(String name){
        Account accountObj = new Account();
        accountObj.Name = name;
        insert accountObj;
        return accountObj;
    }

    public static Account dmlAccountUpdate(String name, String idDaConta){

        List<Account>accountList = new List<Account>([SELECT id, name FROM Account WHERE Id = :idDaConta]);
        
        Account accountObj = new Account();

        if (accountList.size() > 0){
            accountObj = accountList.get(0);
            accountObj.Name = name;
            update accountObj;
        }

        return accountObj;        

    }

    public static void dmlAccountDelete(String idDaConta){

        List<Account>accountList = [SELECT id, name FROM Account WHERE Id = :idDaConta];
        Account accountObj = accountList.get(0);
        delete accountList;
    }


    public static Id InsertLead(String Lastname, String CompanyName){
        Lead LeadObj = new Lead();
        LeadObj.Lastname = Lastname;
        LeadObj.Company = CompanyName;

        insert LeadObj;

        return LeadObj.Id;
    }

    //Estrutura de condição
    public static Boolean demostraEstruturaCondicao (Integer idade){

        Boolean bMaiorDeIdade;
        if(idade < 18 ){
            system.debug('Menor de idade');  
            bMaiorDeIdade = false;
        }else{
            system.debug('Maior de idade');
            bMaiorDeIdade = true;
        }
        return bMaiorDeIdade;
    }

    public static void demostraEstruturaCondicao2 (Integer idade){

        if(idade < 0 || idade == null){
            system.debug('Idade invalida');
        }else{
            if(idade < 13 ){
                system.debug('Criança');
            }else if (idade >= 13 && idade <= 21){
                system.debug('Adolescente');
            }else if (idade > 21 && idade < 65){
                system.debug('Adulto');
            }else{
                system.debug('Idoso');
            } 
        }                  
    }
    
    
    //Desafio

    public static Integer somadeDoisValores(Integer p1, Integer p2){

        Integer resultado = p1 + p2;
        if(p1 > 5){
            resultado = resultado +2;
        }
        system.debug('resultado' + resultado);
        return resultado;
    }

    //Estrutura de repetição

    public static Decimal getOpportunitiesTotal(){
        Decimal total = 0;
        List<Opportunity> OpportunityList = new List<Opportunity>([SELECT Id, Amount FROM Opportunity]);

        for (Opportunity vTemp : OpportunityList) {
            total = total + vTemp.Amount;            
        }
        system.debug('valor total das Oportunidades =' + total);

        return total;
    }

    public static Decimal getOpportunitiesTotalDiferenteDe(){
        Decimal total = 0;
        List<Opportunity> OpportunityList = new List<Opportunity>([SELECT Id, Amount FROM Opportunity WHERE StageName != 'Closed Won' AND StageName !='Closed Lost']);

        for (Opportunity vTemp : OpportunityList) {
            total = total + vTemp.Amount;            
        }
        system.debug('valor total das Oportunidades =' + total);

        return total;
    }


    public static void InsertAccount(){
        List<Account> accountList = new List<Account>();

        for (Integer iTemp = 1; iTemp <=10; Itemp++){
            Account AccountObj = new Account();
            AccountObj.Name = 'Conta' +iTemp;
            accountList.add(AccountObj);                    
        }
        insert accountList;  
    }

    public static void InsertAccountD(Integer qtdContas){
        
        List<Account> accountList = new List<Account>();

        for (Integer iTemp = 1; iTemp <= qtdContas; Itemp++){
            Account AccountObj = new Account();
            AccountObj.Name = 'Conta Desafio' +iTemp;
            accountList.add(AccountObj);                    
        }
        insert accountList;  
    }
    
     //MAPS
     public static void demonstraMap(){
        List<Opportunity> opportunityList =  new List<Opportunity>([SELECT Id, Name FROM Opportunity]);
        system.debug('opportunityList '+opportunityList);
        /*
            opportunityList (
                Opportunity:{Id=0068c00000pMREmAAO, Name=Edge Emergency Generator}
                , Opportunity:{Id=0068c00000pMREtAAO, Name=Edge Installation}
                , Opportunity:{Id=0068c00000pMREuAAO, Name=Edge SLA}
                , Opportunity:{Id=0068c00000pMRF8AAO, Name=Edge Emergency Generator}
            )
        */

        for(Opportunity vTemp : opportunityList){
            if(vTemp.Id == '0068c00000pMREeAAO'){

            }
        }

        //Mapas
        Map<Id, Opportunity> opportunityMap = new Map<Id, Opportunity>([SELECT Id, Name FROM Opportunity]);
        system.debug('opportunityMap '+opportunityMap);
        /*
            opportunityMap {
                0068c00000pMREeAAO=Opportunity:{Id=0068c00000pMREeAAO, Name=Dickenson Mobile Generators}
                , 0068c00000pMREfAAO=Opportunity:{Id=0068c00000pMREfAAO, Name=United Oil Office Portable Generators}
                , 0068c00000pMREgAAO=Opportunity:{Id=0068c00000pMREgAAO, Name=Express Logistics Standby Generator}
                , 0068c00000pMREhAAO=Opportunity:{Id=0068c00000pMREhAAO, Name=GenePoint Standby Generator}
                , 0068c00000pMREiAAO=Opportunity:{Id=0068c00000pMREiAAO, Name=Grand Hotels Kitchen Generator}
            }    
        */
        if(opportunityMap.containsKey('0068c00000pMREeZZZ')){
            system.debug('Contem o id');
        }else{
            system.debug('Não contem o id');
        }
    }

    //DESAFIO - Receber um número inteiro no parâmetro, e vão criar as contas conforme este número com o nome 'Conta DESAFIO 1', 'Conta DESAFIO 2'; Caso a conta com o nome exista, não deve ser criado, pois não queremos mais de uma conta com o mesmo nome
    public static void insertAccountsDesafioNomeSemMap(Integer quantidadeContas){
        List<Account> accountList = new List<Account>();

        for(Integer itemp = 1; itemp <= quantidadeContas; itemp++){
            String nameAcoount = 'Conta DESAFIO '+itemp;
            List<Account> accountListCons = new List<Account>([SELECT Id, Name FROM Account WHERE Name = : nameAcoount]);
            if(accountListCons.size() == 0){
                Account accountObj = new Account();
                accountObj.Name = nameAcoount;
                accountList.add(accountObj);
            }
        }
        if(accountList.size() > 0){
            insert accountList;
        }
    }    

    public static void insertAccountsDesafioNomeComMap(Integer quantidadeContas){
        List<Account> accountList = new List<Account>();

        //aqui eu crio e alimento o meu map
        Map<String, Account> accountMap = new Map<String, Account>();
        for(Account vTemp : [SELECT Id, Name FROM Account]){
            accountMap.put(vTemp.Name, vTemp);
        }

        for(Integer itemp = 1; itemp <= quantidadeContas; itemp++){
            String nameAcoount = 'Conta DESAFIO '+itemp;
            //se não tiver no map croa, o "!" é usado para negação
            if(!accountMap.containsKey(nameAcoount)){
                Account accountObj = new Account();
                accountObj.Name = nameAcoount;
                accountList.add(accountObj);
            }
        }
        if(accountList.size() > 0){
            insert accountList;
        }
    }       

}// Fim da Classe


// Debug no SF - Open Execute Anonymous Window
// Classe . metodo
// ClasseDemonstraEstrutura.nomeDoMetodo();