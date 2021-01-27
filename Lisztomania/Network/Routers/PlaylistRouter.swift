//
//  PlaylistRouter.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/24/21.
//

import Foundation

enum PlaylistRouter: ApiRouter {
    case getAll

    var path: String {
        switch self {
        case .getAll:
            return "/me/playlists"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getAll:
            return .get
        }
    }
}
