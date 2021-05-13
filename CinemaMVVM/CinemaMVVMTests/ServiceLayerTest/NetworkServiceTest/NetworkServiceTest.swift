//
//  NetworkServiceTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

import XCTest
@testable import CinemaMVVM

class NetworkServiceTest: XCTestCase {

    var cinemaModelList = CinemaListModel()
    var coreDataProvider = CoreDataProvider()
    var networkServiceTest: NetworkServiceProtocol?
    var updateViewData: (() -> ())?
    var cinemaModel: CinemaListImageModel?
    
    func testNetworkServiceGetFilms()  {
                
        networkServiceTest?.getListFilms { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case let .success(films):
                    self.cinemaModelList = films
                    guard let filmsArray = films.results else {return}
                    self.coreDataProvider.saveData(movie: filmsArray)
                    self.updateViewData?()
                case let .failure(error):
                    print(error)
                }
            }
        }
        
        XCTAssert(cinemaModelList.results == nil)
    }
    
    func testNetworkServiceGetImage()  {
        networkServiceTest?.getListImageList(movieID: 1) { [weak self] result in
            guard let self = self  else {return}
            DispatchQueue.main.async {
                switch result {
                case let .success(films):
                    self.cinemaModel = films
                    self.updateViewData?()
                case let .failure(error):
                    print(error)
                }
            }
        }
        XCTAssert(cinemaModel?.backdrops == nil)
    }
}
    
    

