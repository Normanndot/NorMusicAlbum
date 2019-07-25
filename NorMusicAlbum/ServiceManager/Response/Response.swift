//
//  Response.swift
//  NorContact
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

struct Response {
    fileprivate var data: Data
    
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
