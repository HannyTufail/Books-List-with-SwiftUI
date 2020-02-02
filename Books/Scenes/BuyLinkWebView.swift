//
//  BuyLinkWebView.swift
//  Books
//
//  Created by zee on 2/2/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import SwiftUI

struct BuyLinkWebView: View {
    @State var url: String
    @State var isLoading : Bool
    
    var body: some View {
        ZStack{
            WebView(url: self.url)
            ActivityIndicator(isAnimating: .constant(self.isLoading))
                .configure{indicator in
                    indicator.color = .yellow
                    indicator.hidesWhenStopped = true
                }
            .padding()
            .background(Color.blue.opacity(0.5))
            .cornerRadius(100.0)
        }
    }
}

struct BuyLinkWebView_Previews: PreviewProvider {
    static var previews: some View {
        BuyLinkWebView(url: Constants.kPING_URL, isLoading: false)
    }
}
