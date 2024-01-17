@RestResource(urlMapping='/getMovieInteraction/*')
global with sharing class MoviesIntegrationIN {
    @HttpGet
    global static  void getMovies() {
            String userId = RestContext.request.params.get('userId');
            String userEmail = RestContext.request.params.get('userEmail');
        
            List<Assistir__c> interactions = MovieInteractionDAO.getMovieInteractionByUserIdOrEmail(userId, userEmail);
        if(interactions.size() > 0){
            List<MovieDataWrapper> movies = new List<MovieDataWrapper>();
            for(Assistir__c interaction:interactions){
                MovieDataWrapper movieData = new MovieDataWrapper();
                movieData.id = interaction.Filme__r.Id;
                movieData.name = interaction.Filme__r.Nome__c;
                movieData.description = interaction.Filme__r.Descricao__c;
                movieData.gender = interaction.Filme__r.Genero__c;
                movieData.originalLanguage = interaction.Filme__r.LinguaOriginal__c;
                movieData.averageVotes = interaction.Filme__r.NotaMedia__c;
                movieData.popularity = interaction.Filme__r.Popularidade__c;
                movieData.isRelease = interaction.Filme__r.ELancamento__c;
                movieData.releaseDate = interaction.Filme__r.DataLancamento__c;
                movies.add(movieData);
            }
            RestContext.response.addHeader('Content-Type', 'application/json');
            RestContext.response.responseBody = Blob.valueOf(JSON.serialize(movies));       
        }else{
                    
            ErrorWrapper err = getError('NOT_FOUND', 'Nenhum filme encontrado para este usuário.Certifique se o usuário é válido');
            RestContext.response.addHeader('Content-Type', 'application/json');
            RestContext.response.responseBody = Blob.valueOf(JSON.serialize(err));
        }
        
    }


    public  static ErrorWrapper getError(String errorCode, String errorMessage){
        ErrorWrapper err = new ErrorWrapper();
        err.errorCode  = errorCode;
        err.errorMessage = errorMessage;
        return err;
    }

    public class ErrorWrapper{
        public String errorCode {get;set;}
        public String errorMessage {get;set;}
    }


    public class MovieDataWrapper{
        public String  id {get;set;}
        public String name {get;set;}
        public String description {get;set;}
        public String gender {get;set;}
        public String originalLanguage {get;set;}
        public Decimal averageVotes {get;set;}
        public Decimal popularity {get;set;}
        public Boolean isRelease {get;set;}
        public Date releaseDate {get;set;}
    }
}