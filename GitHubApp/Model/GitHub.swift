//
//  GitHub.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 16/11/2023.
//

import Foundation

struct GitHub : Decodable {
    var name: String
    var avatarUrl: String
    var followers: Int
    var following: Int
}
