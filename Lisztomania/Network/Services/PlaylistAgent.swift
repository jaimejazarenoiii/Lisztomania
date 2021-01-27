//
//  PlaylistAgent.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/24/21.
//

import Foundation
import Combine

struct PlaylistAgent {
   private let agent = Agent()

    func getMyPlaylist(limit: Int = 10) -> AnyPublisher<Playlists, Error> {
        let request = URLRequest(router: PlaylistRouter.getAll, params: [:])

        return agent.run(request).map(\.value).eraseToAnyPublisher()
    }
}
