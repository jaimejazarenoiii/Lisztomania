//
//  PlaylistReducer.swift
//  SwiftUINewArchitecture
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import Foundation
import Combine

func playlistReducer(state: inout PlaylistState,
                    action: PlaylistAction,
                    environment: World) -> AnyPublisher<PlaylistAction, Never> {
    switch action {
    case .setList(let playlists):
        state.playlists = playlists
    case .getList:
        return environment.playlistAgent.getMyPlaylist()
            .assertNoFailure()
            .map { PlaylistAction.setList(playlists: $0.items) }
            .eraseToAnyPublisher()
    }

    return Empty().eraseToAnyPublisher()
}
