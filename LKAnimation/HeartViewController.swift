//
//  HeartViewController.swift
//  LKAnimation
//
//  Created by liukun on 15/4/22.
//  Copyright (c) 2015年 liukun. All rights reserved.
//

import UIKit

class HeartViewController: UIViewController {

    var heartEmitter: HeartEmitter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var heartEmitter = HeartEmitter()
        self.heartEmitter = heartEmitter
        self.view.layer.addSublayer(heartEmitter)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.heartEmitter.removeFromSuperlayer()
        self.heartEmitter = nil
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.heartEmitter.emitterWithPosition((touches.first as! UITouch).locationInView(self.view))
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.heartEmitter.emitterWithPosition((touches.first as! UITouch).locationInView(self.view))
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.heartEmitter.emitterWithPosition((touches.first as! UITouch).locationInView(self.view))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
