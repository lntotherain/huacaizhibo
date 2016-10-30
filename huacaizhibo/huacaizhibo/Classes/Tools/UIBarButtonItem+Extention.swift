//
//  UIBarButtonItem+Extention.swift
//  huacaizhibo
//
//  Created by mac on 2016/10/29.
//  Copyright © 2016年 julia. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
  
   /* class func creatItem(imgname: String,highLightImgName: String, size:CGSize) -> UIBarButtonItem{
        
                let img = UIImage(named: imgname)
                let imgHighLight = UIImage(named: highLightImgName)
                let btn = UIButton()
                btn.frame = CGRect(origin: CGPoint.zero, size: size)
                btn.setImage(img, for: .normal)
                btn.setImage(imgHighLight, for: .highlighted)
        
                let barButtonItem = UIBarButtonItem(customView: btn)
        
                return barButtonItem
        
        
    }
    */
    //便利构造函数
    convenience init(imgname: String,highLightImgName: String = "", size:CGSize = CGSize.zero) {
        
        let img = UIImage(named: imgname)
        
        let btn = UIButton()
        
        btn.setImage(img, for: .normal)
        if highLightImgName != "" {
            
            let imgHighLight = UIImage(named: highLightImgName)
            
            btn.setImage(imgHighLight, for: .highlighted)
            
        }
        if size != CGSize.zero {
            
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView: btn)
        
        
    }
    
}
