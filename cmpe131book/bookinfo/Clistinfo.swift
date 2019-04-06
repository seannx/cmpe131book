//
//  Bookinfo.swift
//  BOOK
//
//  Created by 安博 on 3/13/19.
//  Copyright © 2019 安博. All rights reserved.
//

import Foundation
import UIKit
class Clistinfo{
    var CINFO : [Clist] = []
    init() {
        CINFO.append(Clist.init(title: "Where the Crawdads Sing", ima: "", author: "Delia Owens", genre: "Fiction", publisher: "Random House Large Print", year: 2018, isbn: 1984827618, rating: 4.8, numOfPages: 496, readLevel: "Grade 4-7"))
        
        CINFO.append(Clist.init(title: "The Silent Patient", ima: "", author: "Alex Michaelides", genre: "Thriller", publisher: "Celadon Books", year: 2019, isbn: 1250301696, rating: 4.3, numOfPages: 297, readLevel: "Grade 4-7"))
        
        CINFO.append(Clist.init(title: "The Road Beyond Ruin", ima: "", author: "Gemma Liviero", genre: "History Fiction", publisher: "Lake Union Publishing", year: 2019, isbn: 1503901017, rating: 4.3, numOfPages: 443, readLevel: "Grade 4-7"))
        
        CINFO.append(Clist.init(title: "Beyond the Great River", ima: "", author: "Zoe Saadia", genre: "Fiction", publisher: "Amazon Digital Services LLC", year: 2014, isbn: 0, rating: 4.2, numOfPages: 335, readLevel: "Grade 4-7"))
        
    }
}
