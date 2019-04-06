//
//  genreinfo.swift
//  cmpe131book
//
//  Created by 安博 on 4/5/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import Foundation
class genreinfo{
    var GenreINFO : [genre] = []
    init() {
        GenreINFO.append(genre.init(genre: "Fiction"))
        GenreINFO.append(genre.init(genre: "Art"))
        GenreINFO.append(genre.init(genre: "Music"))
        GenreINFO.append(genre.init(genre: "Thriller"))
        GenreINFO.append(genre.init(genre: "Business"))
        GenreINFO.append(genre.init(genre: "Finance"))
        GenreINFO.append(genre.init(genre: "Computer"))
        GenreINFO.append(genre.init(genre: "Non-Fiction"))
        GenreINFO.append(genre.init(genre: "Tale"))
    }
}
