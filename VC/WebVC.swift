//
//  WebVC.swift
//  GundamMobile
//
//  Created by YiChao Qin on 12/1/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import UIKit
import  WebKit
class WebVC: UIViewController {

    var officalsite: String?
    @IBOutlet weak var Browser: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
       officalsite = "https://sites.google.com/site/msgoenglish/"
        loadRequest()

        
    }
    
    func loadRequest() {
        
        if let address = officalsite, let url = URL(string: address) {
            let request = URLRequest(url: url)
            Browser.load(request)
        }
    }
    
    

}
