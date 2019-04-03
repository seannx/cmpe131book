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
        let Row0 = Infobase()
        let Row1 = Infobase()
        let Row2 = Infobase()
        let Row3 = Infobase()
        let Row4 = Infobase()
        let Row5 = Infobase()
        let Row6 = Infobase()
        
        Row0.Title = "Shakugun No SHANA"
        Row0.Abstruct = "坂井悠二"
        Row0.ima = "5"
        Row1.Title = "四月的谎言"
        Row1.Abstruct = "April without you"
        Row1.ima = "5"
        Row2.Title = "Stein Gate"
        Row2.Abstruct = "Its your choice"
        Row2.ima = "5"
        Row3.Title = "Death Note"
        Row3.Abstruct = "Emmmmm L"
        Row3.ima = "5"
        Row4.Title = "火影忍者"
        Row4.Abstruct = "有树叶飘落的地方 火的意志就在燃烧"
        Row4.ima = "5"
        Row5.Title = "Bleach"
        Row5.Abstruct = "Death"
        Row5.ima = "5"
        Row6.Title = "Raligun"
        Row6.Abstruct = "-------"
        Row6.ima = "5"
        Book.append(Row0)
        Book.append(Row1)
        Book.append(Row2)
        Book.append(Row3)
        Book.append(Row4)
        Book.append(Row5)
        Book.append(Row6)
    }
}
