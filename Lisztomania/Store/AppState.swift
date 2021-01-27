//
//  AppState.swift
//  SwiftUINewArchitecture
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import Foundation

struct AppState {
    var playlist: PlaylistState

    init() {
        self.playlist = PlaylistState(playlists: [])
    }
}
