//
//  NetworkService.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getListFilms(_ completion: @escaping (Result<CinemaListModel, ErrorService>) -> Void)
    func getListImageList (movieID: Int,_ completion: @escaping (Result<CinemaListImageModel, ErrorService>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    //First URLSessionRequest for the first page
    func getListFilms(_ completion: @escaping (Result<CinemaListModel, ErrorService>) -> Void) {

        let URLString = InternetDataHelper.movieURLList

        guard let resourceURL = URL(string: URLString) else {return}

        URLSession.shared.dataTask(with: resourceURL) { data, _, error in
            if error != nil {
                completion(.failure(.noDataAvailable))
                return }

            do {
                guard let unwrapData = data else {return}
                let decoder = JSONDecoder()
                let filmInformationResponse = try decoder.decode(CinemaListModel.self, from: unwrapData)
                completion(.success(filmInformationResponse))}

            catch {
                completion(.failure(.noProcessData))
                print(error)
            }
        }.resume()
    }
    
    //Second URLSessionRequest for the second page
    func getListImageList(movieID: Int,_ completion: @escaping (Result<CinemaListImageModel, ErrorService>) -> Void) {
        let URLString = "\(InternetDataHelper.startImageURL)\(movieID)\(InternetDataHelper.endImageURL)"
        guard let resourceURL = URL(string: URLString) else {return}
        
        URLSession.shared.dataTask(with: resourceURL) { data, _, error in
            if error != nil {
                completion(.failure(.noDataAvailable))
                return }
            
            do {
                guard let unwrapData = data else {return}
                let decoder = JSONDecoder()
                let filmInformationResponse = try decoder.decode(CinemaListImageModel.self, from: unwrapData)
                completion(.success(filmInformationResponse))}
            
            catch {
                completion(.failure(.noProcessData))
                print(error)
            }
        }.resume()
    }
}
