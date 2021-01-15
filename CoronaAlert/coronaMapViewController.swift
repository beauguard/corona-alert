//
//  coronaMapViewController.swift
//  CoronaAlert
//
//  Created by Jonah Brandwagt on 03/03/2020.
//  Copyright © 2020 Jonah Brandwagt. All rights reserved.
//

import UIKit

class coronaMapViewController: UIViewController {
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://localfocus2.appspot.com/5e60d6e7bfb6f")!
        webView.loadRequest(URLRequest(url: url))
        webView.scrollView.isScrollEnabled = false

        // Do any additional setup after loading the view.
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
