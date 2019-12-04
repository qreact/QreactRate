//
//  UIViewController.swift
//  QreactRateExamples
//
//  Created by Huseyn I. Bayramov on 12/4/19.
//  Copyright © 2019 Huseyn I. Bayramov. All rights reserved.
//

import UIKit
import QreactRate

class UIVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rate = ReviewPopup()
        view.addSubview(rate)
    }
}
