//
//  HomeViewController.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/6.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "首页111"
        self.view.backgroundColor = UIColor.white
     
        self.setupUI()
    }
    
    
    func setupUI() {
        let button = UIButton.init(type: .custom)
        button.setTitle("跳转", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.view.addSubview(button)

        button.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(44)
            make.center.equalTo(self.view)
        }
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
