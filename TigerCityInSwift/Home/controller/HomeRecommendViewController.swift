//
//  HomeRecommendViewController.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/8.
//

import UIKit
import JXSegmentedView

class HomeRecommendViewController: UIViewController, JXSegmentedListContainerViewListDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var list = NSMutableArray()

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath)
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
    }
    

  

}
