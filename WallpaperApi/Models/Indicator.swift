//
//  Indicator.swift
//  WallpaperApi
//
//  Created by Iván Sánchez Torres on 02/03/23.
//

import Foundation
import SwiftUI

struct Indicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
