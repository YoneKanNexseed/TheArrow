//
//  MemoryAttackRankingViewController.swift
//  TheArrow
//
//  Created by yonekan on 2018/09/20.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit
import FirebaseFirestore

class MemoryAttackRankingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        
        db.collection("rankings").document("memoryAttack").collection("ranking").addDocument(data: [
            "name": "test tarou",
        ])
        
        db.collection("rankings").document("memoryAttack").collection("ranking").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let name = document.data()["name"]!
                    print(name)
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }

}
