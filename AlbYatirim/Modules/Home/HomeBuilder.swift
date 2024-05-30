//
//  HomeBuilder.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import UIKit

class HomeBuilder: ViewBuilder {
    
    static func build() -> UIViewController {
        let view = HomeViewController()
        let viewModel = HomeViewModel()
        
        viewModel.delegate = view
        view.viewModel = viewModel
        
        return view
    }
    
}
