//
//  YZHomeVC.swift
//  huacaizhibo
//
//  Created by mac on 2016/10/29.
//  Copyright © 2016年 julia. All rights reserved.
//

import UIKit

class YZHomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      setUpUI()
        
        
    }
    
    
    
    

}

// MARK: - 扩展
extension YZHomeVC {
  
    
   
    /// 设置UI相关
    func setUpUI() -> () {
        setUpNavigationItem()
    }
    
    func setUpNavigationItem(){
        //设置左侧item
        let btn  = UIButton()
        let imgLeft = UIImage(named: "logo")
        btn.setImage(imgLeft, for: .normal)
        btn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
       
        
        //设置右侧items
        let historyItem = setUpRightItems(name: "image_my_history")
        let searchItem = setUpRightItems(name: "Image_scan")
        let qrItem = setUpRightItems(name: "btn_search")
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrItem]
//        UIBarButtonItem.init(imgname: "image_my_history", highLightImgName: "image_my_history_click", size: <#T##CGSize#>)
        
    }
    
    func setUpRightItems(name:String) -> ( UIBarButtonItem) {
        
        let size = CGSize(width: 40.0, height: 40.0)
        let img = UIImage(named: name)
        let imgHighLight = UIImage(named: name+"_click")
        let btn = UIButton()
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        btn.setImage(img, for: .normal)
        btn.setImage(imgHighLight, for: .highlighted)
        
        let barButtonItem = UIBarButtonItem(customView: btn)
        

        return barButtonItem
    }
    
}
