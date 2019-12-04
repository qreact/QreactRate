//
//  ContentView.swift
//  QreactRateExamples
//
//  Created by Huseyn I. Bayramov on 10/3/19.
//  Copyright © 2019 Huseyn I. Bayramov. All rights reserved.
//

import SwiftUI
import QreactRate

struct ContentView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ContentView>) -> UIView {
        let rate = ReviewPopup()
        return rate
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<ContentView>) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some UIViewRepresentable {
        ContentView()
    }
}
