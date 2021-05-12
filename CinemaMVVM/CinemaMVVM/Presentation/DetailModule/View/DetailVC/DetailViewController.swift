//
//  DetailViewController.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textView: UITextView!
    
    var detailViewModel = DetailViewModel()
    var coordinator: CoordinatorProtocol?
    
    var cinemaModel: CinemaModel?
    private var photoService: PhotoService?
    private var movieID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(DetailCollectionCell.nib(),
                                forCellWithReuseIdentifier: DetailCollectionCell.CellID)
        
        photoService = PhotoService(container: collectionView)
        detailViewModel = DetailViewModel()
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
//        navigationItem.backBarButtonItem?.title = ""
        
        setUP()
        detailViewModel.getCinema(movieID: movieID ?? Int())
        updateData()
    }
    
    func setUP() {
        guard let model = cinemaModel else {return}
        movieID = model.id
        textView.text = model.overview
        title = model.title
    }
    
    func updateData() {
        detailViewModel.updateViewData = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return detailViewModel.cinemaModel?.backdrops.count ?? Int()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionCell.CellID,
                                                            for: indexPath) as? DetailCollectionCell
        else {return UICollectionViewCell()}
        
        cell.setCellUI(model: detailViewModel.cinemaModel?.backdrops[indexPath.row],
                       photoService: photoService,
                       indexPath: indexPath)
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

