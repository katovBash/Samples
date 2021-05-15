//
//  MainTableViewCell.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

protocol ConfigureCellProtocol {
    func setCellUI(model: CinemaListEntity?, photoService: PhotoService?, indexPath: IndexPath)
}

final class MainTableCell: UITableViewCell {
    static let idCell = "MainTableCell"

    @IBOutlet var cinemaImageView: UIImageView!
    @IBOutlet var cinemaNameLabel: UILabel!
    @IBOutlet var descriptionCinemaLabel: UILabel!
    @IBOutlet var cinemaRatingLabel: UILabel!
    private var photoService: PhotoService?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func nib() -> UINib {
        let nibLocal = UINib(nibName: idCell, bundle: nil)
        return nibLocal
    }
}
