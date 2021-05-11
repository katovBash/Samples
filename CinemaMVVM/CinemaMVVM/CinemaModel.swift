//
//  CinemaModel.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

final class FilmsResponse: Decodable {
    var results: [Results]
}

final class Results: Decodable {
    let title: String?
    let voteAverage: Double?
    let overview: String?
    var posterPath: String?

    init(title: String?, voteAverage: Double?, overview: String?, posterPath: String?) {
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
        self.posterPath = posterPath
    }
}
