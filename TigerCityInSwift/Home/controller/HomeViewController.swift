//
//  HomeViewController.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/6.
//

import UIKit
import SnapKit
import JXSegmentedView

class HomeViewController: UIViewController, JXSegmentedListContainerViewDataSource {
    
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return 2
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        switch index {
        case 0:
            return HomeRecommendViewController.init()
            
        case 1:
            return HomeBrandListController.init()
            
        default:
            return HomeRecommendViewController.init()

        }
    }
    

    lazy var navView: HomeNavigationView = {
        let navView = HomeNavigationView(frame: CGRectZero)
        
        return navView
    }()
    
    lazy var listContainerView: JXSegmentedListContainerView = {
        let containerView = JXSegmentedListContainerView(dataSource: self)
        return containerView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "首页111"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
        self.setupUI()
    }
    
    
    func setupUI() {
        self.view.addSubview(navView)
        self.view.addSubview(listContainerView)
        navView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        listContainerView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().offset(0)
            make.top.equalTo(navView.snp.bottom).offset(0)
        }
        
//        navView.titlesDataSource = 
        navView.listContainer = listContainerView
    }

    @objc func buttonPressed() {
        self.navigationController?.pushViewController(CartViewController.init(), animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
