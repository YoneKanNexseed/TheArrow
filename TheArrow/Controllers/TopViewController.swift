//
//  TopViewController.swift
//  TheArrow
//
//  Created by yonekan on 2018/09/17.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    
    @IBAction func selectTimeAttack(_ sender: UIButton) {
        performSegue(withIdentifier: "countDown", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
