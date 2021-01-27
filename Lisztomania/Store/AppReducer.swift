//
//  AppReducer.swift
//  SwiftUINewArchitecture
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import Foundation
import Combine

func appReducer(state: inout AppState,
                action: AppAction,
                environment: World) -> AnyPublisher<AppAction, Never> {
    switch action {
    case let .playlist(action):
        return playlistReducer(state: &state.playlist,
                               action: action,
                               environment: environment)
            .map(AppAction.playlist)
            .eraseToAnyPublisher()
    }
}
