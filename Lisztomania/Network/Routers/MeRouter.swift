//
//  MeRouter.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import Foundation

enum MeRouter: ApiRouter {
    case me
    case editProfile

    var path: String {
        switch self {
        case .me:
            return "/me"
        case .editProfile:
            return "/editProfile"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .me:
            return .get
        case .editProfile: return .post
        }
    }
}
