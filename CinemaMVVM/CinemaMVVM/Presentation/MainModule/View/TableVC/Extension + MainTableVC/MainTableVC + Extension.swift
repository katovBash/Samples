//
//  MainTableVC + Extension.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 14.05.2021.
//

import Foundation
import UIKit

extension MainTableVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.cinemaModelList?.results?.count ?? Int()
    }

    // MARK: Make design for every cell (image, description, name)

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainTableCell.idCell,
            for: indexPath
        ) as? MainTableCell
        else { return UITableViewCell() }

        let cinemaSelected = viewModel?.cinemaModelList?.results?[indexPath.row]
        cell.setCellUI(model: cinemaSelected, photoService: photoService, indexPath: indexPath)
        return cell
    }

    // MARK: Tapped to cell and switch to next view with correct film

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cinemaSelected = viewModel?.cinemaModelList?.results?[indexPath.row] else { return }
        movieIDClosure?(cinemaSelected.id ?? Int())
        viewModel?.coordinator?.startDetail(model: cinemaSelected)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }
}
