trigger AssistirTrigger on Assistir__c (before insert) {
    
    for(Assistir__c movieInteraction:Trigger.new){
        List<Assistir__c> interactions = MovieInteractionDAO.getMovieInteractionByUserIdAndMovie(movieInteraction.Account__c, movieInteraction.Filme__c);
        if(interactions.size() > 0){
            
            Decimal diff = AssistirService.getHourlyTimeDifference(movieInteraction.Data__c, interactions.get(0).Data__c );
            if(diff < 5){
                movieInteraction.addError('Filme já foi assistido pela mesma pessoa  a menos de 5 horas atrás.');
            }
        }
    }




}