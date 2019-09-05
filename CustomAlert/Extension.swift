//
//  Extension.swift
//  CustomAlert
//
//  Created by Ngoc on 9/5/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit


extension Int {
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }()
    
    var delimiter: String {
        return Int.numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
