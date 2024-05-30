//
//  SectorListTableViewCell.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 30.05.2024.
//

import UIKit
import Kingfisher

struct SectorListTableViewCellPresentModel: Equatable {
    let icon: String
    let shortName: String
    let longName: String
    let change: Double
    let price: Double
}

class SectorListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: SectorListTableViewCell.self)
    
    let stack = UIStackView()
    let stockView = UIView()
    var stockIcon = UIImageView()
    var stockShortName = UILabel()
    var stockLongName = UILabel()
    var changeLabel = UILabel()
    var priceLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        
        stockShortName.font = UIFont.customFont(family: .poppins, style: .medium, size: 16)
        stockShortName.textColor = UIColor.black
        
        stockLongName.font = UIFont.customFont(family: .satoshi, style: .light, size: 10)
        stockLongName.lineBreakMode = .byTruncatingTail
        
        changeLabel.font = UIFont.customFont(family: .satoshi, style: .regular, size: 14)
        changeLabel.textColor = UIColor.green100
        changeLabel.textAlignment = .right
        
        priceLabel.font = UIFont.customFont(family: .poppins, style: .medium, size: 14)
        priceLabel.textColor = UIColor.blue900
        priceLabel.textAlignment = .right
        
        stockView.translatesAutoresizingMaskIntoConstraints = false
        stockIcon.translatesAutoresizingMaskIntoConstraints = false
        stockShortName.translatesAutoresizingMaskIntoConstraints = false
        stockLongName.translatesAutoresizingMaskIntoConstraints = false
        
        stockView.addSubview(stockIcon)
        stockView.addSubview(stockShortName)
        stockView.addSubview(stockLongName)
        
        NSLayoutConstraint.activate([
            stockIcon.centerYAnchor.constraint(equalTo: stockView.centerYAnchor),
            stockIcon.leadingAnchor.constraint(equalTo: stockView.leadingAnchor, constant: 5),
            stockIcon.heightAnchor.constraint(equalToConstant: 42),
            stockIcon.widthAnchor.constraint(equalToConstant: 42),
            stockShortName.topAnchor.constraint(equalTo: stockIcon.topAnchor),
            stockShortName.leadingAnchor.constraint(equalTo: stockIcon.trailingAnchor, constant: 10),
            stockLongName.bottomAnchor.constraint(equalTo: stockIcon.bottomAnchor),
            stockLongName.leadingAnchor.constraint(equalTo: stockIcon.trailingAnchor, constant: 10),
            stockLongName.trailingAnchor.constraint(equalTo: stockView.trailingAnchor)
        ])
        
        stack.addArrangedSubview(stockView)
        stack.addArrangedSubview(changeLabel)
        stack.addArrangedSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func setStockInformations(_ info: SectorListTableViewCellPresentModel) {
        self.stockIcon.kf.setImage(with: URL(string: info.icon))
        self.stockShortName.text = info.shortName
        self.stockLongName.text = info.longName
        self.priceLabel.text = "\(String(format: "%.2f", info.price))₺"
        self.changeLabel.text = info.change > 0 ? "+\(String(format: "%.2f", info.change))%" : "\(String(format: "%.2f", info.change))%"
        self.changeLabel.textColor = info.change > 0 ? .green100 : .red400
    }

}

#Preview(traits: .sizeThatFitsLayout) {
//    SectorListTableViewCell()
    UINavigationController(rootViewController: HomeViewController())
}
