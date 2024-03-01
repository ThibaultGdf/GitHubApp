//
//  UserResponse.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 16/11/2023.
//

import Foundation

struct UserResponse : Decodable {
    let name: String
    let avatarUrl: String
    let followers: Int
    let following: Int
	
	enum CodingKeys: String, CodingKey {
		case name
		case avatarUrl = "avatar_url"
		case followers
		case following
	}
}
