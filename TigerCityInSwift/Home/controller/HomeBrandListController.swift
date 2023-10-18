//
//  HomeBrandListController.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/8.
//

import UIKit
import JXSegmentedView
import Alamofire
import Moya
import MJRefresh

class HomeBrandListController: BaseViewController, JXSegmentedListContainerViewListDelegate, UITableViewDelegate, UITableViewDataSource, JXSegmentedViewDelegate {
    
    var page = 1
    var list = [StoreModel]()
    var province: DistrictModel?
    var city: DistrictModel?
    var orders = ["COMPOSITE", "SCORE_DESC", "SALE_DESC"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreCell
        cell.store = list[indexPath.section]
        return cell
    }
    
    func listView() -> UIView {
        return self.view
    }
    
    func listWillAppear() {
        if self.list.count == 0 {
            self.requestList()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.page = 1
            self.requestList()
        })
        
        tableView.mj_footer = MJRefreshFooter(refreshingBlock: {
            self.page += 1
            self.requestList()
        })
        
        
    }
    
    override func setupUI() {
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func selectedMajorCategory() -> String {
        return ""
    }
    
    func selectedDataParam() -> String {
        return ""

    }
    
    func selectedTag() -> String {
        return ""
    }

    func requestList() {
        tigerCityProvider.request(.homeMall(pageNum: gPageSize, page: page, province: province?.regionName ?? "", city: city?.regionName ?? "", majorCategory: self.selectedMajorCategory(), dataParams: self.selectedDataParam(), order: orders[0], tags: self.selectedTag())) { result in
            
            do {
                let response = try result.get()
                let baseResponse = BaseResponse(response)
                let data = baseResponse.data as! NSDictionary
            } catch {
                let printableError = error as CustomStringConvertible
                self.view.makeToast(printableError.description)

            }
            
//            let configData = data.value(forKey: "moduleConfig")
//            if configData != nil {
//                self.configure = ModuleConfigData(JSON: configData as! [String : Any])
//            }

        }
    }
    
    lazy var segmentedView: JXSegmentedView = {
        let segmentedView = JXSegmentedView()
        
        segmentedView.delegate = self
        return segmentedView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

}
