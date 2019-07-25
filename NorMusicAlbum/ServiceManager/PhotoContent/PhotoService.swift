//
//  ContactService.swift
//  NorContact
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

protocol PhotoService {
    func albumList(api: Api, _ completion: @escaping (_ content: [PhotoInfo]) -> Void)
}
