//
//  GetSymbolResponse.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import Foundation

struct GetSymbolResponse: Codable {
    var success: Bool
    var code: Int
    var message: String?
    var errors: [String]?
    var payload: GetBistData
}
