//
//  ServiceResult.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import Foundation

enum ServiceResult<T: Decodable> {
    case success(response: T)
    case failure(error: Error)
}
