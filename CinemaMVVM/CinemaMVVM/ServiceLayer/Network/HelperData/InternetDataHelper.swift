//
//  InternetDataHelper.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

final class InternetDataHelper {
    static var https = "https://"
    static var apiKey = "api_key=4f23e57050ee96edaca62644d3f1efff"
    static var BeginningImageURL = "\(https)image.tmdb.org/t/p/w500"
    static var startImageURL = "\(https)api.themoviedb.org/3/movie/"
    static var endImageURL = "/images?\(apiKey)"
    static var imageURLList = "\(startImageURL)399566/images?\(apiKey)"

    static var movieURLList =
        "\(https)api.themoviedb.org/3/discover/movie?\(apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
}
