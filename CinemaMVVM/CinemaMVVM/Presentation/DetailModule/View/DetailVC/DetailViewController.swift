//
//  DetailViewController.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var titleLabel: UILabel!

    var detailViewModel: DetailViewModel?
    var cinemaModel: CinemaListEntity?
    var photoService: PhotoService?
    private var movieID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(
            DetailCollectionCell.nib(),
            forCellWithReuseIdentifier: DetailCollectionCell.CellID
        )
        navigationItem.hidesBackButton = false

        photoService = PhotoService(container: collectionView)

        setUP()
        detailViewModel?.getCinema(movieID: movieID ?? Int())
        updateData()
    }

    func setUP() {
        guard let model = detailViewModel?.cinemaModel else { return }
        movieID = model.id
        textView.text = model.overview
        titleLabel.text = model.title
    }

    func updateData() {
        detailViewModel?.updateViewData = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}
