//
//  TimeAttackRankingViewController.swift
//  TheArrow
//
//  Created by yonekan on 2018/09/20.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit
import FirebaseFirestore

class TimeAttackRankingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
        db.collection("rankings").document("timeAttack").collection("ranking").addDocument(data: [
            "name": "test tarou",
        ])
    }

}
