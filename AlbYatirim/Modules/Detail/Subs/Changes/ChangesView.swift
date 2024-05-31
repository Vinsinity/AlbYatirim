//
//  ChangesView.swift
//  AlbYatirim
//
//  Created by Erhan Hangül on 31.05.2024.
//

import UIKit

struct SectorChangeItem: Equatable {
    var low: String
    var high: String
    var percentChange: Double
    var period: String
}

class ChangesView: UIView {
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Değişimler"
        label.font = UIFont.customFont(family: .poppins, style: .bold, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.register(ChangesCollectionViewCell.self, forCellWithReuseIdentifier: ChangesCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let period = ["Günlük","Haftalık","Aylık","Yıllık"]
    private var data: [SectorChangeItem]?
    
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
    
    func configure(_ data: [SectorChangeItem]) {
        self.data = data
        self.collectionView.reloadData()
    }

}

extension ChangesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension ChangesView: UICollectionViewDelegate {
    
}

extension ChangesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return period.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChangesCollectionViewCell.identifier, for: indexPath) as! ChangesCollectionViewCell
        cell.backgroundColor = .white
        cell.period.text = "\(data?[indexPath.row].period ?? "-") Değişim"
        cell.high.text = "Zirve \(data?[indexPath.row].high ?? "-")₺"
        cell.low.text = "Dip \(data?[indexPath.row].low ?? "-")₺"
        cell.change.text = "\(String(format: "%.2f", data?[indexPath.row].percentChange ?? "0"))%"
        cell.change.textColor = (data?[indexPath.row].percentChange ?? 0) > 0 ? .green100 : .red400
        return cell
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ChangesView()
}
