//
// Created for Ozinshe in 2023
//

import SwiftyJSON

struct Poster {
    var id: Int = 0
    var link: String = ""
    var fileID: Int = 0
    var movieID: Int = 0

    init() {}

    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.link = json["link"].stringValue
        self.fileID = json["fileID"].intValue
        self.movieID = json["movieID"].intValue
    }
}
