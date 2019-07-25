//
//  AlbumDetailInfoVC.swift
//  NorMusicAlbum
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import UIKit

class AlbumDetailInfoVC: UIViewController {
    static let storyBoardIdentifier = "AlbumDetailInfoVC"
    @IBOutlet weak var detailImageView: UIImageView!
    
    public var cellModel: PhotoCellModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Album Information"
        // Do any additional setup after loading the view.
        if let imageURL = URL(string: cellModel?.imageURL ?? "") {
            LazyLoader.sharedInstance.loadImage(detailImageView, url: imageURL)
        }
    }
}
