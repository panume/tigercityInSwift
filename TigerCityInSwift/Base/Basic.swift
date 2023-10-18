//
//  Basic.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/20.
//

import Foundation
import SwifterSwift


struct Basic {
    static var color = Color()
    static var font = Font()
    
    
}



struct Color {
    let lineColor = UIColor(hex: 0xDEDEDE)
    let redColor = UIColor(hex: 0xC31426)
    let color1 = UIColor(hex: 0x333333)
    
    /// 666666
    let color2 = UIColor(hex: 0x666666)
    let color3 = UIColor(hex: 0x999999)
    
    func colorWithHex(_ hex: Int) -> UIColor {
        return UIColor(hex: hex)!
    }
}

struct Font {
    func fontWithDesign(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: designSize(size))!
    }
    
    func boldFontWithDesign(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: designSize(size))!
    }
    
    func numFontWithDesign(size: CGFloat) -> UIFont {
        return UIFont(name: "DINAlternate-Bold", size: designSize(size))!
    }
}


