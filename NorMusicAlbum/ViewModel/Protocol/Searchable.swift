//
//  Searchable.swift
//  NorMusicAlbum
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

protocol Searchable {
    func search(with albumName: String) -> [PhotoInfo]
}
