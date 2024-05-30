//
//  ApiService.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import Foundation
import Alamofire

class Service {
    
    var router: ServiceRouter
    static var shared = Service(router: .init(baseUrl: "https://canlifiyat.com/api/mobile/v1/"))
    
    init(router: ServiceRouter) {
        self.router = router
    }
    
    func fetch<T>(request: ServiceRequest, completion: @escaping (ServiceResult<T>) -> Void) where T : Decodable, T : Encodable {
        
        do {
            let url = try router.generateUrl(request: request)
            
            AF.request(url).validate().responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let response):
                    completion(.success(response: response))
                case .failure(let error):
                    completion(.failure(error: error))
                }
            }
        } catch {
            completion(.failure(error: error))
        }
    }
}
