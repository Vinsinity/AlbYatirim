//
//  StaticsView.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

struct SectorStaticItem: Equatable {
    var title: String
    var content: String
}

class StaticsView: UIView {
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "İstatistikler"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reportButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("Rapor", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.register(StaticsViewCollectionViewCell.self, forCellWithReuseIdentifier: StaticsViewCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private var data: [SectorStaticItem]?
    
    override func draw(_ rect: CGRect) {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSubview(title)
        addSubview(reportButton)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            reportButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            reportButton.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(_ data: [SectorStaticItem]) {
        self.data = data
        collectionView.reloadData()
    }

}

extension StaticsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 50)
    }
}

extension StaticsView: UICollectionViewDelegate {
    
}

extension StaticsView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StaticsViewCollectionViewCell.identifier, for: indexPath) as! StaticsViewCollectionViewCell
//        cell.backgroundColor = .red
        cell.title.text = data?[indexPath.row].title ?? ""
        cell.content.text = data?[indexPath.row].content ?? ""
        return cell
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StaticsView()
}
