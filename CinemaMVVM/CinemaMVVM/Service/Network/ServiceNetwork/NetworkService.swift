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
        let URLString = ServiceData.movieURLList

        guard let resourceURL = URL(string: URLString) else { return }

        URLSession.shared.dataTask(with: resourceURL) { data, _, error in
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
        let URLString = "\(ServiceData.startImageURL)\(movieID)\(ServiceData.endImageURL)"
        guard let resourceURL = URL(string: URLString) else { return }

        URLSession.shared.dataTask(with: resourceURL) { data, _, error in
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
