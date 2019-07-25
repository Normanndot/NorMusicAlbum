//
//  Task.swift
//  NorContact
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//
import Foundation

protocol Task {
    func performNetworkTask(endpoint: Api, completion: ((_ response: Any?, _ error: Error?) -> Void)?)
    func performNetworkTask(endpoint: Api, responeBody: Data, completion: ((_ response: Any?, _ error: Error?) -> Void)?)
    func cancel()
}

enum HTTPsMethod: String {
    case GET = "GET", POST = "POST", PUT = "PUT"
}
