//
//  DetailCell + Extension.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 14.05.2021.
//

import Foundation
import UIKit

extension DetailCollectionCell: ConfigureDetailCellProtocol {
    func setCellUI(model: CinemaImageModel?, photoService: PhotoService?, indexPath: IndexPath) {
        guard let unwrappedPosterPath = model?.filePath else { return }
        let imageString = "\(InternetDataHelper.BeginningImageURL)\(unwrappedPosterPath)"
        cinemaImageView.image = photoService?.savePhotoToFileManager(at: indexPath, by: imageString)
    }
}
