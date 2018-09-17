//
//  CountDownViewController.swift
//  TheArrow
//
//  Created by yonekan on 2018/09/17.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {

    @IBOutlet weak var countDownLabel: UILabel!
    
    var timer = Timer()
    var count = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
    }
    
    //タイマーの作成
    func createTimer(){
        
        let timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(self.timerAction(sender:)),
                                         userInfo: nil,
                                         repeats: true)
        timer.fire()
        
    }
    
    //タイマーの処理
    @objc func timerAction(sender:Timer){
        
        countDownLabel.text = String(count)
        if count == 0 {
            sender.invalidate() //止める
            performSegue(withIdentifier: "timeAttack", sender: nil)
        }
        count -= 1
    }

}
