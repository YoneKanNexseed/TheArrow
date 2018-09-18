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
        performSegue(withIdentifier: "countDown", sender: "timeAttack")
    }
    
    @IBAction func selectMemoryAttack(_ sender: UIButton) {
        performSegue(withIdentifier: "countDown", sender: "memoryAttack")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let countDownViewController = segue.destination as! CountDownViewController
        countDownViewController.withIdentifier = sender as! String
    }

}
