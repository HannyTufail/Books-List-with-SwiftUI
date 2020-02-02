//
//  ContentView.swift
//  Books
//
//  Created by zee on 1/28/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import SwiftUI

enum FilterType: String, CaseIterable {
    case title = "Title"
    case rank = "Rank"
    case weeks = "Weeks on List"
}

struct ContentView: View {
    
    @State var filterSelectedItem = 0
    @ObservedObject var booksVM = BooksViewModel()
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.8608401418, green: 0.7629511356, blue: 0.6345154047, alpha: 1)).edgesIgnoringSafeArea(.all)
            NavigationView {
                VStack{
                    Picker(selection: $booksVM.selection, label: Text("Filter Options")) {
                        ForEach(FilterType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal, 24)
                    
                    List(self.booksVM.booksData.books){ item in
                        BookItemView(bookItem: .constant(item))
                    }
                    Spacer()
                    CopyrightsView(totalResults: "\(self.booksVM.booksData.books.count)", publishedDate: "\(self.booksVM.booksData.publishedDate)")
                }
                
            .navigationBarTitle(Text("Fiction Books"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView()
        }
    }
}
