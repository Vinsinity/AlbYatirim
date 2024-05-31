//
//  InterestListsCollectionViewCell.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

class InterestListsCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: InterestListsCollectionViewCell.self)
    
    var container: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title: UILabel = {
        let label = UILabel()
        label.text = "Deneme"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        container.frame = frame
        addSubview(container)
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview(traits: .sizeThatFitsLayout, body: {
    InterestListsCollectionViewCell()
})
