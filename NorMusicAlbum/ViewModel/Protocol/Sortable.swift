//
//  Sortable.swift
//  NorMusicAlbum
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

protocol Sortable {
    func sortByAlbumID(id: Int) -> [PhotoInfo]
    func sortByID(id: Int) -> [PhotoInfo]
}
