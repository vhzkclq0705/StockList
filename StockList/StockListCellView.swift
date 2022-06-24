//
//  StockListCellView.swift
//  StockList
//
//  Created by 권오준 on 2022/06/24.
//

import UIKit
import SnapKit

class StockListCellView : UIView {
    
    lazy var number: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .systemBlue
        
        return label
    }()
    
    lazy var logo: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    lazy var cost: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var percent: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        
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
            number,
            logo,
            name,
            cost,
            percent,
            heart,
        ]
            .forEach{ addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        number.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
        }
        
        logo.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(number.snp.left).offset(20)
            $0.height.equalTo(logo.snp.width)
        }
        
        name.snp.makeConstraints {
            $0.top.equalTo(logo.snp.top)
            $0.bottom.equalTo(logo.snp.centerY).offset(-10)
            $0.left.equalTo(logo.snp.right).offset(20)
        }
        
        cost.snp.makeConstraints {
            $0.top.equalTo(logo.snp.centerY).offset(10)
            $0.bottom.equalTo(logo.snp.bottom)
            $0.left.equalTo(name.snp.left)
        }
        
        percent.snp.makeConstraints {
            $0.top.bottom.equalTo(cost)
            $0.left.equalTo(cost.snp.right).offset(10)
        }
        
        heart.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-20)
        }
    }
}
