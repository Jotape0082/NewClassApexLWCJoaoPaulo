@RestResource(urlMapping = '/AulaDeApex/Leads/*')

global with sharing class LeadApi {
    
    @HttpGet
    global static void getLead(){

        RestResponse resultRest = RestContext.response;

        String asParamStr = RestContext.request.requestURI.substring(RestContext.request.requestURI.lastIndexOf('/')+1);

        String sobrenome = String.isNotBlank(asParamStr) ? RestContext.request.params.get('sobrenome'):'';

        List<Lead> leadList = new List<Lead>();
        if (String.isNotBlank(sobrenome)) {
            leadList = [SELECT Id, LastName FROM Lead WHERE LastName =:sobrenome];
        }else {
            leadList = [SELECT Id, LastName FROM Lead];
        }

        //List<Lead> leadList = new List<Lead> ([SELECT Id, LastName FROM Lead]);

        resultRest.responseBody = Blob.valueOf(JSON.serializePretty(leadList));
        resultRest.StatusCode = 200;
    }

    @HttpPost
    global static void inserUpdateLead(List <LeadApiWrapper> leadList){

        List<Lead> leadsInsertList = new List<Lead>();

        for (LeadApiWrapper cTemp : LeadApiWrapper){

            Lead leadObj = new Lead(LastName = cTemp.sobrenome
                                    ,Company = cTemp.nome_empresa
                                    ,Status = cTemp.status_do_lead
                                    ,Email = cTemp.email);

            leadsInsertList.add(leadObj);
        }

       /* if (leadsInsertList.size()>0) {
            inseert leadsInsertList;
        }*/

        RestResponse RestRest = RestContext.response;
        List<Lead> idsleadslist = new List<String>();

        if (leadsInsertList.size()>0){

            Database.UpsertResult[] results = Database.upsert(leadsInsertList);

            for (Integer index = 0; index < results.size(); index++){

                if (results[index].isSuccess()){
                    Id idDFo = results[index].Id;
                    idsleadslist.add(idDFo);
                    
                }else {
                    idsleadslist.add('Erro');
                }
                
            }
            
        }

        resultRest.responseBody = Blob.valueOf(JSON.serializePretty(leadList));
        resultRest.StatusCode = 200;
        
    }

}
