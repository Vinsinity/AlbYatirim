//
//  StaticsViewCollectionViewCell.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

class StaticsViewCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: StaticsViewCollectionViewCell.self)
    
    var title: UILabel = {
        let label = UILabel()
        label.text = "Deneme"
        label.font = UIFont.customFont(family: .poppins, style: .light, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var content: UILabel = {
        let label = UILabel()
        label.text = "Deneme"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        addSubview(content)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            content.topAnchor.constraint(equalTo: title.bottomAnchor),
            content.leadingAnchor.constraint(equalTo: title.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    StaticsViewCollectionViewCell()
}
