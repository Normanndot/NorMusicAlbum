//
//  PhotoInfoTableViewCell.swift
//  NorMusicAlbum
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import UIKit

class PhotoInfoTableViewCell: UITableViewCell {
    public static let reuseIdentifier = "PhotoInfoTableViewCell"
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    public var cellModel: PhotoCellModel? {
        didSet {
            if let imageURL = URL(string: cellModel?.thumbnailURL ?? "") {
                LazyLoader.sharedInstance.loadImage(albumImage, url: imageURL)
            }

            self.albumName.text = cellModel?.albumName
        }
    }
}
