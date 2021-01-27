//
//  User.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: String
    var displayName: String
    var externalUrls: ExternalUrl?
    var followers: Follower?
    var href: String
    var images: [ImagePreview]
    var type: String
    var uri: String

    private enum CodingKeys: String, CodingKey {
        case id, displayName, externalUrls, followers, href, images, type, uri
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        displayName = try values.decode(String.self, forKey: .displayName)
        href = try values.decodeIfPresent(String.self, forKey: .href) ?? ""
        type = try values.decode(String.self, forKey: .type)
        uri = try values.decode(String.self, forKey: .uri)
        externalUrls = try values.decodeIfPresent(ExternalUrl.self, forKey: .externalUrls)
        followers = try values.decodeIfPresent(Follower.self, forKey: .followers)
        images = try values.decodeIfPresent([ImagePreview].self, forKey: .images) ?? []
    }
}

struct ImagePreview: Codable, Hashable {
    var height: Int?
    var url: String?
    var width: Int?
}

struct ExternalUrl: Codable, Hashable {
    var spotify: String
}

struct Follower: Codable, Hashable {
    var href: String
    var total: Int
}
