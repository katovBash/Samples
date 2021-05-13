//
//  Extension + Alert.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func pushAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alertVC.addAction(alertAction)
        self.present(alertVC, animated: true)
    }
}
