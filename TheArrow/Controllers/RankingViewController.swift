//
//  RankingViewController.swift
//  TheArrow
//
//  Created by yonekan on 2018/09/19.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit
import FirebaseFirestore

class TimeAttackRankingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RankingViewController")
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
    }

}

extension TimeAttackRankingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = indexPath.row.description
        
        return cell
    }
}
