//
//  MainModuleTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

@testable import CinemaMVVM
import XCTest

final class MainModuleTest: XCTestCase {
    private var viewModelProtocol: MainViewModelProtocol?
    private var viewModel = MainViewModel()

    func testMainViewModel() {
        viewModelProtocol?.getCinema()
        XCTAssert(viewModelProtocol?.getCinema() == nil)
    }
}
