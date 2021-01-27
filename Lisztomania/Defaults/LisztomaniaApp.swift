//
//  LisztomaniaApp.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import SwiftUI
import Combine
let spotifyClientID = ""
let spotifyRedirectURL = URL(string: "")!
let config: SPTConfiguration = SPTConfiguration(clientID: spotifyClientID, redirectURL: spotifyRedirectURL)
let appRemote = SPTAppRemote(configuration: config, logLevel: SPTAppRemoteLogLevel.debug)
var accessToken = ""
@main
struct LisztomaniaApp: App {
    let store = AppStore(initialState: .init(), reducer: appReducer, environment: World())
    var homeView = HomeView()
    var body: some Scene {
        WindowGroup {
            homeView
                .onAppear() {
                    guard accessToken.isEmpty else { return }
                    setupSpotify()
                }
                .onOpenURL { url in
                    let params = appRemote.authorizationParameters(from: url)
                    guard let token = params?[SPTAppRemoteAccessTokenKey] else { return }
                    appRemote.connectionParameters.accessToken = token
                    accessToken = token
                    store.send(.playlist(action: .getList))
                }
                .environmentObject(store)
        }
    }

    private func setupSpotify() {
        let _ = appRemote.authorizeAndPlayURI("spotify:track:7zkDEBSxkcBVsStS4qBFpK")
    }
}
