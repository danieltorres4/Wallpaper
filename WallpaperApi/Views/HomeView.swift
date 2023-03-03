//
//  HomeView.swift
//  WallpaperApi
//
//  Created by Iván Sánchez Torres on 02/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @State var expand: Bool = false
    @State var search: String = ""
    @ObservedObject var unsplashViewModel = UnsplashViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                // This part will be hidden when search bar is expanded
                if !self.expand {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Amazing Wallpapers")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Free Photos")
                            .font(.caption)
                    }
                    .foregroundColor(.black)
                }
                
                
                Spacer(minLength: 0)
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation {
                            expand = true
                        }
                    }
                
                // Displaying the search bar when expanded is true
                if self.expand {
                    TextField("Search", text: $search)
                    // Close Button
                    
                    
                    // Displaying search button when search text is not empty
                    if self.search != "" {
                        Button(action: {
                            // Searching content...
                            
                        }) {
                            Text("Find")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Button(action: {
                        withAnimation {
                            expand = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 10)
                }
            }
                .padding(.top)
                .padding()
                .background(Color.white)
            
            if unsplashViewModel.images.isEmpty {
                // Data is loading or has no data
                Spacer()
                Indicator()
                Spacer()
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    // CollectionView
                    VStack(spacing: 15) {
                        
                        ForEach(self.unsplashViewModel.images, id: \.self) { i in
                            
                            HStack(spacing: 20) {
                                
                                ForEach(i) { j in
                                    
                                    AnimatedImage(url: URL(string: j.urls["thumb"]!))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        //.frame(width: 100, height: 200)
                                        .cornerRadius(15)
                                        .contextMenu {
                                            //Save Button
                                            Button(action: {
                                                
                                            }) {
                                                HStack {
                                                    Text("Save")
                                                    Spacer()
                                                    Image(systemName: "square.and.arrow.down.fill")
                                                }
                                                .foregroundColor(.black)
                                            }
                                        }
                                }
                            }
                        }
                    }
                    .padding(.top)
                }
            }
        }
        .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
        //.edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
