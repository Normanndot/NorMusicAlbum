//
//  PhotoInfo.swift
//  NorMusicAlbum
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
