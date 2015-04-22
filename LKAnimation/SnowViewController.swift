//
//  SnowViewController.swift
//  LKAnimation
//
//  Created by liukun on 15/4/22.
//  Copyright (c) 2015年 liukun. All rights reserved.
//

import UIKit

class SnowViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建并添加自定义layer
        var snowEmitter = SnowFlakeEmitter()
        self.view.layer.insertSublayer(snowEmitter, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
