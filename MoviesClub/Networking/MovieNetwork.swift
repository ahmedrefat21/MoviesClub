//
//  MovieNetwork.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 25/08/2024.
//

import Foundation

class MovieNetwork {
    static let shared = MovieNetwork()
    
  
    
    func fetchPopularList(completion: @escaping(Result<Movies,CSError>) -> Void) {
        let url = MovieURL.popularListUrl
        GenericNetworkService.getData(from: url, completion: completion)
    }
    
    func fetchTopRatedList(completion:@escaping(Result<Movies,CSError>) -> Void){
        let url = MovieURL.topRatedListUrl
        GenericNetworkService.getData(from: url, completion: completion)
    }
    
    func fetchUpcomingList(completion: @escaping(Result<Movies,CSError>) -> Void) {
        let url = MovieURL.upcomingListUrl
        GenericNetworkService.getData(from: url, completion: completion)
    }
    
    func fetchNowPlayingList(completion: @escaping(Result<Movies,CSError>) -> Void) {
        let url = MovieURL.nowPlayinListUrl
        GenericNetworkService.getData(from: url, completion: completion)
    }
    
    func fetchWithGenreMovies(with genreId: Int,completion:@escaping(Result<Movies,CSError>) -> Void){
        let url = MovieURL.moviesWithGenreUrl(withGenre: "\(genreId)")
        GenericNetworkService.getData(from: url, completion: completion)
    }
    
    func fetchMovieSearch(query:String,completion: @escaping(Result<Movies,CSError>) -> Void){
        let url = MovieURL.movieSearchUrl(withQuery: query)
        GenericNetworkService.getData(from: url, completion: completion)
    }
    
    func fetchMovieDetail(withId movieId: Int,completion: @escaping(Result<MovieDetail,CSError>) -> Void){
        let url = MovieURL.movieDetailUrl(withId: "\(movieId)")
        GenericNetworkService.getData(from: url, completion: completion)
    }
    
    
    func fetchSimilarList(withId movieId: Int,completion: @escaping(Result<Movies,CSError>) -> Void ) {
        let url = MovieURL.similar(withId: "\(movieId)")
        GenericNetworkService.getData(from: url, completion: completion)
    }
    
}
