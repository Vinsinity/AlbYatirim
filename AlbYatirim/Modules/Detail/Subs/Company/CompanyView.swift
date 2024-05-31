//
//  CompanyView.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit


struct CompanyItem: Equatable {
    var icon: String
    var shortName: String
    var longName: String
}

class CompanyView: UIView {
    
    private let icon: UIImageView = {
        let image = UIImageView()
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        image.image = .petkm
//        image.contentMode = .center
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let shortName: UILabel = {
        let label = UILabel()
        label.text = "Test1"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 20)
        label.text = label.text?.uppercased()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let longName: UILabel = {
        let label = UILabel()
        label.text = "Test2"
        label.font = UIFont.customFont(family: .poppins, style: .medium, size: 12)
        label.text = label.text?.uppercased()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func draw(_ rect: CGRect) {
        addSubview(icon)
        addSubview(shortName)
        addSubview(longName)
        
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: leadingAnchor),
            icon.topAnchor.constraint(equalTo: topAnchor),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor),
            icon.widthAnchor.constraint(equalToConstant: 50),
            icon.heightAnchor.constraint(equalToConstant: 50),
            
            shortName.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            shortName.topAnchor.constraint(equalTo: icon.topAnchor, constant: 5),
            
            longName.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            longName.bottomAnchor.constraint(equalTo: icon.bottomAnchor, constant: -5)
        ])
    }
    
    func configure(_ data: CompanyItem) {
        self.icon.kf.setImage(with: URL(string: data.icon))
        self.shortName.text = data.shortName
        self.longName.text = data.longName
    }

}
