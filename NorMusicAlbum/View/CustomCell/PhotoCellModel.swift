//
//  PhotoCellModel.swift
//  NorMusicAlbum
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

struct PhotoCellModel {

    private let photoInformation: PhotoInfo?
    
    init(with photoInfo: PhotoInfo) {
        self.photoInformation = photoInfo
    }
    
    var thumbnailURL: String {
        return photoInformation?.thumbnailUrl ?? String()
    }
    
    var albumName: String {
        return photoInformation?.title ?? String()
    }
    
    var imageURL: String {
        return photoInformation?.url ?? String()
    }
}
