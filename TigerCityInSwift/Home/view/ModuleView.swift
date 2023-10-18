//
//  ModuleView.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/10/10.
//

import UIKit
import Kingfisher
import SwifterSwift

class ModuleView: UIView, CarouselDelegate {

    var moduleData: ModuleItem?
    
    init(moduleData: ModuleItem? = nil) {
        super.init(frame: CGRect.zero)
        self.moduleData = moduleData
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildView() {
        
        switch moduleData?.type {
        case kModuleTypeTopBanner:
            
            let height = (moduleData?.height)! * screen_width / (moduleData?.width)!
            let carouselView = CarouselView(frame: CGRect(x: 0, y: 0, width: screen_width, height: height))
            carouselView.delegate = self
            let list = NSMutableArray()
            moduleData?.dataModule?.forEach({ module in
                list.add(["type": module.type, "url": module.picUrl])
            })
            carouselView.contentList = list as? [[String : String]]
            self.addSubview(carouselView)
            self.frame = carouselView.frame
                
        case kModuleTypeColPic:
            let width = screen_width / CGFloat(moduleData!.columnCount)
            let height = screen_width * (moduleData?.height)! / (moduleData?.width)!
            var left = 0.0
            if let modules = moduleData?.dataModule {
                for (index, item) in modules.enumerated() {
                    let button = UIButton(type: .custom)
                    button.tag = 1000 + index
                    button.adjustsImageWhenHighlighted = false
                    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
                    self.addSubview(button)
                    
                    let animatedImageView = AnimatedImageView()
                    animatedImageView.kf.setImage(with: URL(string: item.picUrl))
                    self.addSubview(animatedImageView)
                    
                    button.frame = CGRect(x: left, y: 0, width: width, height: height)
                    animatedImageView.frame = button.frame
                    left += width
                }
            }
            self.frame = CGRect(x: 0, y: 0, width: width, height: height)
            
        case kModuleTypeActiveCategory:
            
            let width = designSize(112);
            let height = designSize(118);
            let left = designSize(16);
            let scrollView = UIScrollView(frame: CGRect(x: 0, y: designSize(14), width: screen_width, height: height * 2));
            scrollView.showsHorizontalScrollIndicator = false;
            
            if let list = moduleData?.dataModule {
                for (index, item) in list.enumerated() {
                    let animatedImageView = AnimatedImageView(frame: CGRect(x: left + width * CGFloat((index % 4)), y: height * CGFloat((index / 4)), width: width, height: height))
                    animatedImageView.kf.setImage(with: URL(string: item.picUrl))
                    scrollView.addSubview(animatedImageView)
                    
                    let button = UIButton(type: .custom)
                    button.tag = 1000 + index
                    button.adjustsImageWhenHighlighted = false
                    button.frame = animatedImageView.frame
                    button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
                    scrollView.addSubview(button)
                    
                    let topLine = UIView(frame: CGRect(origin: button.frame.origin, size: CGSize(width: button.width, height: designSize(1))))
                    topLine.backgroundColor = Basic.color.colorWithHex(0xF3F3F3)
                    scrollView.addSubview(topLine)
                    
                    let leftLine = UIView(frame: CGRect(origin: button.frame.origin, size: CGSize(width: designSize(1), height: button.height)))
                    leftLine.backgroundColor = Basic.color.colorWithHex(0xF3F3F3)
                    scrollView.addSubview(leftLine)


                    if (index + 1) % 4 == 0 {
                        let rightLine = UIView(frame: CGRect(origin: CGPoint(x: button.x + button.width, y: button.y), size: CGSize(width: designSize(1), height: button.height)));
                        rightLine.backgroundColor = Basic.color.colorWithHex(0xF3F3F3)
                        scrollView.addSubview(rightLine)
                    }
                    
                    if index / 4 > 0 {
                        let bottomLine = UIView(frame: CGRect(x: button.x, y: button.y + button.height - designSize(1), width: button.width, height: designSize(1)))
                        bottomLine.backgroundColor = Basic.color.colorWithHex(0xF3F3F3)
                        scrollView.addSubview(bottomLine)
                    }
                }
                scrollView.contentSize = CGSize(width: width * 4 + designSize(32), height: 0)

            }
            self.addSubview(scrollView)
            self.frame = scrollView.frame;
            
        default:
            print("can not match kind of \(moduleData?.type ?? "nil")")
        }
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        
    }
    
    func carouselView(carouselView: CarouselView, disSelectIndex index: Int) {
        
    }
    
    func carouselView(_ carouselView: CarouselView, didScrollToIndex index: Int) {
        
    }
    
}
