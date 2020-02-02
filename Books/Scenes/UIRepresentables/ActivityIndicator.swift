//
//  ActivityIndicator.swift
//  Books
//
//  Created by zee on 1/30/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

   typealias UIView = UIActivityIndicatorView
   @Binding var isAnimating: Bool
    var configuration = { (indicator: UIView) in }

    func makeUIView(context: Context) -> UIView { UIView() }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}

extension View where Self == ActivityIndicator {
    func configure(_ configuration: @escaping (Self.UIView)->Void) -> Self {
        Self.init(isAnimating: .constant(self.isAnimating), configuration: configuration)
    }
}
