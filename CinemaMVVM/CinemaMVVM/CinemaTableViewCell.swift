//
//  CinemaTableViewCell.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

// MARK: Here u can see some UI + func that control information from json decoder to my view

final class CinemaTableViewCell: UITableViewCell {
    @IBOutlet var cinemaImage: UIImageView!
    @IBOutlet var cinemaName: UILabel!
    @IBOutlet var descriptionCinema: UILabel!
    @IBOutlet var cinemaRaiting: UILabel!

    private var cinemaPhoto: UIImage?
    private var cinemaNickName: String?
    private var cinemaDescription: String?
    private var cinemaVoiting: String?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // property for cache some information
    private var bigDickCache: [String: Data] = [:]

    // this main func
    func setUI(model: Results) {
        // add basic information
        cinemaName.text = model.title
        descriptionCinema.text = model.overview
        cinemaRaiting.text = "\(model.voteAverage ?? Double())"

        guard let unwrappedPosterPath = model.posterPath else { return }
        cinemaImage.image = nil
        if bigDickCache[model.posterPath ?? String()] != nil {
            cinemaImage.image = UIImage(data: bigDickCache[model.posterPath ?? String()] ?? Data())
        } else {
            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(unwrappedPosterPath)")
            else { return }
            DispatchQueue.global().async { [self] in

                guard let imageData = try? Data(contentsOf: imageURL) else { return }
                DispatchQueue.main.async {
                    self.bigDickCache[model.posterPath ?? String()] = imageData
                    self.cinemaImage.image = UIImage(data: imageData)
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
