//
//  ProductModel.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/11.
//

import UIKit
import ObjectMapper

class ProductModel: Mappable {
    
    var spuId: String?
    var prodName: String?
    var sku: [Any]?
    var prodType: Int?
    var saleTags: [String]?
    var price: Double?
    var rawPrice: Double?
    var prodPlace: String?
    var thumbUrl: String?
    var shouFlag: Bool?
    var feature: [Any]?
    var recommendFlag: Bool?
    var saleNum: Int?
    var saleStatus: Int?
    var prodSource: [String]?
    var unit: [String]?
    var detailInfo: [String]?
    var params: [Any]?
    var deliverDay: Int?
    var select: Bool?
    var buyNum: Int?
    var items: [Any]?
    var saleLimit: Int?
    var salesType: Int?
    var availableNum: Int?
    var newFlag: Bool?
    var brandName: String?
    var hasFav: Bool?
    var topicItems: [Any]?


    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        spuId         <- map["spuId"]
        prodName      <- map["prodName"]
        sku           <- map["sku"]
        
    }
    
    
    

}
