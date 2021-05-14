//
//  CinemaModel.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//
import Foundation

final class CinemaListModel: Decodable {
    var results: [CinemaModel]?
}

final class CinemaModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case id
        case overview
    }

    var posterPath: String?
    var title: String?
    var overview: String?
    var voteAverage: Double?
    var id: Int?

    init(
        posterPath: String,
        originalTitle: String,
        overview: String,
        voteAverage: Double
    ) {
        self.posterPath = posterPath
        title = originalTitle
        self.overview = overview
        self.voteAverage = voteAverage
    }
}
