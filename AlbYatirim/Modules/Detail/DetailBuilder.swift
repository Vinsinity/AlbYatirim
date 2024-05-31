//
//  DetailBuilder.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

// - MARK: Detail View Builder
class DetailBuilder: ViewBuilder {
    
    static func build(parameter: [String]) -> UIViewController {
        let view = DetailViewController()
        let viewModel = DetailViewModel(symbol: parameter[0])
        
        viewModel.delegate = view
        view.viewModel = viewModel
        
        return view
    }
    
}
