//
//  howToPreventCoronaViewController.swift
//  CoronaAlert
//
//  Created by Jonah Brandwagt on 03/03/2020.
//  Copyright © 2020 Jonah Brandwagt. All rights reserved.
//

import SwiftMessages
import UIKit

class howToPreventCoronaViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func maskInfo(_: Any) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.warning)
        view.configureDropShadow()
        let iconText = ["❌", "⌛", "✋"].randomElement()!
        // view.configureContent(title: "Logged Out", body: "You have succesfully been logged out!", iconText: iconText)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        view.configureContent(title: "Coming soon", body: "This feature will be available in a later update!", iconImage: nil, iconText: iconText, buttonImage: nil, buttonTitle: nil, buttonTapHandler: nil)
        SwiftMessages.show(view: view)
    }
}
