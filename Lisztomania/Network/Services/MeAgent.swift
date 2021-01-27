//
//  MeAgent.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import Foundation
import Combine

struct MeAgent {
    static let agent = Agent()
}

extension MeAgent {
    static func getMyProfile(params: [String: Any]) -> AnyPublisher<User, Error> {
        let request = URLRequest(router: MeRouter.me, params: params)
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
