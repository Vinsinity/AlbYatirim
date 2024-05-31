//
//  AboutCompanyTableViewCell.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

class AboutCompanyTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: AboutCompanyTableViewCell.self)
    
    var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(family: .poppins, style: .regular, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var content: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(family: .poppins, style: .regular, size: 14)
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
        addSubview(title)
        addSubview(content)
        
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            content.centerYAnchor.constraint(equalTo: centerYAnchor),
            content.trailingAnchor.constraint(equalTo: trailingAnchor),
            content.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 30)
        ])
    }
    
    func configure(title: String, content: String) {
        self.title.text = title
        self.content.text = content
    }

}

#Preview(traits: .sizeThatFitsLayout) {
    AboutCompanyTableViewCell()
}
