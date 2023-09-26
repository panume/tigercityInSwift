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

class HomeRecommendViewController: UIViewController, JXSegmentedListContainerViewListDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
//        list.addObjects(from: ["1", "2"])
//        collectionView.reloadData()
        
        self.requestConfigureData()
    }
    
    func requestConfigureData() {
        
        tigerCityProvider.request(.homeConfigure) { result in
            
            do {
                let response = try result.get()
                    
                let baseResponse = BaseResponse(response)
                
                
                
//                guard let vv = try response.mapJSON() as? NSDictionary  else {
//                    return
//                }
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
