//
//  CinemaRequest.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

let filmSuccess: [Results] = []
/// Adding enum for errors
enum FilmError: Error {
    case noDataAvailible
    case noProcessData
    case noValidError
}

/// Adding struct for requset inf rom data
struct CinemaRequest {
    let resourceURL: String
    init(nameOfFilm: String) {
        let resourceString =
            "https://api.themoviedb.org/3/discover/movie?api_key=4f23e57050ee96edaca62644d3f1efff&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"

        resourceURL = resourceString
    }

    func getFilms(completion: @escaping (Result<[Results], FilmError>) -> Void) {
        guard let resourceURL = URL(string: resourceURL) else {
            completion(.failure(.noValidError))
            return
        }

        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailible))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let filmInformationResponse = try decoder.decode(FilmsResponse.self, from: jsonData)
                completion(.success(filmInformationResponse.results))
            } catch {
                completion(.failure(.noProcessData))
                print(error)
            }
        }
        dataTask.resume()
    }
}

