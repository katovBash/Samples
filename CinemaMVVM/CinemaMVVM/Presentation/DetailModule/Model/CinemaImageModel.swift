//
//  CinemaImageModel.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

final class CinemaListImageModel: Decodable {
    var backdrops: [CinemaImageModel]
    var id: Int?
}

final class CinemaImageModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }

    var filePath: String?
}
