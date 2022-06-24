//
//  StockListViewController.swift
//  StockList
//
//  Created by 권오준 on 2022/06/24.
//

import UIKit

class StockListViewController: UIViewController {

    var stockListView = StockListView()
    
    
    override func loadView() {
        view = stockListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockListView.collectionView.dataSource = self
        stockListView.collectionView.delegate = self
    }
}

extension StockListViewController: UICollectionViewDelegate,
                                   UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 20
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StockListCell.identifier,
            for: indexPath) as? StockListCell else {
            return UICollectionViewCell()
        }
        
        
        return cell
    }
    
    
}
