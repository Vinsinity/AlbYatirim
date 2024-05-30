//
//  HomeViewController.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        viewModel?.load()
        // Do any additional setup after loading the view.
    }

}

extension HomeViewController: HomeViewModelDelegate {
    func homeViewOutput(output: HomeViewModelOutputs) {
        switch output {
        case .setLoading(let bool):
            print("Set loading status: \(bool)")
        case .showList:
            print("Show list called")
        }
    }
    
}
