//
//  DetailCollectionViewCell.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//


import UIKit

protocol ConfigureDetailCellProtocol {
    func setCellUI(model: CinemaImageModel?, photoService: PhotoService?, indexPath: IndexPath)
}

final class DetailCollectionCell: UICollectionViewCell {
    
    static let CellID = "DetailCollectionCell"

    @IBOutlet private weak var cinemaImageView: UIImageView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.startAnimating()
    }
  
    static func nib() -> UINib {
        UINib(nibName: CellID, bundle: nil)
    }
}

extension DetailCollectionCell: ConfigureDetailCellProtocol {
    func setCellUI(model: CinemaImageModel?, photoService: PhotoService?, indexPath: IndexPath) {
        
        guard let unwrappedPosterPath = model?.filePath else { return }
        let imageString = "\(InternetDataHelper.BeginningImageURL)\(unwrappedPosterPath)"
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidesWhenStopped = true
        }
        
        self.cinemaImageView.image = photoService?.savePhotoToFileManager(at: indexPath, by: imageString)
    }
}

