//
//  ServiceRequest.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import Alamofire

struct ServiceRequest {
    var parameters: Parameters?
    var endpoint: Endpoint
    var method: HTTPMethod
    var encoding: ParameterEncoding = JSONEncoding.default
}
