//
//  CarouselView.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/28.
//

import UIKit
import SnapKit
import Foundation
import Kingfisher


protocol CarouselDelegate: AnyObject {
    func carouselView(_ carouselView: CarouselView, didScrollToIndex index:Int)
    func carouselView(carouselView: CarouselView, disSelectIndex index: Int)
}

class CarouselView: UIView, UIScrollViewDelegate {

    weak open var delegate: CarouselDelegate? // default nil. weak reference

    var viewList = NSMutableArray()
    var buttonList = NSMutableArray()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRectZero)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()
    
    var contentList: [[String: String]]? {
        didSet {
            if contentList!.count > 0 {
                loadUI()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        
        if contentList?.count == 0 {
            return
        }
        
        if scrollView.superview == nil {
            self.addSubview(scrollView)
            scrollView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        buttonList.enumerateObjects { obj, idx, stop in
            let view = obj as! UIView
            view.removeFromSuperview()
        }
        
        buttonList.removeAllObjects()
        
        
        for num in contentList!.enumerated() {
            let item = num.element
            let urlStr = item["url"]
            let type = item["type"]
            let index = num.offset
            if type == "video" {
                let videoView = VideoView(frame: CGRectZero)
                videoView.videoUrl = urlStr
                scrollView.addSubview(videoView)
//                videoView.snp.makeConstraints { make in
//                    make.top.bottom.equalToSuperview()
//                    make.left.equalToSuperview().offset(screen_width * Double(index))
//                    make.width.equalTo(screen_width)
//                }
                videoView.frame = CGRect(x: screen_width * Double(index), y: 0, width: self.width, height: self.height)

                viewList.add(videoView)
            } else {
                let imageView = AnimatedImageView()
                imageView.kf.setImage(with: URL(string: urlStr))
                scrollView.addSubview(imageView)
                imageView.frame = CGRect(x: screen_width * Double(index), y: 0, width: self.width, height: self.height)
//                imageView.snp.makeConstraints { make in
//                    make.top.equalToSuperview()
//                    make.bottom.equalToSuperview()
//                    make.left.equalToSuperview().offset(screen_width * Double(index))
//                    make.width.equalTo(screen_width)
//                }
                viewList.add(imageView)

            }
            
            let button = UIButton(type: .custom)
            button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
            scrollView.addSubview(button)
//            button.snp.makeConstraints { make in
//                make.top.equalToSuperview()
//                make.bottom.equalToSuperview()
//                make.left.equalToSuperview().offset(screen_width * Double(index))
//                make.width.equalTo(screen_width)
//            }
            button.frame = CGRect(x: screen_width * Double(index), y: 0, width: self.width, height: self.height)

            buttonList.add(button)
        }
        
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let item = contentList![sender.tag - 1000]
        if item["type"] == "video" {
            
        }
    }

}
