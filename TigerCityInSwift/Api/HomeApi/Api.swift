//
//  Api.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/13.
//

import Foundation
import Moya

private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

let tigerCityProvider = MoyaProvider<TigerCityApi>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter), logOptions: .verbose))])

public enum TigerCityApi {
    case homeInit
    case homeConfigure
    case homeMall(pageNum: Int, page: Int, province: String, city: String, majorCategory: String, dataParams: String, order: String, tags: String)
    case productList(url: String, page: Int, pageNum: Int)
    case authCode(phone: String)
    case login(phone: String, voucherCode: String, code: String, recommendId: String)
}

extension TigerCityApi: TargetType {
    public var baseURL: URL {
        switch self {
        case .productList(let url, _, _):
            return URL(string: url)!
        default:
            return URL(string: "http://49.234.230.199:8881/front/api/gateway.do?")!
//            return URL(string: "https://m.quanxiuniverse.top/front/api/gateway.do?")!
        
        }
    }
    
    public var path: String {
        return ""
//        switch self {
//        case .homeInit:
//            return ""
//        case .homeConfigure:
//            return ""
//        case .productList(_, _, _):
//            return ""
//        case .homeMall(_, _, _, _, _, _, _, _):
//            return ""
//        case .authCode(_)
//        default
//            return ""
//        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Moya.Task {
        if let requestParameters = parameters {
            return .requestParameters(parameters: requestParameters, encoding: URLEncoding.default)
        }
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return ["Authorization" : UserModel.shared.token]
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .homeConfigure:
            return ["actionName" : "home.user.find", "appVersion" : "1.0.0"]
        case .productList(let url, let page, let pageNum):
            return ["serviceUrl" : url,
                    "page" : page,
                    "pageNum" : [pageNum]
            ]
        case .homeMall(let pageNum, let page, let province, let city, let majorCategory, let dataParams, let order, let tags):
            return ["actionName" : "home.factory.find",
                    "appVersion" : "1.0.0",
                    "pageNum" : pageNum,
                    "page" : page,
                    "province" : province,
                    "city" : city,
                    "majorCategory" : majorCategory,
                    "dataParams" : dataParams,
                    "tags" : tags,
                    "order" : order
            ]
            
        case .authCode(let phone):
            return ["actionName" : "",
                    "appVersion" : "1.0.0",
                    "phone" : phone
            ]
            
        case .login(let phone, let voucherCode, let code, let recommendId):
            return ["actionName" : "",
                    "appVersion" : "1.0.0",
                    "phone" : phone,
                    "voucherCode" : voucherCode,
                    "code" : code,
                    "recommendId" : recommendId,

            ]
        default:
            return nil
        }
    }
}
