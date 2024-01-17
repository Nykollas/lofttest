@isTest
private class MoviesIntegrationINTest {
    
    @isTest
    static void testGetMoviesWithInteractions() {

        Account testUser = new Account(
            Name = 'Test',
            Email__c = 'testuser@example.com'
            
        );
        insert testUser;

        Filme__c testMovie = new Filme__c(
            Nome__c = 'Test Movie',
            Descricao__c = 'Description of the movie',
            Genero__c = 'Action',
            LinguaOriginal__c = 'English',
            NotaMedia__c = 8.5,
            Popularidade__c = 90,
            DataLancamento__c = System.today()
            
        );
        insert testMovie;

        Assistir__c testInteraction = new Assistir__c(
            Account__c = testUser.Id,
            Filme__c = testMovie.Id
            
        );
        insert testInteraction;

        RestRequest req = new RestRequest();
        req.params.put('userId', testUser.Id);
        req.params.put('userEmail', testUser.Email__c);
        RestContext.request = req;

        MoviesIntegrationIN.getMovies();

    }

   
}
