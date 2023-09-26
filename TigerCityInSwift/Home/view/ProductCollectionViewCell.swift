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
        
    var model: ProductModel? {
        didSet {
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
        label.numberOfLines = 0
        return label
    }()
    
    lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(hex: 0x666666)
        return label
    }()
    
    lazy var rightLine: UIView = {
        let line = UIView()
        line.backgroundColor = Basic().color.lineColor
        return line
    }()
    
    lazy var bottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = Basic().color.lineColor
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("111")
    }
    
    func setupUI() {
        self.contentView.addSubview(picture)
        self.contentView.addSubview(collectIcon)
        self.contentView.addSubview(tagLabel)
        self.contentView.addSubview(brandLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(rawPriceLabel)
        self.contentView.addSubview(rightLine)
        self.contentView.addSubview(bottomLine)

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
        
        tagLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(picture.snp.bottom)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(designSize(16))
            make.right.equalToSuperview().offset(-designSize(16))
            make.top.equalTo(picture.snp.bottom).offset(designSize(19))
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(designSize(16))
            make.right.equalToSuperview().offset(-designSize(16))
            make.top.equalTo(brandLabel.snp.bottom).offset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(designSize(16))
            make.bottom.equalToSuperview().offset(-designSize(40))
        }
        
        rawPriceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(priceLabel)
            make.left.equalTo(priceLabel.snp.right).offset(designSize(8))
        }
        
        rightLine.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.height.equalTo(designSize(0.5))
        }
        
        bottomLine.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(designSize(0.5))
        }
        
    }
    
    func setInfo() {
        picture.kf.setImage(with: URL(string: model?.thumbUrl))
        brandLabel.text = model?.brandName
        nameLabel.text = model?.prodName
        
        let muString = NSMutableAttributedString(string: model?.price?)
        muString.addAttribute(.font, value: <#T##Any#>, range: <#T##NSRange#>)
        priceLabel.attributedText = muString
    }
    
    func setShowRightLine(show: Bool) {
        rightLine.isHidden = !show
    }
    
    
}
