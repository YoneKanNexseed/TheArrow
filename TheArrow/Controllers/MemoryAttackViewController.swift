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
    
    var level = 1
    
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrowArray = ArrowFactory.createRundomArrowArray(level: level)
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
                return
            }
            self.imageView.image = self.arrowArray[index].image
            print(self.arrowArray[index].direction)
            index += 1
//            self.imageView.isHidden = true
        })
        
    }
    
    func answer() -> Void {
        
    }

}
