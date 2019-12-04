//
//  ReviewViewModel.swift
//  BankOfBakuApp
//
//  Created by Huseyn Bayramov on 7/1/19.
//  Copyright © 2019 Jeyhun Danyaloff. All rights reserved.
//

import UIKit

public final class ReviewViewModel {
    
    func notNowBtnClick() {
        UserDefaults.standard.set("notnow", forKey: "review")
    }
    
     func reviewStarClick(rate: Int) {
        UserDefaults.standard.set(rate, forKey: "lastRate")
        UserDefaults.standard.set(1, forKey: "appOpenedCount")
        if rate <= 3 {
            guard let url = URL(string: "Reviewqreact") else { return }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                // Fallback on earlier versions
            }
        } else {
            UserDefaults.standard.set("review", forKey: "starred")
            guard let url = URL(string: "storeurl") else { return }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
