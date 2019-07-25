//
//  HTTPTask.swift
//  NorContact
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import Foundation

class HttpTask: Task {
    
    // MARK: - Properties
    
    fileprivate var dataTask: URLSessionDataTask?
    
    // MARK: - Task Protocol implementation
    func performNetworkTask(endpoint: Api, completion: ((Any?, Error?) -> Void)?) {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        
        dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, urlResponse, error) in
            
            if let _ = error {
                completion?(nil, error)
                return
            }
            
            guard let localData = data else {
                return
            }
            
            completion?(localData, nil)
        }
        
        dataTask?.resume()
        
    }
    
    //MARK: - Assuming any post call should be handled
    func performNetworkTask(endpoint: Api, responeBody: Data, completion: ((Any?, Error?) -> Void)?) {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPsMethod.POST.rawValue
        urlRequest.httpBody = responeBody
        dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            
            if let _ = error {
                completion?(nil, error)
                return
            }
            
            guard let localData = data else {
                return
            }
            
            completion?(localData, nil)
        }
        
        dataTask?.resume()
    }
    
    func cancel() {
        dataTask?.cancel()
    }
}
