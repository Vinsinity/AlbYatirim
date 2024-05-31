//
//  Endpoint.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import Foundation

enum Endpoint {
//    case getBist = "service/helper/getBist"
//    case symbol = "symbol/asd/getDetail"
    case getStocks(String)
    case symbol(String)
    case getCompanyCard(String)
    
    var path: String {
        switch self {
        case .getStocks(let stocksArea):
            return "service/helper/get\(stocksArea)"
        case .symbol(let symbolName):
            return "symbol/\(symbolName)/getDetail"
        case .getCompanyCard(let symbolName):
            return "symbol/\(symbolName)/getCompanyCard"
        }
    }
}
