//
//  ImagesViewModel.swift
//  Books
//
//  Created by zee on 2/2/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import Foundation
class ImagesViewModel: ObservableObject {
    @Published var dataIsValid = false
    var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.dataIsValid = true
                self.data = data
            }
        }
        task.resume()
    }
}
