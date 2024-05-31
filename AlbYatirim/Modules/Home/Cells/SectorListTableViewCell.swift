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
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let stockView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var stockIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var stockShortName: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(family: .poppins, style: .medium, size: 16)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stockLongName: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(family: .satoshi, style: .light, size: 10)
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var changeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(family: .satoshi, style: .regular, size: 14)
        label.textColor = UIColor.green100
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(family: .satoshi, style: .regular, size: 14)
        label.textColor = UIColor.blue900
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        addSubview(stack)
        
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
