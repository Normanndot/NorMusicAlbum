//
//  ServiceProvider.swift
//  NorContact
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

protocol Request {
    func getWithURL(_ api: Api, completionHandler: @escaping (_ data: Any?, _ error: Error?) -> Void) -> Task?
}

class ServiceProvider: Request {
    
    // MARK: - Internal functions
    func getWithURL(_ api: Api, completionHandler: @escaping (Any?, Error?) -> Void) -> Task? {
        let task = HttpTask()
        
        task.performNetworkTask(endpoint: api) { (data, error) in
            if error == nil {
                completionHandler(data, nil)
                return
            }
            
            completionHandler(nil, error)
        }
        
        return HttpTask()
    }
    
}
