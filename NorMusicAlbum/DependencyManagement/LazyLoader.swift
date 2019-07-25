//
//  LazyLoader.swift
//  NorContact
//
//  Created by MacBook on 7/24/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

protocol ImageLoader {
    func loadImage(_ imageView: UIImageView, url : URL)
}

// Final - So that no one can subclass it and wo't be able to create a separate instance as it was intialized as private
final class LazyLoader: ImageLoader {
    
    static let sharedInstance = LazyLoader()
    
    private init() {
        
    }
    
    func loadImage(_ imageView: UIImageView, url: URL) {
        imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder_photo"))
    }
}
