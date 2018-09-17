//
//  TimeAttackViewController.swift
//  TheArrow
//
//  Created by yonekan on 2018/09/17.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

class TimeAttackViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var arrow: Arrow!
    var timer = Timer()
    var startTime = Date()     // Startボタンを押した時刻
    var elapsedTime: Double = 0.0       // Stopボタンを押した時点で経過していた時間
    var time : Double = 0.0             // ラベルに表示する時間
    
    var correctCount = 0
    
    @IBAction func up(_ sender: UISwipeGestureRecognizer) {
        if arrow.direction == ArrowConst.up {
            print("up正解")
            switchArrow()
            correct()
        } else {
            print("不正解")
        }
    }
    
    @IBAction func down(_ sender: UISwipeGestureRecognizer) {
        if arrow.direction == ArrowConst.down {
            print("down正解")
            switchArrow()
            correct()
        } else {
            print("不正解")
        }
    }
    
    @IBAction func right(_ sender: UISwipeGestureRecognizer) {
        if arrow.direction == ArrowConst.right {
            print("right正解")
            switchArrow()
            correct()
        } else {
            print("不正解")
        }
    }
    
    @IBAction func left(_ sender: UISwipeGestureRecognizer) {
        if arrow.direction == ArrowConst.left {
            print("down正解")
            switchArrow()
            correct()
        } else {
            print("不正解")
        }
    }
    
    func switchArrow() -> Void {
        arrow = ArrowFactory.createRundom()
        image.image = UIImage(named: arrow.direction)
    }
    
    func startTimer() -> Void {
        timer = Timer.scheduledTimer(timeInterval: 0.00001, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        
        // タイマー開始からのインターバル時間
        let currentTime = Date().timeIntervalSince(startTime)
        
        // fmod() 余りを計算
        let minute = (Int)(fmod((currentTime/60), 60))
        // currentTime/60 の余り
        let second = (Int)(fmod(currentTime, 60))
        // floor 切り捨て、小数点以下を取り出して *100
        let msec = (Int)((currentTime - floor(currentTime))*100000)
        
        let displayStr = NSString(format: "%02d:%02d.%05d", minute, second, msec) as String
        timerLabel.text = displayStr
        
    }
    
    func correct() -> Void {
        correctCount += 1
        if correctCount > 10 {
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchArrow()
        startTimer()
    }
}
