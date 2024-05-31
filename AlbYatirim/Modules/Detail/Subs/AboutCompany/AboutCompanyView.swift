//
//  AboutCompanyView.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

struct AboutCompanyItem: Equatable {
    var title: String
    var content: String
}

class AboutCompanyView: UIView {
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Şirket Hakkında"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AboutCompanyTableViewCell.self, forCellReuseIdentifier: AboutCompanyTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var data: [AboutCompanyItem]?
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        tableView.delegate = self
        tableView.dataSource = self
        
        addSubview(title)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            tableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(_ data: [AboutCompanyItem]) {
        self.data = data
        tableView.reloadData()
    }

}

extension AboutCompanyView: UITableViewDelegate {
    
}

extension AboutCompanyView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AboutCompanyTableViewCell.identifier, for: indexPath) as! AboutCompanyTableViewCell
        cell.configure(title: data?[indexPath.row].title ?? "-", content: data?[indexPath.row].content ?? "-")
        return cell
    }
    
}

#Preview {
    AboutCompanyView()
}
