//
//  DetailViewController.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import UIKit

// - MARK: Detail View
class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel?
    
    private let navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Test", for: .normal)
        button.titleLabel?.font = UIFont.customFont(family: .poppins, style: .bold, size: 20)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "chevron.left")?.withTintColor(.black), for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let companyArea: CompanyView = {
        let view = CompanyView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let staticsArea: StaticsView = {
        let view = StaticsView()
        view.heightAnchor.constraint(equalToConstant: 440).isActive = true
        return view
    }()
    
    private let changesArea: ChangesView = {
        let view = ChangesView()
        view.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return view
    }()
    
    private let interestListsArea: InterestListsView = {
        let view = InterestListsView()
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    
    private let aboutCompanyArea: AboutCompanyView = {
        let view = AboutCompanyView()
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }()
    
    private func setupNavigationView() {
        backButton.addTarget(self,action: #selector(goBack), for: .touchUpInside)
        view.addSubview(navigationView)
        navigationView.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            navigationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupScrollView() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(scrollStackViewContainer)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor ,constant: -40),
        ])
        
        configureContainerView()
    }

    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(companyArea)
        scrollStackViewContainer.addArrangedSubview(staticsArea)
        scrollStackViewContainer.addArrangedSubview(changesArea)
        scrollStackViewContainer.addArrangedSubview(interestListsArea)
        scrollStackViewContainer.addArrangedSubview(aboutCompanyArea)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        setupNavigationView()
        setupScrollView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

// - MARK: Detail View Model Delegate
extension DetailViewController: DetailViewModelDelegate {
    func detailViewOutput(_ output: DetailViewModelOutputs) {
        switch output {
        case .setLoading(let bool):
            print("Set loading status: \(bool)")
        case .showAlert(let title, let message):
            print("\(title) - \(message)")
        case .showSector(let sector, let changes, let statics):
            backButton.setTitle(sector.companyDetail.shortName, for: .normal)
            companyArea.configure(sector.companyDetail)
            staticsArea.configure(statics)
            changesArea.configure(changes)
            interestListsArea.configure(sector.interests)
        case .sectorInformation(let information):
            aboutCompanyArea.configure(information)
        }
    }
}

struct SectorDetailPresentModel: Equatable {
    var companyDetail: CompanyItem
    var interests: [String]
}

#Preview {
    DetailViewController()
}

