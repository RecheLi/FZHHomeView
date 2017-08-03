//
//  FZHHomeView.swift
//  仿知乎网页版首页
//
//  Created by liht on 2017/8/2.
//  Copyright © 2017年 linitial. All rights reserved.
//

import UIKit

class FZHHomeView: UIView {
    var points: Array<FZHRoundModel>? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.sublayers = nil;
        let context = UIGraphicsGetCurrentContext()
        for index in 0...((points?.count)!-1) {
            let model = points?[index]
            for index2 in 0...((points?.count)!-1) {
                if index+index2<(points?.count)! {
                    let model2 = points?[index+index2]
                    let lineOpacity = 0.1
                    model?.color.withAlphaComponent(CGFloat(lineOpacity)).set()
                    // 画线(线的颜色以最后颜色为准)
                    context?.move(to: CGPoint(x: (model?.x)!, y: (model?.y)!))
                    context?.addLine(to: CGPoint(x: (model2?.x)!, y: (model2?.y)!))
                }
            }
            // 画圆
            let circle = CAShapeLayer()
            circle.frame = CGRect(x: (model?.x)!-(model?.r)!/2, y: (model?.y)!-(model?.r)!/2, width: (model?.r)!, height: (model?.r)!)
            circle.backgroundColor = model?.color.cgColor
            circle.cornerRadius = (model?.r)!/2.0
            circle.masksToBounds = true
            self.layer.addSublayer(circle)
        }
        context?.strokePath()
     }
}
