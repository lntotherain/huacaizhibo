//
//  YZPageContentView.swift
//  huacaizhibo
//
//  Created by mac on 2016/10/30.
//  Copyright © 2016年 julia. All rights reserved.
//

import UIKit

fileprivate let cellID : String = "YZCell"

class YZPageContentView: UIView {

    var childVCs :[UIViewController]
    weak var parentVC : UIViewController?
    //懒加载collectionView
    lazy var collectionView : UICollectionView = {
        //1.创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        
        let collectionView  = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.scrollsToTop = false
        //设置数据源
        collectionView .dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        return collectionView
    }()
    
    
    /*
     自定义构造函数
    */
    init(frame: CGRect,childVCs:[UIViewController],parentVC: UIViewController) {
        self.childVCs = childVCs
        self.parentVC = parentVC
        
        super.init(frame: frame)
        
        setupUI()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
//设置UI
extension YZPageContentView {
    
    func setupUI() {
        //1.添加所有子控制器到父控制器中
        for childVC in self.childVCs{
            parentVC!.addChildViewController(childVC)
        }
        
        //2.用懒加载collectionView存放子控制器的view
        let collectionView = self.collectionView
        addSubview(collectionView)
        
        collectionView.frame = bounds
        
        //3.
        
    }
    
}

//设置collectionView的数据源
extension YZPageContentView:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        

        return childVCs.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
       //创建cell
        //给cell添加内容
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        //不是indexPath.row
        let childVc = childVCs[indexPath.item]
//        let label = UILabel()
//        label.text = "hahaha"
//        label.sizeToFit()
        childVc.view.frame = cell.contentView.bounds

        

        cell.contentView.addSubview(childVc.view)
        
        print(indexPath.item,cell.contentView.subviews.count)
        return cell
        
    }
    
}
