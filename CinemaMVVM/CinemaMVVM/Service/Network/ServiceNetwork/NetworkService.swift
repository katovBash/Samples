//
//  NetworkService.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getListFilms(_ completion: @escaping (Result<CinemaEntity, ErrorService>) -> Void)
    func getListImageList(movieID: Int, _ completion: @escaping (Result<CinemaImageEntity, ErrorService>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    // First URLSessionRequest for the first page
    func getListFilms(_ completion: @escaping (Result<CinemaEntity, ErrorService>) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/movie/popular"
        let queryItemAPIKey = URLQueryItem(name: "api_key", value: "4f23e57050ee96edaca62644d3f1efff")
        let queryItemLanguage = URLQueryItem(name: "language", value: "ru")
        let queryItemPage = URLQueryItem(name: "page", value: "1")
        urlComponents.queryItems = [queryItemAPIKey, queryItemLanguage, queryItemPage]

        guard let url = urlComponents.url else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(.noDataAvailable))
                return
            }

            do {
                guard let unwrapData = data else { return }
                let decoder = JSONDecoder()
                let filmInformationResponse = try decoder.decode(CinemaEntity.self, from: unwrapData)
                completion(.success(filmInformationResponse))
            } catch {
                completion(.failure(.noProcessData))
                print(error)
            }
        }.resume()
    }

    // Second URLSessionRequest for the second page
    func getListImageList(movieID: Int, _ completion: @escaping (Result<CinemaImageEntity, ErrorService>) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/movie/\(movieID)/images"
        let queryItemAPIKey = URLQueryItem(name: "api_key", value: "aca367d31340b3ecdf8975e6a8071834")
        urlComponents.queryItems = [queryItemAPIKey]

        guard let url = urlComponents.url else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(.noDataAvailable))
                return
            }

            do {
                guard let unwrapData = data else { return }
                let decoder = JSONDecoder()
                let filmInformationResponse = try decoder.decode(CinemaImageEntity.self, from: unwrapData)
                completion(.success(filmInformationResponse))
            } catch {
                completion(.failure(.noProcessData))
                print(error)
            }
        }.resume()
    }
}
