//
//  ContentServiceProvider.swift
//  NorContact
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

class PhotoServiceProvider: ServiceProvider, PhotoService, MockPhotoService {
    private let fileName = "photos.json"
    
    func albumList(api: Api, _ completion: @escaping ([PhotoInfo]) -> Void) {
        
        _ = getWithURL(api) { (data, error) in
            if error != nil {
                // Retrive the stored data to load again if user tries to open in Airplane mode
                // TODO: - Based on the response(if anything changes),
                // we will skip the below retrival process and again write it to the directory
                
                if Storage.fileExists(self.fileName, in: .documents) {
                    completion(Storage.retrieve(self.fileName, from: .documents, as: [PhotoInfo].self))
                    return
                }
            }
            
            if let data = data as? Data {
                let response = Response(data: data)
                guard let decoded = response.decode([PhotoInfo].self) else {
                    return
                }

                // Store the data offline to load again if user tries to open in Airplane mode
                Storage.store(decoded, to: .documents, as: self.fileName)
                completion(decoded)
            } else {
                // Error condition when at the intial launch itself if user tries to open and launch the app
                // Just Mocking the data for testing purpose
                completion(self.getLocalPhotoData())
            }
        }
    }
    
    func getLocalPhotoData() -> [PhotoInfo] {
        if let path = Bundle.main.path(forResource: "photos", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            
            do {
                let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
                let response = Response(data: data)
                guard let decoded = response.decode([PhotoInfo].self) else {
                    return []
                }
                
                return decoded
            } catch {
                print("Error in parsing data")
            }
        }
        
        return []
    }
}
