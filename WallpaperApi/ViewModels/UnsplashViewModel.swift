//
//  UnsplashViewModel.swift
//  WallpaperApi
//
//  Created by Iván Sánchez Torres on 02/03/23.
//

import Foundation

class UnsplashViewModel: ObservableObject {
    @Published var images: [[Photo]] = []
    
    init() {
        
        // Initial data
        updateData()
    }
    
    func updateData() {
        let key = "UyjgCz_-n2nN8Swui1eIa6Hwsyyfk8jnt8FtZJwfa3Q"
        let url = "https://api.unsplash.com/photos/random/?count=30&client_id=\(key)"
        
        let session = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
                return
            }
            
            do {
                let json = try JSONDecoder().decode([Photo].self, from: data!)
                print("JSON: \(json)")
                
                // to create a collection view, each row will has two views
                for i in stride(from: 0, to: json.count, by: 2) {
                    var arrayData: [Photo] = []
                    
                    for j in i..<i+2 {
                        // Index out bound
                        if j < json.count {
                            arrayData.append(json[j])
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.images.append(arrayData)
                    }
                }
            } catch {
                print(String(describing: error))
            }
        }.resume()
    }
}
