//
//  HomeRecommendViewController.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/8.
//

import UIKit
import JXSegmentedView
import ObjectMapper
import Toast_Swift
import MJRefresh

class HomeRecommendViewController: BaseViewController, JXSegmentedListContainerViewListDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var list = [ProductModel]()
    var configure: ModuleConfigData?
    var page = 1
    var productSummary: ProductListSummary?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        cell.model = list[indexPath.row]
        cell.setShowRightLine(show: indexPath.row % 2 == 0)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screen_width / 2.0, height: designSize(330))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeReusableView", for: indexPath) as! HomeReusableView
            headerView.contentList = configure?.modules
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        var top = 0.0
        if let list = configure?.modules {
            for moduleData in list {
                top += designSize(moduleData.topMargin!) / 2.0
                let height = screen_width * (moduleData.height)! / (moduleData.width)!
                top += height
            }
            print(top)
        }
        return CGSize(width: screen_width, height: top)

    }
    

    
    func listView() -> UIView {
        return self.view
    }
    

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HomeReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeReusableView")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.page = 1
            self.requestList()
        })
        
        collectionView.mj_footer = MJRefreshFooter(refreshingBlock: {
            self.page += 1
            self.requestList()
        })
        
        self.requestConfigureData()
    }
    
    override func setupUI() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(designSize(10))
        }
    }
    
    func requestConfigureData() {
        
        tigerCityProvider.request(.homeConfigure) { result in
            
            do {
                let response = try result.get()
                let baseResponse = BaseResponse(response)
                let data = baseResponse.data as! NSDictionary
                let configData = data.value(forKey: "moduleConfig")
                if configData != nil {
                    self.configure = ModuleConfigData(JSON: configData as! [String : Any])
                }
                self.requestList()
            } catch {
                let printableError = error as CustomStringConvertible
                self.view.makeToast(printableError.description)//                self.showAlert("GitHub Fetch", message: printableError.description)
            }
        }
    }
    
    func requestList() {
        tigerCityProvider.request(.productList(url: configure?.dataView?.serviceUrl ?? "", page: page, pageNum: gPageSize)) { result in
            
            if self.page == 1 {
                self.collectionView.mj_header?.endRefreshing()
            } else {
                self.collectionView.mj_footer?.endRefreshing()
            }

            do {
                let response = try result.get()
                let baseResponse = BaseResponse(response)
                self.productSummary = ProductListSummary(JSON: baseResponse.data as! [String : Any])
                
                if self.page > 1 {
                    self.list += (self.productSummary?.items)!
                } else {
                    self.list = (self.productSummary?.items)!
                }
                
                self.collectionView.reloadData()
                
            } catch {
                
            }
        }
    }
}
