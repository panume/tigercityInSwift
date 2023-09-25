//
//  ProductModel.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/11.
//

import UIKit
import ObjectMapper

class ProductListSummary: Mappable {
    
    var size: Int?
    var pages: Int?
    var current: Int?
    var items: [ProductModel]?
    var total: Int?
    var haveNextPage: Bool?

    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        size         <- map["size"]
        pages         <- map["pages"]
        current         <- map["current"]
        items         <- map["items"]
        total         <- map["total"]
        haveNextPage         <- map["haveNextPage"]

    }
}

class ProductModel: Mappable {
    
    var spuId: String?
    var prodName: String?
    var sku: [Any]?
    var prodType: Int?
    var saleTags: [Any]?
    var price: Double?
    var rawPrice: Double?
    var prodPlace: String?
    var thumbUrl: String?
    var shouFlag: Bool?
    var feature: [FeatureItem]?
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
    var topicItems: [TopicItem]?
    var auditDate: String?
    var categoryNo: String?
    var memo: String?
    var bindSpu: String?
    var discountPoint: Double?
    var auditStatus: Int?
    var specialPrice: Double?
    var companyNo: String?
    var discountPointAmount: Double?


    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        spuId         <- map["spuId"]
        prodName      <- map["prodName"]
        sku           <- map["sku"]
        prodType           <- map["prodType"]
        prodType           <- map["prodType"]

    }
    
    
    

}

class TopicItem: Mappable {
    var title: String?
    var type: String?
    var code: String?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title         <- map["title"]
        type         <- map["type"]
        code         <- map["code"]

    }
}

class FeatureItem: Mappable {
    var featureId: String?
    var title: String?

    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        featureId         <- map["featureId"]
        title         <- map["title"]

    }
}
