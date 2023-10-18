//
//  Macro.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/20.
//

import Foundation
import UIKit

let screen_width = UIScreen.main.bounds.size.width
let screem_height = UIScreen.main.bounds.size.height
let designScreenWidth = 375.0
let gPageSize = 20

func designSize(_ size: CGFloat) -> CGFloat {
    return screen_width * size / designScreenWidth
}

let kModuleTypeTopBanner = "Banner"
let kModuleTypeColPic = "ColPic"
let kModuleTypeActiveCategory = "CategoryView"
