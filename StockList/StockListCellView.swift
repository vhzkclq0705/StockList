//
//  StockListCellView.swift
//  StockList
//
//  Created by 권오준 on 2022/06/24.
//

import UIKit
import SnapKit

class StockListCellView : UIView {
    
    lazy var rank: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .systemBlue
        
        return label
    }()
    
    lazy var logo: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    lazy var company: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray
        
        return label
    }()
    
    lazy var percentage: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .systemRed
        
        return label
    }()

    lazy var heart: UIButton = {
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = .lightGray
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 30)
        
        let button = UIButton()
        button.configuration = config
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [
            rank,
            logo,
            company,
            price,
            percentage,
            heart,
        ]
            .forEach{ addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        rank.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(10)
            $0.width.equalTo(25)
        }
        
        logo.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(rank.snp.right).offset(10)
            $0.width.height.equalTo(40)
        }
        
        company.snp.makeConstraints {
            $0.top.equalTo(logo.snp.top)
            $0.left.equalTo(logo.snp.right).offset(20)
        }
        
        price.snp.makeConstraints {
            $0.bottom.equalTo(logo.snp.bottom)
            $0.left.equalTo(company.snp.left)
        }
        
        percentage.snp.makeConstraints {
            $0.centerY.equalTo(price)
            $0.left.equalTo(price.snp.right).offset(5)
        }
        
        heart.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-20)
        }
    }
}
