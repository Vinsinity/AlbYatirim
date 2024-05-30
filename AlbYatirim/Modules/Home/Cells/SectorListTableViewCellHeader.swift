//
//  SectorListTableViewCellHeader.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import UIKit

class SectorListTableViewCellHeader: UITableViewHeaderFooterView {
    
    let stack = UIStackView()
    let stockLabel = UILabel()
    let changeLabel = UILabel()
    let priceLabel = UILabel()
    var stockCount: Int?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        
        stockLabel.text = "Hisseler (\(String(describing: stockCount ?? 0)))"
        stockLabel.font = UIFont.customFont(family: .poppins, style: .medium, size: 11)
        stockLabel.textColor = UIColor.black400
        
        changeLabel.text = "Günlük Değişim"
        changeLabel.font = UIFont.customFont(family: .poppins, style: .medium, size: 11)
        changeLabel.textColor = UIColor.black400
        changeLabel.textAlignment = .right
        
        priceLabel.text = "Hisse Fiyatı"
        priceLabel.font = UIFont.customFont(family: .poppins, style: .medium, size: 11)
        priceLabel.textColor = UIColor.black400
        priceLabel.textAlignment = .right
        
        stockLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(stockLabel)
        stack.addArrangedSubview(changeLabel)
        stack.addArrangedSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func setStockCount(stock: Int) {
        self.stockCount = stock
        stockLabel.text = "Hisseler (\(String(describing: stockCount ?? 0)))"
    }
}

#Preview(traits: .sizeThatFitsLayout) {
//    SectorListTableViewCellHeader()
    UINavigationController(rootViewController: HomeViewController())
}
