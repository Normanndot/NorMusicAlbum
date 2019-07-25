//
//  API.swift
//  NorContact
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//


import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
}

enum Api {
    case photoList
}

extension Api: EndpointType {
    var baseURL: URL {
        return URL(string: "http://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .photoList:
            return "/photos"
        }
    }
}

