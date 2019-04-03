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
        Book.append(Infobase.init(Title:"Shakugun No SHANA", Abstruct: "坂井悠二", ima: "11"))
        Book.append(Infobase.init(Title:"Your Lie in April", Abstruct: "April without you", ima: "11"))
        Book.append(Infobase.init(Title:"Stein Gate", Abstruct: "Its your choice", ima: "11"))
        Book.append(Infobase.init(Title:"Death Note", Abstruct: "Emmmmm L", ima: "11"))
        Book.append(Infobase.init(Title:"Naruto", Abstruct: "有树叶飘落的地方 火的意志就在燃烧", ima: "11"))
        Book.append(Infobase.init(Title:"Bleach", Abstruct: "Death", ima: "11"))
        Book.append(Infobase.init(Title:"Raligun", Abstruct: "萌王", ima: "11"))
    
    }
}
