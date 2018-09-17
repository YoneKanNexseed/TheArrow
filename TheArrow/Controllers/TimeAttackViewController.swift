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
    
    var arrow: Arrow!
    
    @IBAction func up(_ sender: UISwipeGestureRecognizer) {
        if arrow.direction == ArrowConst.up {
            print("up正解")
            switchArrow()
        } else {
            print("不正解")
        }
    }
    
    @IBAction func down(_ sender: UISwipeGestureRecognizer) {
        if arrow.direction == ArrowConst.down {
            print("down正解")
            switchArrow()
        } else {
            print("不正解")
        }
    }
    
    @IBAction func right(_ sender: UISwipeGestureRecognizer) {
        if arrow.direction == ArrowConst.right {
            print("right正解")
            switchArrow()
        } else {
            print("不正解")
        }
    }
    
    @IBAction func left(_ sender: UISwipeGestureRecognizer) {
        if arrow.direction == ArrowConst.left {
            print("down正解")
            switchArrow()
        } else {
            print("不正解")
        }
    }
    
    func switchArrow() -> Void {
        arrow = ArrowFactory.createRundom()
        image.image = UIImage(named: arrow.direction)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchArrow()
    }
}
