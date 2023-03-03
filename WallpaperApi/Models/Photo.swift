//
//  Photo.swift
//  WallpaperApi
//
//  Created by Iván Sánchez Torres on 02/03/23.
//

import Foundation

struct Photo: Identifiable, Decodable, Hashable {
    var id: String
    var urls: [String : String]
}
