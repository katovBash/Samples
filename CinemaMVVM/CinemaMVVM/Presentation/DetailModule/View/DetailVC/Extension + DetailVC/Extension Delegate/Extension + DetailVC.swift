//
//  Extension + DetailVC.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 14.05.2021.
//

import Foundation
import UIKit

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        detailViewModel?.cinemaModelList?.backdrops.count ?? Int()
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DetailCollectionCell.CellID,
            for: indexPath
        ) as? DetailCollectionCell
        else { return UICollectionViewCell() }

        cell.setCellUI(
            model: detailViewModel?.cinemaModelList?.backdrops[indexPath.row],
            photoService: photoService,
            indexPath: indexPath
        )
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        0
    }
}
