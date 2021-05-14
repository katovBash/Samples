//
//  MainCell + Extension.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 14.05.2021.
//

import Foundation
import UIKit

extension MainTableCell: ConfigureCellProtocol {
    func setCellUI(model: CinemaModel?, photoService: PhotoService?, indexPath: IndexPath) {
        cinemaNameLabel.text = model?.title
        descriptionCinemaLabel.text = model?.overview
        cinemaRaitingLabel.text = "\(model?.voteAverage ?? Double())"

        guard let unwrappedPosterPath = model?.posterPath else { return }
        let imageString = "\(InternetDataHelper.BeginningImageURL)\(unwrappedPosterPath)"
        cinemaImageView.image = photoService?.savePhotoAssync(at: indexPath, by: imageString)
    }
}