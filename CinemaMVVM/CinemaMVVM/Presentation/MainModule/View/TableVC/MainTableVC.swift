//
//  MainTableTableViewController.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

final class MainTableVC: UITableViewController {
    var viewModel: MainViewModelProtocol?
    var photoService: PhotoService?
    var movieIDClosure: ((Int) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        photoService = PhotoService(container: tableView)

        navigationItem.title = "MVVMCinema"
        navigationItem.hidesBackButton = false
        navigationItem.backButtonTitle = "Back"
        tableView.register(MainTableCell.nib(), forCellReuseIdentifier: MainTableCell.idCell)

        viewModel?.getCinema()
        updateView()
    }

    private func updateView() {
        viewModel?.updateViewData = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
