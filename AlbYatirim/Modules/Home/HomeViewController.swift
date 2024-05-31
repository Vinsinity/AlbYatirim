//
//  HomeViewController.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import UIKit

// - MARK: View Lifecycle
class HomeViewController: UIViewController {
    
    enum Route {
        case detail(symbol: String)
    }
    
    private let sectorListTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        tableView.register(SectorListTableViewCell.self, forCellReuseIdentifier: SectorListTableViewCell.identifier)
        tableView.register(SectorListTableViewCellHeader.self,
            forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var viewModel: HomeViewModelProtocol?
    var sectorList: [SectorListTableViewCellPresentModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel?.load()
        
//        self.view.backgroundColor = UIColor.blue500
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.backgroundColor = UIColor.blue500
//        navigationController?.navigationBar.largeTitleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.white
//        ]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = UIColor.blue500
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor.blue500
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.blue500
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor.blue500
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }

}

// - MARK: View Components
extension HomeViewController {
    
    // MARK: Setup UI Components
    private func setupUI() {
        setTitle(title: "Hisseler")
        setTableView()
    }
    
    private func setTitle(title: String) {
        self.title = title
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setTableView() {
        sectorListTableView.dataSource = self
        sectorListTableView.delegate = self
        
        self.view.addSubview(sectorListTableView)
        
        NSLayoutConstraint.activate([
            sectorListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sectorListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sectorListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            sectorListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// - MARK: TableView Data Source
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
               "sectionHeader") as! SectorListTableViewCellHeader
        view.setStockCount(stock: sectorList?.count ?? 0)
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectorList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SectorListTableViewCell.identifier, for: indexPath) as! SectorListTableViewCell
        guard let sector = sectorList?[indexPath.row] else{
            return cell
        }
        cell.setStockInformations(sector)
        return cell
    }
}

// - MARK: TableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectRow(at: indexPath.row)
    }
}

// - MARK: ViewModel Delegation
extension HomeViewController: HomeViewModelDelegate {
    func homeViewOutput(output: HomeViewModelOutputs) {
        switch output {
        case .setLoading(let bool):
            print("Set loading status: \(bool)")
        case .showList(let sectorList):
            self.sectorList = sectorList
            self.sectorListTableView.reloadData()
        case .showAlert(let title, let message):
            print("\(title) - \(message)")
        }
    }
}

#Preview {
    UINavigationController(rootViewController: HomeViewController())
}
