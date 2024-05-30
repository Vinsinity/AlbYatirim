//
//  HomeViewModel.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    var delegate: HomeViewModelDelegate? { get set }
    func load()
    func selectRow()
}

class HomeViewModel: HomeViewModelProtocol {
    weak var delegate: (any HomeViewModelDelegate)?
    
    func load() {
        delegate?.homeViewOutput(output: .setLoading(true))
        print("HomeViewModel Load called, need service implementation")
        Service.shared.fetch(request: .init(endpoint: .list, method: .post)) { (response: ServiceResult<Test>) in
            switch response {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        delegate?.homeViewOutput(output: .setLoading(false))
    }
    
    func selectRow() {
        
    }
    
}

struct Test: Codable {
    let a: String
    let b: String
}

enum HomeViewModelOutputs: Equatable {
    case setLoading(Bool)
    case showList
}

protocol HomeViewModelDelegate: AnyObject {
    func homeViewOutput(output: HomeViewModelOutputs)
}
