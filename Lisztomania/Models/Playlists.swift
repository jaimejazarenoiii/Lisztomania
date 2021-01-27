//
//  Playlists.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/24/21.
//

import Foundation

struct Playlists: Codable {
    var href: String!
    var items: [Playlist]

    struct Playlist: Codable, Identifiable, Hashable {
        var collaborative: Bool
        var description: String
        var primaryColor: String?
        var externalUrls: ExternalUrl
        var href: String!
        var id: String
        var images: [ImagePreview]
        var name: String
        var owner: User
        var `public`: Bool
        var snapshotId: String
        var tracks: TracksShortInfo
        var type: String
        var uri: String

        static func == (lhs: Playlists.Playlist, rhs: Playlists.Playlist) -> Bool {
            lhs.id == rhs.id
        }
    }
}

struct TracksShortInfo: Codable, Hashable {
    var href: String!
    var total: Int
}
