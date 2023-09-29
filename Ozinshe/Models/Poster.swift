//
// Created for Ozinshe in 2023
//

import SwiftyJSON

struct Poster {
    var link: String = ""
    
    init() {}
    
    init(_ json: JSON) {
        self.link = json["link"].stringValue
    }
}
