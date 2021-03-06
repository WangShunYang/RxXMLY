//
//  HCSearchNavBar.swift
//  RxXMLY
//
//  Created by sessionCh on 2017/12/16.
//  Copyright © 2017年 sessionCh. All rights reserved.
//

import UIKit

// MARK:- 常量
fileprivate struct Metric {
        
    static let homeBarWidth: CGFloat = kScreenW
    static let homeBarHeight: CGFloat = 44.0
}

class HCSearchNavBar: UIView {
    
    typealias AddBlock = (_ model: HCNavBarItemModel)->Void;
    var itemClicked: AddBlock? = { (_) in
        return
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initSearchNavBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 此处必须指定一个大小
        self.snp.makeConstraints { (make) in
            make.width.equalTo(Metric.homeBarWidth)
            make.height.equalTo(Metric.homeBarHeight)
        }
    }
}

extension HCSearchNavBar: HCSearchControllerable {
    
    // MARK:- 初始化 首页 导航栏组件
    func initSearchNavBar() {
        
        // 搜索栏
        let searchBar = self.searchBar(model: HCNavBarItemMetric.homeSearchBar) { (model) in
            
            self.itemClicked!(model)
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}


