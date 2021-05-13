//
//  MainTableViewCell.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

protocol ConfigureCellProtocol {
    func setCellUI(model: CinemaModel?, photoService: PhotoService?, indexPath: IndexPath)
}

final class MainTableCell: UITableViewCell {
    static let idCell = "MainTableCell"

    @IBOutlet private var cinemaImageView: UIImageView!
    @IBOutlet var cinemaNameLabel: UILabel!
    @IBOutlet private var descriptionCinemaLabel: UILabel!
    @IBOutlet private var cinemaRaitingLabel: UILabel!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!

    private var photoService: PhotoService?

    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicatorView.startAnimating()
    }

    static func nib() -> UINib {
        let inibLocal = UINib(nibName: idCell, bundle: nil)
        return inibLocal
    }
}

extension MainTableCell: ConfigureCellProtocol {
    func setCellUI(model: CinemaModel?, photoService: PhotoService?, indexPath: IndexPath) {
        cinemaNameLabel.text = model?.title
        descriptionCinemaLabel.text = model?.overview
        cinemaRaitingLabel.text = "\(model?.voteAverage ?? Double())"

        guard let unwrappedPosterPath = model?.posterPath else { return }
        let imageString = "\(InternetDataHelper.BeginningImageURL)\(unwrappedPosterPath)"

        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.hidesWhenStopped = true
        }
        cinemaImageView.image = photoService?.savePhotoToFileManager(at: indexPath, by: imageString)
    }
}
