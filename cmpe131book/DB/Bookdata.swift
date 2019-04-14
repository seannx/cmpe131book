//
//  Bookdata.swift
//  cmpe131book
//
//  Created by 安博 on 4/6/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import Foundation
import CoreData
class Bookdata{
    var author = [String]()
      var genre = [String]()
//      var isbn: Int16
//      var numofpages: Int16
      var publisher = [String]()
//      var rating: Double
//      var readinglevel = ""
        var title = [String]()
//      var year: Int16
        var count = 0
        private let authors = ["Delia Owens", "Alex Michaelides", "Gemma Liviero","Zoe Saadia"]
        private let genres = ["Fiction", "Thriller", "Fiction", "Art"]
//        private let isbns = [1984827618, 1250301696,1503901017,0]
//        private let numberofpagess = [496, 297, 443, 335]
        private let publishers = ["Random House Large Print","Celadon Books","Lake Union Publishing","Amazon Digital Services LLC"]
//        private let ratings = [4.8, 4.3, 4.3, 4.2]
//        private let readinglevels = ["Grade 4-7","Grade 4-7","Grade 4-7","Grade 4-7"]
        private let titles = ["Where the Crawdads Sing","The Silent Patient","The Road Beyond Ruin","Beyond the Great River"]
//        private let years = [2018,2019,2019,2014]
    init() {
        
        author = authors
        genre = genres
        publisher = publishers
//        readinglevel = readinglevels[index]
        title = titles
        count = authors.count
    }
}

