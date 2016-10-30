//
//  YZMainTabbarVC.swift
//  huacaizhibo
//
//  Created by mac on 2016/10/29.
//  Copyright © 2016年 julia. All rights reserved.
//

import UIKit

class YZMainTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        addChildVC(name: "Home")
        addChildVC(name: "Live")
        addChildVC(name: "Follow")
        addChildVC(name: "Profile")
        
        
    }
    

    private func addChildVC(name : String)->(){
        
        
        let childVc = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        
        addChildViewController(childVc)
        
        
    }
    

}
