//
//  StockListCell.swift
//  StockList
//
//  Created by 권오준 on 2022/06/24.
//

import UIKit

class StockListCell: UICollectionViewCell {
    
    static let identifier = "StockListCell"
    var stockListCellView = StockListCellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stockListCellView.frame = contentView.frame
        contentView.addSubview(stockListCellView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(stock: Stock, rank: Int) {
        stockListCellView.rank.text = "\(rank)"
        stockListCellView.logo.image = UIImage(named: "\(stock.company)")
        stockListCellView.company.text = "\(stock.company)"
        stockListCellView.price.text = convertPrices(stock.price)
        stockListCellView.percentage.text = "\(stock.percentage)%"
        stockListCellView.percentage.textColor = stock.percentage > 0 ? .systemRed : .systemBlue
    }
    
    func convertPrices(_ price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? "0"
        
        return result + " 원"
    }
}
