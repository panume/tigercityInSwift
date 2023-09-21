//
//  BaseResponse.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/21.
//

import UIKit
import Moya

//enum BusinessError {
//case <#case#>
//}

class BaseResponse {
    var success: Bool = true
    var code: String?
    var message: String?
    var data: Any?
    var stat: String?

    init(_ response: Response) {
        do {
            
            let value = try response.mapJSON() as! NSDictionary
            success = value.value(forKey: "success") as! Bool
            code = value.value(forKey: "code") as? String
            message = value.value(forKey: "message") as? String
            stat = value.value(forKey: "stat") as? String
            data = value.value(forKey: "data")
        } catch {
            
        }
        
    }
}
