//
//  BookItemView.swift
//  Books
//
//  Created by zee on 1/29/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import SwiftUI

struct BookItemView: View {
    @Binding var bookItem : BookItem
    var body: some View {
        VStack {
            NavigationLink(destination:BookDetailsView(bookItem: $bookItem) , label: {
                HStack(alignment: .center, spacing: 15.0){
                    URLImageView(withURL: bookItem.imageURL)
                    VStack (alignment: .leading, spacing: 15.0){
                        Text("\(bookItem.title)")
                            .font(.headline)
                        Text("\(bookItem.author)")
                            .font(.subheadline)
                    }
                    Spacer()
                }
            })
                Spacer()
            }
        }
}

struct BookItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemView(bookItem: .constant(BookItem()))
    }
}


/*
 
 Image("book1")
                     .resizable()
                     .frame(minWidth: 60.0, idealWidth: 75.0, maxWidth: 95.0, minHeight: 80.0, idealHeight: 95.0, maxHeight: 110.0, alignment: .center)
                     .scaledToFit()
                     .cornerRadius(17.0)
 //                    .clipShape(Capsule())
                     .shadow(color: Color.black.opacity(5.0), radius: 5, x: 5, y: 5)
 
 */
