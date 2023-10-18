//
//  StoreCell.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/10/9.
//

import UIKit

class StoreCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = Basic.color.colorWithHex(0xF9F9F9)
        view.layer.cornerRadius = designSize(2)
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var leftView: UIView = {
        let view = UIView()
        view.backgroundColor = Basic.color.colorWithHex(0xECEEF1)
        return view
    }()
    
    lazy var leftBackView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var leftAddressView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var starView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var pointLabel: UILabel = {
        let label = UILabel()
        label.font = Basic.font.numFontWithDesign(size: 12)
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var portrait: UIImageView = {
        let imageView = UIImageView()
        imageView.roundCorners(.allCorners, radius: designSize(32))
        return imageView
    }()
    
    lazy var addressIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon_shop_loc"))
        return imageView
    }()
    
    lazy var yxIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon_gp_tongji"))
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = Basic.font.fontWithDesign(size: 14)
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = Basic.color.color2
        label.font = Basic.font.fontWithDesign(size: 11)
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = Basic.color.color2
        label.font = Basic.font.fontWithDesign(size: 11)
        return label
    }()
    
    var store: StoreModel? {
        didSet {
            self.fillInfo()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(backView)
        contentView.addSubview(leftView)
        leftView.addSubview(leftBackView)
        leftBackView.addSubview(portrait)
        leftBackView.addSubview(leftAddressView)
        leftAddressView.addSubview(addressIcon)
        leftAddressView.addSubview(addressLabel)
        
        backView.addSubview(nameLabel)
        backView.addSubview(starView)
        backView.addSubview(pointLabel)
        backView.addSubview(amountLabel)
        backView.addSubview(yxIcon)
//        backView.addSubview(amountLabel)

        
        
    }
    
    func fillInfo() {
        
    }
    

}
