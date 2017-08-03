//
//  RoundModel.swift
//  仿知乎网页版首页
//
//  Created by liht on 2017/8/2.
//  Copyright © 2017年 linitial. All rights reserved.
//

import UIKit

class FZHRoundModel: NSObject {
    let kScreenHeight = UIScreen.main.bounds.size.height
    let kScreenWidth = UIScreen.main.bounds.size.width
    // 颜色
    var color: UIColor = UIColor(red: CGFloat(arc4random() % 256)/255.0, green:CGFloat(arc4random() % 256)/255.0, blue:CGFloat(arc4random() % 256)/255.0, alpha: 1)
    // 半径
    var r: CGFloat = 0.0

    // x和y坐标
    var x: CGFloat = 0.0

    var y: CGFloat = 0.0

    // x和y坐标移动速度
    var x_speed: CGFloat = 0.0

    var y_speed: CGFloat = 0.0


    
}


