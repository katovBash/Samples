//
//  DetailCollectionViewCell.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

protocol ConfigureDetailCellProtocol {
    func setCellUI(model: CinemaListImageEntity?, photoService: PhotoService?, indexPath: IndexPath)
}

final class DetailCollectionCell: UICollectionViewCell {
    static let CellID = "DetailCollectionCell"

    @IBOutlet var cinemaImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func nib() -> UINib {
        UINib(nibName: CellID, bundle: nil)
    }
}
