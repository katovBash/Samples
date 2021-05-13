//
//  MainTableTableViewController.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

final class MainTableVC: UITableViewController {
    
    var coordinator: CoordinatorProtocol?
    var viewModel: MainViewModelProtocol?
    private var photoService: PhotoService?
    var movieIDClosure: ((Int) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoService = PhotoService(container: tableView)
        viewModel = MainViewModel()
        
        navigationItem.title = "MVVMCinema"
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cinemaModelList?.results?.count ?? Int()
    }
    
    //MARK: Make design for every cell (image, description, name)
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableCell.idCell,
                                                       for: indexPath) as? MainTableCell
        else { return UITableViewCell() }
        
        let cinemaSelected = viewModel?.cinemaModelList?.results?[indexPath.row]
        cell.setCellUI(model: cinemaSelected, photoService: photoService, indexPath: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    //MARK: Tapped to cell and switch to next view with correct film
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cinemaSelected = viewModel?.cinemaModelList?.results?[indexPath.row]  else {return}
        movieIDClosure?(cinemaSelected.id ?? Int())
        coordinator?.startDetail(model: cinemaSelected)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}


