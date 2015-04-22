//
//  HeartEmitter.swift
//  99-Dazzle_animation
//
//  Created by liukun on 15/4/22.
//  Copyright (c) 2015年 liukun. All rights reserved.
//

import UIKit

class HeartEmitter: CAEmitterLayer {
    
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
    
    func emitterWithPosition(point: CGPoint) {
        var heartsBurst = CABasicAnimation(keyPath: "emitterCells.heart.birthRate")
        heartsBurst.fromValue		= NSNumber(float: 100.0)
        heartsBurst.toValue			= NSNumber(float: 0.0)
        heartsBurst.duration		= 5.0;
        heartsBurst.timingFunction	= CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        self.emitterPosition = point
        
        self.addAnimation(heartsBurst, forKey: "heartsBurst")
    }
}

extension HeartEmitter {
    
    private func config() {
        emitterSize = CGSizeMake(20.0, 20.0)
        emitterMode = kCAEmitterLayerVolume
        emitterShape = kCAEmitterLayerRectangle
        renderMode = kCAEmitterLayerAdditive
        
        var heart = CAEmitterCell()
        heart.name = "heart"
        
        heart.emissionLongitude = CGFloat(M_PI / 2.0)
        // 发射方向的角度
        heart.emissionRange = CGFloat(M_PI * 2.0)
        heart.birthRate		= 0.0
        heart.lifetime		= 2.0
        
        // 速度
        heart.velocity = CGFloat((rand() % 200) - 100)
        // 速度范围
        heart.velocityRange = 60
        heart.yAcceleration = CGFloat((rand() % 20) - 10)
        
        heart.contents		= UIImage(named:"DazHeart")!.CGImage
        heart.color			= UIColor(red: 0.5, green: 0, blue: 0.5, alpha: 0.5).CGColor
        heart.redRange		= 0.3
        heart.blueRange		= 0.3
        heart.alphaSpeed	= -0.5 / heart.lifetime
        
        heart.scale			= 0.3
        heart.scaleSpeed	= 0.5
        heart.spinRange		= CGFloat(2.0 * M_PI)
        
        emitterCells = NSArray(array: [heart]) as [AnyObject]
    }
}
