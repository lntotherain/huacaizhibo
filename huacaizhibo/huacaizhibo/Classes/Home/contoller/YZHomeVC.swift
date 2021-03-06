//
//  YZHomeVC.swift
//  huacaizhibo
//
//  Created by mac on 2016/10/29.
//  Copyright © 2016年 julia. All rights reserved.
//

import UIKit
/*
 1.封装pageTitleView
 2.封装collectionView
 3.处理pageTitleView和collectionView滚动交互逻辑
 */
private let kPageTitlesViewH : CGFloat = 40

class YZHomeVC: UIViewController {

    lazy var pageTitlesView : YZPageTitleView = {
        
        let pageFrame  =  CGRect(x: 0, y: kNavigationBarH+kStatusBarH, width: kscreenW, height: kPageTitlesViewH)
        let pageTitles  =  ["推荐","游戏","娱乐","趣玩"]
        let pageTitlesView = YZPageTitleView(frame: pageFrame, titles: pageTitles)
//        pageTitlesView.backgroundColor = UIColor.purple
        return pageTitlesView
    }()
    lazy var pageContentView : YZPageContentView = {
        
        let contentH = kscreenH-kStatusBarH-kNavigationBarH-kPageTitlesViewH
        let contentFrame  = CGRect(x: 0, y: kStatusBarH+kNavigationBarH+kPageTitlesViewH, width: kscreenW, height: contentH)
        var childVCs = [UIViewController]()
        for _ in 0...3{
            let vc = UIViewController()
//           vc.view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)/255), green: CGFloat(arc4random_uniform(255)/255), blue: CGFloat(arc4random_uniform(255)/255), alpha: 1)
            vc.view.backgroundColor = UIColor.green
            childVCs.append(vc)
        }
        
        
        let pageContentView = YZPageContentView(frame: contentFrame, childVCs: childVCs, parentVC: self)
        return pageContentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      setUpUI()
        
    }


}

// MARK: - 扩展
extension YZHomeVC {
  
    
   
    /// 设置UI相关
    func setUpUI() -> () {
        
        automaticallyAdjustsScrollViewInsets = false
        
        setUpNavigationItem()
        
        view.addSubview(pageTitlesView)
        
        view.addSubview(pageContentView)
//        pageContentView.backgroundColor = UIColor.blue
        
    }
    
    func setUpNavigationItem(){
        //设置左侧item
        let btn  = UIButton()
        let imgLeft = UIImage(named: "logo")
        btn.setImage(imgLeft, for: .normal)
        btn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
       
        
        // MARK: 设置右侧items
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


