//
//  ResultViewController.swift
//  TheArrow
//
//  Created by yonekan on 2018/09/18.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit
import StoreKit

class ResultViewController: UIViewController {
    // SKStoreProductViewControllerを作成
    let storeProductViewController = SKStoreProductViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegateを設定
        storeProductViewController.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showAlert()
    }

    func showAlert() -> Void {
        let alert: UIAlertController = UIAlertController(title: "アラート表示", message: "保存してもいいですか？", preferredStyle:  UIAlertControllerStyle.alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{

            (action: UIAlertAction!) -> Void in
            print("OK")
//            self.showAppleStoreInApp()
//            self.showAlleStore()
            self.tweet()
        })

        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAppleStoreInApp() {
        print("showAppleStore")
        let parameters = [SKStoreProductParameterITunesItemIdentifier: 899247664]
        
        // アプリ情報をロードする
        storeProductViewController.loadProduct(withParameters: parameters) { status, error -> Void in
            if status {
                // SKStoreProductViewControllerを表示する
                self.present(self.storeProductViewController, animated: true, completion: nil)
            } else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func showAlleStore() -> Void {
        // TestFlightアプリのURL
        let url = URL(string: "https://itunes.apple.com/jp/app/apple-store/id899247664?mt=8")!
        
        // URLを開けるかをチェックする
        if UIApplication.shared.canOpenURL(url) {
            // URLを開く
            UIApplication.shared.open(url, options: [:]) { success in
                if success {
                    print("Launching \(url) was successful")
                }
            }
        }
    }
    
    func tweet() -> Void {
        // TestFlightアプリのURL
        let text = "あいうえお"
        var urlStr = "https://twitter.com/share?text=\(text)"
        urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!

        let url = URL(string: urlStr)!
        
        // URLを開けるかをチェックする
        if UIApplication.shared.canOpenURL(url) {
            // URLを開く
            UIApplication.shared.open(url, options: [:]) { success in
                if success {
                    print("Launching \(url) was successful")
                }
            }
        }
    }
}

extension ResultViewController: SKStoreProductViewControllerDelegate {
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        // SKStoreProductViewControllerを閉じる
        viewController.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
