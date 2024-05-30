//
//  ServiceError.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import Foundation

enum ServiceError: Error {
    case serialization
    case network
    case unknown
}
