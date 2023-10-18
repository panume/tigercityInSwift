//
//  UserModel.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/10/13.
//

import UIKit

class UserModel {
    
    var token: String = ""
    var isLogin = false
    var nickName: String = ""

    public static let shared = UserModel()
    
   
}
