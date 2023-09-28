//
// Created for Ozinshe in 2023
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class FavoritesTableViewController: UITableViewController {

    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavorites()
    }

    func loadFavorites() {
        SVProgressHUD.show()

        let headers: HTTPHeaders = [
            .authorization(bearerToken: Storage.shared.accessToken)
        ]

        AF.request("http://api.ozinshe.com/core/V1/favorite/", method: .get, headers: headers).responseData { result in
            SVProgressHUD.dismiss()

            if  let data = result.data,
                result.response?.statusCode == 200 {
                let json = JSON(data)
                let jsonMovies = json.arrayValue
                var movies: [Movie] = []

                for jsonMovie in jsonMovies {
                    movies.append(Movie(jsonMovie))
                }

                self.movies = movies
                self.tableView.reloadData()
            } else {
                SVProgressHUD.showError(withStatus: String(data: result.data ?? Data(), encoding: .utf8))
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell

        cell.setData(movies[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
