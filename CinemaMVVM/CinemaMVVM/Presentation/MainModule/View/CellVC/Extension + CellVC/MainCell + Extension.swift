//
//  MainCell + Extension.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 14.05.2021.
//

import Foundation
import UIKit

extension MainTableCell: ConfigureCellProtocol {
    func setCellUI(model: CinemaListEntity?, photoService: PhotoService?, indexPath: IndexPath) {
        cinemaNameLabel.text = model?.title
        descriptionCinemaLabel.text = model?.overview
        cinemaRatingLabel.text = "\(model?.voteAverage ?? Double())"

        guard let unwrappedPosterPath = model?.posterPath else { return }
        let imageString = "\(ServiceData.beginURL)\(unwrappedPosterPath)"
        cinemaImageView.image = photoService?.savePhotoAsync(at: indexPath, by: imageString)
    }
}
