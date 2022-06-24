//
//  StockListViewController.swift
//  StockList
//
//  Created by 권오준 on 2022/06/24.
//

import UIKit

class StockListViewController: UIViewController {

    var stockListView = StockListView()
    let stocks = [
        Stock(company: "테슬라", price: 1238631, percentage: 0.04),
        Stock(company: "애플", price: 238631, percentage: 1.04),
        Stock(company: "넷플릭스", price: 438631, percentage: -0.04),
        Stock(company: "알파벳A", price: 3176631, percentage: 0.04),
        Stock(company: "아마존", price: 3538631, percentage: 0.04),
        Stock(company: "나이키", price: 158631, percentage: 0.04),
        Stock(company: "디즈니", price: 138631, percentage: 0.04),
    ]
    
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
        return stocks.count * 2
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
        
        let num = indexPath.row
        cell.updateUI(stock: stocks[num % 7], rank: num + 1)
        
        return cell
    }
}
