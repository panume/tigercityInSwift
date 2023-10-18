//
//  DistrictModel.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/10/13.
//

import Foundation
import ObjectMapper

class DistrictModel: Mappable {
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        parentId         <- map["parentId"]
        id         <- map["id"]
        regionName         <- map["regionName"]
        level         <- map["level"]
        regionCode         <- map["regionCode"]

    }
    
    var parentId: Double?
    var id: Double?
    var regionName: String = ""
    var level: String?
    var regionCode: String?
    var orderNum: Int?
    var items:[DistrictModel]?
    
    
}
