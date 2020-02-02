//
//  WebView.swift
//  Books
//
//  Created by zee on 1/30/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    @State var url: String = ""
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView:WKWebView, context:Context) {
        
    }
}
