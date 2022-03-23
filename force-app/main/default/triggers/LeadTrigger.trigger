trigger LeadTrigger on Lead (before insert, after insert, before update, after update) {

    //Temos que incluir ua tarefa e associar ao Lead

    if (Trigger.isInsert && Trigger.isAfter) {
        List<Task> taskList = new List<Task>();
        for (Lead ltemp : Trigger.New) {
            Task taskObj         = new Task();
            taskObj.Subject      = 'Entrar em contato com o Lead';
            taskObj.ActivityDate = System.today();
            taskObj.WhoId        = lTemp.Id;
            insert taskObj;
        }
        if (taskList.size() > 0) {
            insert taskList;
        }
    }  
    

}