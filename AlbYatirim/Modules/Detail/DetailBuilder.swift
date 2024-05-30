//
//  DetailBuilder.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

class DetailBuilder: ViewBuilder {
    
    static func build(parameter: [String]) -> UIViewController {
        let view = DetailViewController()
        let viewModel = DetailViewModel()
        
        viewModel.delegate = view
        view.viewModel = viewModel
        
        return view
    }
    
}
