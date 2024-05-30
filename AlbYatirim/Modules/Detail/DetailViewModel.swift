//
//  DetailViewModel.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import Foundation

// - MARK: ViewModel Protocol
protocol DetailViewModelProtocol: AnyObject {
    var delegate: DetailViewModelDelegate? { get set }
    func load()
}

// - MARK: Home ViewModel
class DetailViewModel: DetailViewModelProtocol {
    var delegate: (any DetailViewModelDelegate)?
    
    func load() {
        
    }
}

protocol DetailViewModelDelegate: AnyObject {
    
}
