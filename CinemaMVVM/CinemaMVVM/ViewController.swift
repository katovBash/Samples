//
//  ViewController.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

// MARK: Easy view controller just need for transfer data

final class ViewController: UIViewController {
    @IBOutlet var nameFilmLabel: UILabel!
    @IBOutlet var descriptionFilmLabel: UILabel!
    @IBOutlet var imageFilmLabel: UIImageView!

    var nameFilmLast: String?
    var descriptionLast: String?
//    var imageLast: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameFilmLabel.text = nameFilmLast
        descriptionFilmLabel.text = descriptionLast
//        imageFilmLabel.image = imageLast
    }
}

