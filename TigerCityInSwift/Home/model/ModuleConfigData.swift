//
//  ModuleConfigData.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/19.
//

import UIKit
import ObjectMapper

class ModuleConfigResult: Mappable {
    
    var success: Bool?
    var code: String?
    var message: String?
    var data: ModuleConfigData?
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        success <- map["success"]
        code <- map["code"]
        message <- map["message"]
        data <- map["data.moduleConfig"]

    }
}

class ModuleConfigData: Mappable {
    
    var dataView: DataView?
    var moduleItem: [String: String]?
    var modules: [ModuleItem]?
    required init?(map: ObjectMapper.Map) {
    }
    
    func mapping(map: ObjectMapper.Map) {
        dataView <- map["dataView"]
        moduleItem <- map["moduleItem"]
        modules <- map["modules"]
    }
    
    
}

class ModuleItem: Mappable {
    var adSetting: Any?
    var anchorId: String?
    var dataModule: [DataModule]?
    var height: Double?
    var title: String?
    var topMargin: Double?
    var type: String?
    var width: Double?
    var columnCount: Int = 1
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        adSetting <- map["adSetting"]
        anchorId <- map["anchorId"]
        dataModule <- map["dataModule"]
        height <- map["height"]
        title <- map["title"]
        topMargin <- map["topMargin"]
        type <- map["type"]
        width <- map["width"]
        columnCount <- map["columnCount"]
    }
    
    
}

class DataView: Mappable {
    
    var dataModule: [AnyObject]?
    var height: Double = 0
    var pageData: PageData?
    var serviceUrl: String?
    var title: String?
    var topMargin = 0
    var type: String?
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        type <- map["type"]
        topMargin <- map["topMargin"]
        title <- map["title"]
        serviceUrl <- map["serviceUrl"]
        pageData <- map["pageData"]
        height <- map["height"]
        dataModule <- map["dataModule"]
    }
    
    
}

class PageData: Mappable {
    var size: Int?
    var pages: Int?
    var current: Int?
    var items: [ProductModel]?
    var total: Int?
    var haveNextPage: Bool?

    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        size <- map["size"]
        pages <- map["pages"]
        current <- map["current"]
        items <- map["items"]
        total <- map["total"]
        haveNextPage <- map["haveNextPage"]
    }
}

class DataModule: Mappable {
    var picUrl: String?
    var type: String?
    var jumpUrl: String?

    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        picUrl <- map["picUrl"]
        type <- map["type"]
        jumpUrl <- map["jumpUrl"]

    }
    
    
}
