//
//  AboutViewController.swift
//  KatushaApp
//
//  Created by user155974 on 6/9/19.
//  Copyright © 2019 Ринат Муллахметов. All rights reserved.
//

import UIKit
import WebKit
class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView:WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html")
       {
        let url = URL(fileURLWithPath: htmlPath)
        let request = URLRequest(url:url)
        webView.load(request)
        }
    }
    @IBAction func closeButton(){
        dismiss(animated: true, completion: nil)
    }
}
