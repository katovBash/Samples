//
//  CinemaImageModel.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

final class CinemaImageEntity: Decodable {
    var backdrops: [CinemaListImageEntity]
    var id: Int?
}

final class CinemaListImageEntity: Decodable {
    var filePath: String?
}

extension CinemaListImageEntity {
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
}
