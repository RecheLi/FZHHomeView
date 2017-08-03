//
//  ViewController.swift
//  仿知乎网页版首页
//
//  Created by liht on 2017/8/2.
//  Copyright © 2017年 linitial. All rights reserved.
//

import UIKit
let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
class ViewController: UIViewController {
    var data:Array<FZHRoundModel> = []
    var homeView: FZHHomeView!
    var display: CADisplayLink!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addData()
        homeView = FZHHomeView()
        homeView.frame = self.view.bounds
        homeView.backgroundColor = UIColor(red: 248/255.0 , green: 247/255.0, blue: 245/255.0 , alpha: 1)
        homeView.points = data;
        self.view.addSubview(homeView)
        
        display = CADisplayLink(target: self, selector: #selector(ViewController.refreshData))
        display.preferredFramesPerSecond = 61
        display.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
    }
    func refreshData() {
        for model in data {
            model.x += model.x_speed
            if model.x>kScreenWidth-model.r {
                model.x = model.r
            } else if model.x<model.r {
                model.x = kScreenWidth-model.r
            }
            model.y += model.y_speed
            if model.y>kScreenHeight-model.r {
                model.y = model.r
            } else if model.y<model.r {
                model.y = kScreenWidth-model.r
            }
        }
        homeView.points = data;
    }
    func addData() {
        for _ in 1...15 {
            let model = FZHRoundModel()
            model.r = self.randomNumber(min: 5, max: 10)
            model.x = self.randomNumber(min: 0, max: kScreenWidth-model.r)
            model.y = self.randomNumber(min: 0, max: kScreenHeight-model.r)
            model.x_speed = self.randomNumber(min: -1.25, max: -0.75); // 每次移动距离 -0.25 ～ 0.25
            model.y_speed = model.x_speed;
            data.append(model)
        }
    }

    func randomNumber(min: CGFloat, max: CGFloat) -> CGFloat {
        let ratio = Double.random(lower:0.0, 1.0)
        print(ratio)
        return ((max-min) * CGFloat(ratio) + min + 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

public extension Double {
    /// SwiftRandom extension
    public static func random(lower: Double = 0, _ upper: Double = 100) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

