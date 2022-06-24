//
//  StockListView.swift
//  StockList
//
//  Created by 권오준 on 2022/06/24.
//

import UIKit
import SnapKit

class StockListView: UIView {
    // MARK: - UI
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(
            width: width,
            height: width / 5)
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        collectionView.register(
            StockListCell.self,
            forCellWithReuseIdentifier: StockListCell.identifier)
        
        return collectionView
    }()
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        collectionView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalToSuperview().offset(-50)
        }
    }
}

