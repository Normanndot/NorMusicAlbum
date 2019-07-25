//
//  PhotoVM.swift
//  NorMusicAlbum
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

class PhotoVM: NSObject, PhotoVMProtocol, Fetchable {
    var list: [PhotoInfo]?
    var refreshCompleted:((String?) -> Void)?

    func count() -> Int {
        return self.list?.count ?? 0
    }
    
    @objc func refresh() {
        ServiceManager.photoService.albumList(api: Api.photoList) { (list) in
            self.list = list
            self.refreshCompleted?("")
        }
    }
    
    func fetchPhotoList(completion: @escaping () -> ()) {
        ServiceManager.photoService.albumList(api: Api.photoList) { (list) in
            self.list = list
            completion()
        }
    }
}

extension PhotoVM: CellModelFeatchable {
    func cellModel(index: Int) -> PhotoCellModel? {
        if let aModel = self.list?[index] {
            return PhotoCellModel(with: aModel)
        }
        
        return nil
    }
}

//MARK: - Assuming at some case user will try to sort the list

extension PhotoVM: Sortable {
    func sortByAlbumID(id: Int) -> [PhotoInfo] {
        return self.list?.sorted(by: { (p1, p2) -> Bool in
            return p1.albumId > p2.albumId
        }) ?? []
    }
    
    func sortByID(id: Int) -> [PhotoInfo] {
        return self.list?.sorted(by: { (p1, p2) -> Bool in
            return p1.id > p2.id
        }) ?? []
    }
}

//MARK: - Assuming at some case user will try to search based on name of the album

extension PhotoVM: Searchable {
    func search(with albumName: String) -> [PhotoInfo] {
        return self.list?.filter({$0.title.contains(albumName)}) ?? []
    }
}
