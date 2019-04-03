//
//  INFO.swift
//  BOOK
//
//  Created by 安博 on 3/13/19.
//  Copyright © 2019 安博. All rights reserved.
//

import Foundation
import UIKit
class Infobase{
    var Title : String = ""
    var author : String = ""
    var Abstruct : String = ""
    var ima : String = ""
    var genre : String = ""
    var rating : Double
    var Nofpages : Int
    var Readlv : String = ""
    var publisher : String = ""
    var year : Int
    var IBSN : Int
    init(Title : String, author : String, Abstruct: String, ima : String = "11", genre : String, rating : Double, Nofpages : Int, Readlv : String, publisher : String, year : Int, IBSN : Int) {
        self.Title = Title
        self.author = author
        self.Abstruct = Abstruct
        self.ima = ima
        self.genre = genre
        self.rating = rating
        self.Nofpages = Nofpages
        self.publisher = publisher
        self.year = year
        self.IBSN = IBSN
    }
}
