//
//  PhotoVMProtocol.swift
//  NorMusicAlbum
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

protocol PhotoVMProtocol {
    var list: [PhotoInfo]? { get set }
    func count() -> Int
}
