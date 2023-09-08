//
//  HomeNavigationView.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/7.
//

import UIKit
import JXSegmentedView

class HomeNavigationView: UIView, JXSegmentedViewDelegate {

    var titlesDataSource: JXSegmentedTitleDataSource!
    
    lazy var label1: UILabel = {
        let label = UILabel.init()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.text = "TONGJI"
        return label
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "童集岛"
        return label
    }()
    
    lazy var segmentedView: JXSegmentedView = {
        let segmentedView = JXSegmentedView()
        
        titlesDataSource = JXSegmentedTitleDataSource()
        titlesDataSource.titles = ["推荐", "品牌商"]
        segmentedView.dataSource = titlesDataSource
        segmentedView.delegate = self
        return segmentedView
    }()

    func setupUI() {
        self.backgroundColor = UIColor.white
        self.addSubview(label1)
        self.addSubview(label2)
        self.addSubview(segmentedView)
        
        label1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.centerY.equalTo(segmentedView)
        }
        
        label2.snp.makeConstraints { make in
            make.left.equalTo(label1.snp.right).offset(6)
            make.centerY.equalTo(segmentedView)
        }
        
        segmentedView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.width.equalTo(120)
            make.height.equalTo(44)
            make.top.equalToSuperview().offset(20 + safeAreaInsets.top)
            make.bottom.equalToSuperview()
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("111")
    }
        
    var titles: NSArray {
        get {
            return self.titles
        }
        set {
            self.titles = newValue
        }
    }
    
    var listContainer: JXSegmentedViewListContainer {
        get {
            return self.listContainer
        }
        set {
            self.listContainer = newValue
            segmentedView.reloadData()
        }
    }
    
}
