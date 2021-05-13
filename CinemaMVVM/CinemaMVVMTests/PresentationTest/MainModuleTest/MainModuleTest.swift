//
//  MainModuleTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

import XCTest
@testable import CinemaMVVM

class MainModuleTest: XCTestCase {

    var viewModelProtocol: MainViewModelProtocol?
    var viewModel = MainViewModel()
    
    func testMainViewModel() {
        viewModelProtocol?.getCinema()
        XCTAssert(viewModelProtocol?.getCinema() == nil)
    }
}