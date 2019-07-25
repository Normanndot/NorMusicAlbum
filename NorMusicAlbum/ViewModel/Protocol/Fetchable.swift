//
//  Fetchable.swift
//  NorContact
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

protocol Fetchable {
    func fetchPhotoList(completion: @escaping () -> ())
}

extension Fetchable {
    func fetchPhotoList(completion: @escaping () -> ()) {
        completion()
    }
}

protocol CellModelFeatchable {
    func cellModel(index: Int) -> PhotoCellModel?
}
