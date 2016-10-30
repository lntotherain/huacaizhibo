//
//  YZPageTitleView.swift
//  huacaizhibo
//
//  Created by mac on 2016/10/30.
//  Copyright © 2016年 julia. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 2

class YZPageTitleView: UIView {

    var titles : [String]
    lazy var titleLabels : [UILabel] = [UILabel]()
    lazy var scrollView : UIScrollView = {
        
        let scrollView  = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.isPagingEnabled = false
        scrollView.bounces  = false
        
        return scrollView
        
    }()
    lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        
        return scrollLine
        
    }()
    
    /*
    重写init方法\加载子控件
    */
    init(frame: CGRect,titles:[String]) {
        self.titles = titles
        
 
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    
}
//添加 scrollview
extension YZPageTitleView {
    
    
     func setupUI() {
        //添加scrollview
        scrollView.frame = bounds
        addSubview(scrollView)
        //添加labels
       setupTitleLabels()
        //添加底部线条和滚动滑块
        
        setupBottomLineAndScrollLine()
        
    }
    private func setupTitleLabels() {
        
        let labelW = frame.width / CGFloat(titles.count)
        let labelH = bounds.height - kScrollLineH
        let labelY : CGFloat = 0.0
        
        for (index,title) in titles.enumerated() {
            let label = UILabel()
            
            //设置属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            //设置宽高
            let labelX = CGFloat(index) * labelW
            
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
        
        
        
    }
    
    private func setupBottomLineAndScrollLine(){
       //1添加pageTitlesView的底部线条
        let bottomLine  = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH :CGFloat = 0.5
        
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        //2添加scrollview的滑块
        //2.1.获取第一个label
        
        guard let firstLabel = titleLabels.first else{return}
        firstLabel.textColor = UIColor.orange
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: (firstLabel.frame.origin.x), y: firstLabel.frame.size.height, width: firstLabel.frame.size.width, height: kScrollLineH)
        
    }
}
