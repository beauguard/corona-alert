//
//  ViewController2.swift
//  CoronaAlert
//
//  Created by Jonah Brandwagt on 01/03/2020.
//  Copyright © 2020 Jonah Brandwagt. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet var webView2: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView2.layer.cornerRadius = 15
        webView2.loadRequest(NSURLRequest(url: NSURL(string: "https://twitter.com/search?q=%23Coronavirusnl&src=typeahead_click&f=live") as! URL) as URLRequest)
        webView2.layer.cornerRadius = 15
        webView2.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
}
