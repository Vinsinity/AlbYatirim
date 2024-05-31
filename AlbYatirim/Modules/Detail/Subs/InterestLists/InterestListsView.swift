//
//  InterestLists.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

class InterestListsView: UIView {

    private let title: UILabel = {
        let label = UILabel()
        label.text = "İlgili Listeler"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.register(InterestListsCollectionViewCell.self, forCellWithReuseIdentifier: InterestListsCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private var data: [String]?
    
    override func draw(_ rect: CGRect) {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSubview(title)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(_ data: [String]) {
        self.data = data
        collectionView.reloadData()
    }

}

extension InterestListsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = data![indexPath.item]
        let font = UIFont.customFont(family: .poppins, style: .bold, size: 14) ?? UIFont.systemFont(ofSize: 14)
        let estimatedWidth = estimatedWidthForText(text, font: font)
        return CGSize(width: estimatedWidth + 30, height: collectionView.frame.height)
    }
    
    func estimatedWidthForText(_ text: String, font: UIFont) -> CGFloat {
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: collectionView.frame.height)
        let attributes = [NSAttributedString.Key.font: font]
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return ceil(rect.width)
    }
}

extension InterestListsView: UICollectionViewDelegate {
    
}

extension InterestListsView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterestListsCollectionViewCell.identifier, for: indexPath) as! InterestListsCollectionViewCell
        cell.title.text = "\(data?[indexPath.row] ?? "")"
        return cell
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InterestListsView()
}
