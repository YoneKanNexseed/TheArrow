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
        switchGestureEnabled(isEnabled: false)
        displayArrows()
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
            correct()
        } else {
            print("up不正解")
            miss()
        }
    }
    
    @IBAction func down(_ sender: UISwipeGestureRecognizer) {
        if arrowArray[index].direction == ArrowConst.down {
            correct()
        } else {
            print("down不正解")
            miss()
        }
    }
    
    @IBAction func right(_ sender: UISwipeGestureRecognizer) {
        if arrowArray[index].direction == ArrowConst.right {
            correct()
        } else {
            print("right不正解")
            miss()
        }
    }
    
    @IBAction func left(_ sender: UISwipeGestureRecognizer) {
        if arrowArray[index].direction == ArrowConst.left {
            correct()
        } else {
            print("left不正解")
            miss()
        }
    }
    
    func answer() -> Void {
        switchGestureEnabled(isEnabled: true)
    }

    func correct() -> Void {
        print("正解\(index)")
        index += 1
        if arrowArray.count <= index {
            levelClear()
        }
    }
    
    func levelClear() -> Void {
        switchGestureEnabled(isEnabled: false)
        // レベルアップ
        level += 1
        
        // indexの初期化
        index = 0
        
        arrowArray.removeAll()
        
        arrowArray = ArrowFactory.createRundomArrowArray(level: level)
        displayArrows()
    }
    
    func miss() -> Void {
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "result")
        //ここが実際に移動するコードとなります
        self.present(second, animated: false, completion: nil)
    }
}
