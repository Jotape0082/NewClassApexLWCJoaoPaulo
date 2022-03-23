//DESAFIO : toda vez que criar uma nova conta, com o campo Propriedade = Private, você deve criar uma tarefa para o proprietário da conta, dizendo para verificar os dados cadastrais da mesma.

trigger AccountTrigger on Account (after insert) {

    if (Trigger.isInsert && Trigger.isAfter) {
        List<Task> taskList=new List<Task>();
    
        for(Account acc:trigger.new)
        {    
            if(acc.Ownership =='Private'){
                
                Task taskObj         = new Task();
                taskObj.Subject      = 'Verifique os dados Cadastrais';
                taskObj.ActivityDate = System.today();
                taskObj.whatId       = acc.Id;  
                taskObj.OwnerId      = acc.OwnerId;
                tasklist.add(taskObj);
            }
        }

        if(taskList.size()>0)      
        {
            insert tasklist;
        }
    }

}