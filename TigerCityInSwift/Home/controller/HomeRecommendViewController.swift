//
//  HomeRecommendViewController.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/8.
//

import UIKit
import JXSegmentedView
import ObjectMapper

class HomeRecommendViewController: UIViewController, JXSegmentedListContainerViewListDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var list = NSMutableArray()
    var configure: ModuleConfigResult?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        cell.model = list[indexPath.row] as! ProductModel
        return cell
    }

    
    func listView() -> UIView {
        return self.view
    }
    

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCell")
        
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
                let value = try response.mapString()
                self.configure = ModuleConfigResult(JSONString: value)
//                self.tableView.reloadData()
                print(value)
            } catch {
                let printableError = error as CustomStringConvertible
//                self.showAlert("GitHub Fetch", message: printableError.description)
            }
        }
    }
  

}
