//
//  HomeReusableView.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/10/8.
//

import UIKit

class HomeReusableView: UICollectionReusableView {
    
    var contentList: [ModuleItem]? {
        
        didSet {
            setupUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        
        var top = 0.0
        
        if let list = contentList {
            for item in list {
                top += designSize(item.topMargin!) / 2.0
                
                let view = ModuleView(moduleData: item)
                view.frame = CGRect(x: 0, y: top, width: view.width, height: view.height)
                self.addSubview(view)
                top += view.height
            }
        }
        self.frame = CGRect(x: 0, y: 0, width: screen_width, height: top)
        
        print(self.frame)
    }
}
