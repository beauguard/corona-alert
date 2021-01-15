//
//  ViewController.swift
//  CoronaAlert
//
//  Created by Jonah Brandwagt on 01/03/2020.
//  Copyright © 2020 Jonah Brandwagt. All rights reserved.
//

import Firebase
import Foundation
import SwiftMessages
import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet var totalCases: UILabel!
    @IBOutlet var deaths: UILabel!
    @IBOutlet var recovered: UILabel!
    @IBOutlet var activeCases: UILabel!
    @IBOutlet var activeCasesMild: UILabel!
    @IBOutlet var activeCasesCritical: UILabel!

    @IBOutlet var casesNL: UILabel!
    @IBOutlet var deathsNL: UILabel!
    @IBOutlet var recoveredNL: UILabel!
    @IBOutlet var activeCasesNL: UILabel!
    @IBOutlet var activeCasesMildNL: UILabel!
    @IBOutlet var activeCasesCriticalNL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.covid19api.com/summary")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
            } else {
                do {
                    
                    let json = try JSON(data: data!)
                    print(json["Global"]["TotalConfirmed"])
                    
                    DispatchQueue.main.async {
                        self.totalCases.text = "\(Int("\(json["Global"]["TotalConfirmed"])")!.formattedWithSeparator)"
                        self.deaths.text = "\(Int("\(json["Global"]["TotalDeaths"])")!.formattedWithSeparator)"
                        self.recovered.text = "\(Int("\(json["Global"]["TotalRecovered"])")!.formattedWithSeparator)"
                        self.activeCases.text = "\((Int("\(json["Global"]["TotalConfirmed"])")! - Int("\(json["Global"]["TotalRecovered"])")! - Int("\(json["Global"]["TotalDeaths"])")!).formattedWithSeparator)"
                        self.activeCasesMild.text = "\(Int("\(json["Global"]["NewConfirmed"])")!.formattedWithSeparator)"
                        self.activeCasesCritical.text = "\(Int("\(json["Global"]["NewDeaths"])")!.formattedWithSeparator)"
                        
                        if let countries = json["Countries"].array {
                           for weightItem in countries {
                             let countryName = weightItem["Country"].stringValue
                            if(countryName == "Netherlands") {
                                print(weightItem)
                                self.casesNL.text =  "\(Int("\(weightItem["TotalConfirmed"])")!.formattedWithSeparator)"
                                self.deathsNL.text = "\(Int("\(weightItem["TotalDeaths"])")!.formattedWithSeparator)"
                                self.recoveredNL.text =  "\(Int("\(weightItem["TotalRecovered"])")!.formattedWithSeparator)"
                                self.activeCasesNL.text = "\((Int("\(weightItem["TotalConfirmed"])")! - Int("\(weightItem["TotalDeaths"])")! - Int("\(weightItem["TotalRecovered"])")!).formattedWithSeparator)"
                                self.activeCasesMildNL.text =  "\(Int("\(weightItem["NewConfirmed"])")!.formattedWithSeparator)"
                                self.activeCasesCriticalNL.text =  "\(Int("\(weightItem["NewDeaths"])")!.formattedWithSeparator)"
                            }
                           }
                         }
                        
                    }
                } catch { }
            }
        })

        dataTask.resume()
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
