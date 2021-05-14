//
//  MainModuleTest.swift
//  CinemaMVVMTests
//
//  Created by Nick Bashkatov on 13.05.2021.
//

@testable import CinemaMVVM
import XCTest

final class MainModuleTest: XCTestCase {
    private var viewModelProtocol: MainViewModelProtocol!
    private var networkService: NetworkServiceProtocol!
    private var coordinator: Coordinator!
    private var viewModel: MainViewModel!

    func testMainViewModel() {
        let navigationController = UINavigationController()
        let assemblyBuilder = AssemblyBuilder()
        coordinator = Coordinator(navigationController: navigationController, assemblyBuilder: assemblyBuilder)

        networkService = NetworkService()
        viewModel = MainViewModel(netWorkService: networkService, coordinator: coordinator)
        viewModelProtocol?.getCinema()
        XCTAssert(viewModelProtocol?.getCinema() == nil)
    }
}
