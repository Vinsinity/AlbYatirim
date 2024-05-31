//
//  ChangesCollectionViewCell.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

class ChangesCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: ChangesCollectionViewCell.self)
    
    var period: UILabel = {
        let label = UILabel()
        label.text = "Period"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var change: UILabel = {
        let label = UILabel()
        label.text = "Change"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var low: UILabel = {
        let label = UILabel()
        label.text = "Low"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var high: UILabel = {
        let label = UILabel()
        label.text = "High"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray.withAlphaComponent(0.2)
        layer.cornerRadius = 25
        
        addSubview(period)
        addSubview(change)
        addSubview(low)
        addSubview(high)
        
        NSLayoutConstraint.activate([
            period.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            period.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            change.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            change.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            low.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            low.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            high.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            high.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview(traits: .sizeThatFitsLayout, body: {
    ChangesCollectionViewCell()
})
