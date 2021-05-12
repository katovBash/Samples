//
//  InternetDataHelper.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

final class InternetDataHelper {
   static var movieURLList = "https://api.themoviedb.org/3/discover/movie?api_key=4f23e57050ee96edaca62644d3f1efff&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
    
    static var BeginningImageURL =
        "https://image.tmdb.org/t/p/w500"
    
    static var imageURLList = "https://api.themoviedb.org/3/movie/399566/images?api_key=4f23e57050ee96edaca62644d3f1efff"
    
    static var startImageURL =
        "https://api.themoviedb.org/3/movie/"
    
    static var endImageURL =
        "/images?api_key=4f23e57050ee96edaca62644d3f1efff"
    
    static var titleAlert = "Please connect your device to internet"
    static var messageAlert = "I cant work without it"
}
