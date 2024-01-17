public with sharing class MovieInteractionDAO {

    public static List<Assistir__c> getMovieInteractionByUserIdOrEmail(String userId, String userEmail){
       return  [ SELECT Id, 
                    Filme__c, 
                    Filme__r.Id,
                    Filme__r.Nome__c, 
                    Filme__r.Descricao__c,
                    Filme__r.Genero__c,
                    Filme__r.LinguaOriginal__c,
                    Filme__r.NotaMedia__c,
                    Filme__r.Popularidade__c,
                    Filme__r.ELancamento__c,
                    Filme__r.DataLancamento__c,
                    Data__c,
                    Account__c
            FROM Assistir__c 
            WHERE Account__c=:userId OR  ( Account__r.Email__c =:userEmail AND Account__r.Email__c != NULL ) ];
    }


    public static List<Assistir__c> getMovieInteractionByUserIdAndMovie(Id userId, Id movieId){
        return  [ SELECT Id, 
                     Filme__c, 
                     Filme__r.Id,
                     Filme__r.Nome__c, 
                     Filme__r.Descricao__c,
                     Filme__r.Genero__c,
                     Filme__r.LinguaOriginal__c,
                     Filme__r.NotaMedia__c,
                     Filme__r.Popularidade__c,
                     Filme__r.ELancamento__c,
                     Filme__r.DataLancamento__c,
                     Data__c,
                     Account__c
             FROM Assistir__c 
             WHERE Account__c=:userId AND Filme__c=:movieId
             ORDER BY Data__c DESC LIMIT 1  ];
     }

}