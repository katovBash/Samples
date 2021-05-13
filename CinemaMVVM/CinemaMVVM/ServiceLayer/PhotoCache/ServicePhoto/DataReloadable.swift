//
//  DataReloadable.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation
import UIKit

protocol DataReloadable {
    func reloadRow(at indexPath: IndexPath)
}

extension UICollectionView: DataReloadable {
    func reloadRow(at indexPath: IndexPath) {
        reloadItems(at: [indexPath])
    }
}

extension UITableView: DataReloadable {
    func reloadRow(at indexPath: IndexPath) {
        reloadRows(at: [indexPath], with: .automatic)
    }
}
