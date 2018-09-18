//
//  MemoryAttackViewController.swift
//  TheArrow
//
//  Created by yonekan on 2018/09/17.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

class MemoryAttackViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var arrowArray = [Arrow]()
    
    var level = 3   // レベルを管理
    
    var index = 0
    
    @IBOutlet var upGestureRecognizer: UISwipeGestureRecognizer!
    
    @IBOutlet var downGestureRecognizer: UISwipeGestureRecognizer!
    
    @IBOutlet var rightGestureRecognizer: UISwipeGestureRecognizer!
    
    @IBOutlet var leftGestureRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrowArray = ArrowFactory.createRundomArrowArray(level: level)
        displayArrows()
        switchGestureEnabled(isEnabled: false)
    }
    
    func displayArrows() -> Void {
        var index = 0
        //timer処理
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (timer) in
            self.imageView.isHidden = false
            if self.arrowArray.count - 1 < index {
                timer.invalidate()
                self.imageView.isHidden = true
                self.answer()
                return
            }
            self.imageView.image = self.arrowArray[index].image
            index += 1
        })
    }
    
    func switchGestureEnabled(isEnabled: Bool) -> Void {
        upGestureRecognizer.isEnabled = isEnabled
        downGestureRecognizer.isEnabled = isEnabled
        rightGestureRecognizer.isEnabled = isEnabled
        leftGestureRecognizer.isEnabled = isEnabled
    }
    
    
    @IBAction func up(_ sender: UISwipeGestureRecognizer) {
        if arrowArray[index].direction == ArrowConst.up {
            print("up正解")
            index += 1
        } else {
            print("up不正解")
        }
    }
    
    @IBAction func down(_ sender: UISwipeGestureRecognizer) {
        if arrowArray[index].direction == ArrowConst.down {
            print("down正解")
            index += 1
        } else {
            print("down不正解")
        }
    }
    
    @IBAction func right(_ sender: UISwipeGestureRecognizer) {
        if arrowArray[index].direction == ArrowConst.right {
            print("right正解")
            index += 1
        } else {
            print("right不正解")
        }
    }
    
    @IBAction func left(_ sender: UISwipeGestureRecognizer) {
        if arrowArray[index].direction == ArrowConst.left {
            print("left正解")
            index += 1
        } else {
            print("left不正解")
        }
    }
    
    func answer() -> Void {
        switchGestureEnabled(isEnabled: true)
    }

}
