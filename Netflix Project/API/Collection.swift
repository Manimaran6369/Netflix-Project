//
//  Collection.swift
//  Netflix Project
//
//  Created by Manimaran on 2/17/23.
//class ApiUrls {
//static const kBaseUrl = "https://api.themoviedb.org/3";
//static const kimageBaseUrl = "https://image.tmdb.org/t/p/w500";
//static const trendingMovieUrl = "$kBaseUrl/trending/all/day?api_key=$API_KEY";
//static const topRatedMoiveUrl =
//    "$kBaseUrl/movie/top_rated?api_key=$API_KEY&language=en-US";
//static const tvShowUrl =
//    "$kBaseUrl/tv/popular?api_key=$API_KEY&language=en-US&page=1";
//static const popularMovieUrl =
//    "$kBaseUrl/movie/popular?api_key=$API_KEY&language=en-US";
//}



import Foundation


class URLCollection: NSObject{
    static let shareurl = URLCollection()
    
    let baseurl =  "https://api.themoviedb.org/3"
    let Endapi = "?api_key=c77c9cdbbe2bfe7557cecde020f92321"
    let kimageBaseUrl = "https://image.tmdb.org/t/p/w500";
    
    let Tailtrendingmovie = "/trending/all/day"
    let Tailtoprateurl = "/movie/top_rated"
    let Tailtvshowurl = "/tv/popular"
    let Tailpopularurl = "/movie/popular"
    
}
//https://api.themoviedb.org/3/movie/100088?api_key=c77c9cdbbe2bfe7557cecde020f92321

//529892

