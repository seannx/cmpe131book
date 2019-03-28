//
//  textconfigureation.swift
//  BOOK
//
//  Created by 安博 on 3/13/19.
//  Copyright © 2019 安博. All rights reserved.
//

import Foundation
import UIKit

class functions{
    func randomColor()->UIColor{
        let nred: CGFloat = CGFloat.random(in: 0.0...1.0)
        let ngreen: CGFloat = CGFloat.random(in: 0.0...1.0)
        let nblue: CGFloat = CGFloat.random(in: 0.0...1.0)
        return UIColor(red: CGFloat(nred), green: CGFloat(ngreen), blue: CGFloat(nblue), alpha: 1.0)
    }// generate random color
}
