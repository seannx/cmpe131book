//
//  Bookinfo.swift
//  BOOK
//
//  Created by 安博 on 3/13/19.
//  Copyright © 2019 安博. All rights reserved.
//

import Foundation
import UIKit
class Bookinfo{
    var Book : [Infobase] = []
    init() {
        Book.append(Infobase.init(Title: "Where the Crawdads Sing", author: "Delia Owens", Abstruct: "#1 New York Times Bestseller", genre: "Fiction", rating: 4.8, Nofpages: 496, Readlv: "", publisher: "Random House Large Print; Large Print edition(August 14, 2018)", year: 2018, IBSN: 1984827618))
        Book.append(Infobase.init(Title: "The Silent Patient", author: "Alex Michaelides", Abstruct: "An unforgettable--and Hollywood-bound--new threiller... A mix ofHitchcokian suspense, Agatha Christie plotting, and Greek tragedy", genre: "Thriller", rating: 4.3, Nofpages: 297, Readlv: "", publisher: "Celadon Books(February 5, 2019)", year: 2019, IBSN: 1250301696))
        Book.append(Infobase.init(Title: "The Road Beyond Ruin", author: "Gemma Liviero", Abstruct: "For some people in post--WWII Germany, the battle is not over", genre: "History Fiction", rating: 4.3, Nofpages: 443, Readlv: "", publisher: "Lake Union Publishing(January 1, 2019)", year: 2019, IBSN: 1503901017))
        Book.append(Infobase.init(Title: "Beyond the Great River", author: "Zoe Saadia", Abstruct: "Action, politics and love in the 12th North America. Ready to fall in love with pre-Columbian world?", genre: "Fiction", rating: 4.2, Nofpages: 335, Readlv: "", publisher: "Amazon Digital Services LLC", year: 2014, IBSN: 0))
        
    }
}
