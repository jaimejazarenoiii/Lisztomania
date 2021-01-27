//
//  AgentRequest.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import Foundation

enum HTTPMethod: String {
    case get, post, patch, put, delete

    var value: String {
        rawValue.uppercased()
    }
}
