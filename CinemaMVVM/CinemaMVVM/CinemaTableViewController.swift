//
//  CinemaTableViewController.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

final class CinemaTableViewController: UITableViewController {
    private var listFilms: [Results] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Top \(self.listFilms.count) films"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let filmRequest = CinemaRequest(nameOfFilm: "")
        filmRequest.getFilms { [weak self] result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(films):
                self?.listFilms = films
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listFilms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CinemaTableViewCell {
            let film = listFilms[indexPath.row]
            cell.setUI(model: film)
            cell.selectionStyle = .none
            return cell
        }; return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        240
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTrail = listFilms[indexPath.row]

        if let viewController = storyboard?.instantiateViewController(identifier: "lastVC") as? ViewController {
            viewController.nameFilmLast = selectedTrail.title
            viewController.descriptionLast = selectedTrail.overview
            navigationController?.pushViewController(viewController, animated: true)

            DispatchQueue.global().async {
                guard let unwrappedPosterPath = selectedTrail.posterPath else { return }
                guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(unwrappedPosterPath)")
                else { return }
                DispatchQueue.main.async {
                    guard let imageData = try? Data(contentsOf: imageURL) else { return }
                    viewController.imageFilmLabel.image = UIImage(data: imageData)
                }
            }
        }
    }
}
