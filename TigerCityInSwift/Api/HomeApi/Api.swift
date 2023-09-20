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
    case productList(url: String, page: Int, pageNum: Int)
}

extension TigerCityApi: TargetType {
    public var baseURL: URL {
        switch self {
        case .productList(let url, _, _):
            return URL(string: url)!
        default:
//            return URL(string: "http://49.234.230.199:8881/front/api/gateway.do?")!
            return URL(string: "https://m.quanxiuniverse.top/front/api/gateway.do?")!
        
        }
    }
    
    public var path: String {
        switch self {
        case .homeInit:
            return ""
        case .homeConfigure:
            return ""
        case .productList(_, _, _):
            return ""
        }
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
        
//        @{@"User-Agent":[[BizUserAgent sharedInstance] customUserAgent:BizUserAgent4Interaction],
//                                 @"Content-Type":@"application/json;charset=UTF-8",
//                                 @"Authorization":__userToken()?__userToken():@""
//                                 };
        return nil
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
        default:
            return nil
        }
    }
}
