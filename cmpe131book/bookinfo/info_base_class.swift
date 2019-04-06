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
    var title: String
    var ima: String
    var author: String
    var genre: String
    var publisher: String
    var year: Int
    var isbn: Int
    var rating: Double
    var numOfPages: Int
    var readLevel: String
    init(title: String, ima: String, author: String, genre: String, publisher: String, year: Int, isbn: Int, rating: Double, numOfPages: Int, readLevel: String) {
        self.title = title
        self.ima = ima
        self.author = author
        self.genre = genre
        self.rating = rating
        self.numOfPages = numOfPages
        self.publisher = publisher
        self.readLevel = readLevel
        self.year = year
        self.isbn = isbn
        self.readLevel = readLevel
    }
}
