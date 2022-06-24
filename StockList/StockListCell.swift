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
}
