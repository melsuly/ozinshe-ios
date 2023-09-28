//
// Created for Ozinshe in 2023
//

import SwiftyJSON

class Movie {
    var id: Int = 0
    var name: String = ""
    var year: Int = 0
    var poster: Poster = Poster()

    init() {}

    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.year = json["year"].intValue
        self.poster = Poster(json["poster"])
    }
}
