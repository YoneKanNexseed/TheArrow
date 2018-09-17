//
//  ArrowFactory.swift
//  TheArrow
//
//  Created by yonekan on 2018/09/16.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit
import Foundation

class ArrowFactory {
    
    static private let directionNum = 4
    
    static func create(direction: String)-> Arrow {
        switch direction {
            
            case ArrowConst.up:
                return Arrow(image: UIImage(named: "up")!, direction: ArrowConst.up)
            
            case ArrowConst.down:
                return Arrow(image: UIImage(named: "down")!, direction: ArrowConst.down)
            
            case ArrowConst.right:
                return Arrow(image: UIImage(named: "right")!, direction: ArrowConst.right)
            
            case ArrowConst.left:
                return Arrow(image: UIImage(named: "left")!, direction: ArrowConst.left)
            
            default:
                // TODO エラーのスローの仕方調査
                return Arrow(image: UIImage(named: "up")!, direction: ArrowConst.up)
        }
    }
    
    static func createRundom()->Arrow {
        
        let random:Int = Int(arc4random_uniform(UInt32(directionNum))) + 1
        
        switch random {
            
            case 1:
                return Arrow(image: UIImage(named: "up")!, direction: ArrowConst.up)
            
            case 2:
                return Arrow(image: UIImage(named: "down")!, direction: ArrowConst.down)
            
            case 3:
                return Arrow(image: UIImage(named: "right")!, direction: ArrowConst.right)
            
            case 4:
                return Arrow(image: UIImage(named: "left")!, direction: ArrowConst.left)
            
            default:
                // TODO エラーのスローの仕方調査
                return Arrow(image: UIImage(named: "up")!, direction: ArrowConst.up)
        }
    }
}
