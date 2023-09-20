//
//  ProductCollectionViewCell.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/8.
//

import UIKit
import SwifterSwift
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    
    var _model: ProductModel?
    
    var model: ProductModel {
        get {
            return self.model
        }
        set {
            _model = newValue
            self.setInfo()
        }
    }
    
    lazy var picture: UIImageView = {
        let imageView = UIImageView.init(frame: CGRectZero)
        return imageView
    }()
    
    lazy var collectIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon_product_collect"))
        return imageView
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "DINAlternate-Bold", size: 14)
        label.textColor = UIColor(hex: 0xC31426)
        return label
    }()
    
    lazy var rawPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(hex: 0xC31426)
        return label
    }()
    
    lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(hex: 0x666666)
        return label
    }()
    
    lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(hex: 0x666666)
        return label
    }()
    
    func setupUI() {
        self.contentView.addSubview(picture)
        self.contentView.addSubview(collectIcon)
        self.contentView.addSubview(tagLabel)
        self.contentView.addSubview(brandLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(rawPriceLabel)
        
        let width = (screen_width - 56) / 2
        collectIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(-16)
//            make.width.equalTo(15)
//            make.height.equalTo(15)
            make.size.equalTo(15)
        }

        picture.snp.makeConstraints { make in
            make.top.equalTo(collectIcon.snp.bottom)
            make.size.equalTo(width)
            make.centerX.equalToSuperview()
        }
        
        brandLabel.snp.makeConstraints { make in
            
        }
        
    }
    
    func setInfo() {
        self.picture.kf.setImage(with: URL(string: _model?.thumbUrl))
        self.brandLabel.text = _model?.brandName
    }
    
    
}
