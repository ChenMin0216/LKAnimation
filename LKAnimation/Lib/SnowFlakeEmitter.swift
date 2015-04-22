//
//  SnowFlakeEmitter.swift
//  99-Dazzle_animation
//
//  Created by liukun on 15/4/22.
//  Copyright (c) 2015年 liukun. All rights reserved.
//

import UIKit

class SnowFlakeEmitter: CAEmitterLayer {
    override init!() {
        super.init()
        config()
    }
    
    override init!(layer: AnyObject!) {
        super.init(layer: layer)
        config()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
    }
}

extension SnowFlakeEmitter {
    private func config() {
        emitterPosition = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2.0, -10)
        emitterSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width * 2.0, 0.0)
        emitterMode = kCAEmitterLayerOutline
        emitterShape = kCAEmitterLayerLine
        
        var snowFlake = CAEmitterCell()
        snowFlake.birthRate = 6.0
        snowFlake.lifetime = 120.0
        
        snowFlake.velocity = -100;
        snowFlake.velocityRange = 30
        snowFlake.yAcceleration = 30
        snowFlake.emissionRange = CGFloat(0.5 * M_PI)
        snowFlake.spinRange = CGFloat(0.25 * M_PI)
        
        snowFlake.contents = UIImage(named: "DazFlake")?.CGImage
        snowFlake.color = UIColor(red: 0.600, green: 0.658, blue: 0.743, alpha: 1.00).CGColor
        
        shadowOpacity = 1.0
        shadowRadius = 0.0
        shadowOffset = CGSizeMake(0.0, 1.0)
        shadowColor = UIColor.whiteColor().CGColor
        
        emitterCells = NSArray(array: [snowFlake]) as [AnyObject]
    }
}