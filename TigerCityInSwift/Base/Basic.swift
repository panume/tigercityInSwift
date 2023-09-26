//
//  Basic.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/20.
//

import Foundation
import SwifterSwift

struct Basic {
    var color = Color()
    var font = Font()
    
    
}



struct Color {
    let lineColor = UIColor(hex: 0xDEDEDE)
    let mainColor = UIColor(hex: 0xC31426)
    let color1 = UIColor(hex: 0x333333)
}

struct Font {
    func fontWithDesign(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: designSize(size))
    }
    
    func numFontWithDesign(size: CGFloat) -> UIFont {
        return UIFont(name: "DINAlternate-Bold", size: designSize(size))
    }
}


