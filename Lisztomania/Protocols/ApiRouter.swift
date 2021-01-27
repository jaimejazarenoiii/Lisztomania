//
//  ApiRouter.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import Foundation

protocol ApiRouter {
    var path: String { get }
    var method: HTTPMethod { get }
}
