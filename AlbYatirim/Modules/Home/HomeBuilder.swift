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
        let router = HomeRouter(viewController: view)
        
        viewModel.delegate = view
        view.viewModel = viewModel
        viewModel.router = router
        
        return view
    }
    
}
