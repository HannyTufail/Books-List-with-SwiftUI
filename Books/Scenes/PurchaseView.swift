//
//  PurchaseView.swift
//  Books
//
//  Created by zee on 1/30/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import SwiftUI

struct PurchaseView: View {
    @State var isWebViewPresented : Bool
    @State var isLoading : Bool
    @Binding var bookItem: BookItem
    @State var databaseLink: String = Constants.kPING_URL

    var body: some View {
        HStack{
            ForEach(bookItem.purchaseLinks, id: \.id) { link in
                Button(action: {
                    self.isWebViewPresented.toggle()
                    self.isLoading.toggle()
                    self.databaseLink = link.url
                }) {
                    Image(systemName: "mappin.and.ellipse")
                    Text("\(link.name)")
                }.sheet(isPresented: self.$isWebViewPresented) {
                    
                    BuyLinkWebView(url: self.databaseLink, isLoading: self.isLoading)
                }
            }
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView(isWebViewPresented: false, isLoading: false, bookItem: .constant(BookItem()))
    }
}

