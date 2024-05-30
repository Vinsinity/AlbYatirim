//
//  Router.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import Foundation

enum RouterError: Error {
    case urlGenerate
    case encoding
}

class Router {
    
    var baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func generateUrl(request: ServiceRequest) throws -> URLRequest {
        var urlComponents = URLComponents(string: self.baseUrl)
        urlComponents?.path.append(request.endpoint.rawValue)
        
        guard let requestUrl = urlComponents?.url else {
            throw RouterError.urlGenerate
        }
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            return try request.encoding.encode(urlRequest, with: request.parameters)
        }catch{
            throw RouterError.encoding
        }
    }
}
