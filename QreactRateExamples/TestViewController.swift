//
//  TestViewController.swift
//  QreactRateExamples
//
//  Created by Huseyn Bayramov on 10/20/19.
//  Copyright © 2019 Huseyn I. Bayramov. All rights reserved.
//

import UIKit
import QreactRate

class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        let popup = ReviewPopup()
        self.navigationController?.view.addSubview(popup)
    }
}

