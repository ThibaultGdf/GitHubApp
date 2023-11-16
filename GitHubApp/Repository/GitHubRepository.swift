//
//  GitHubView.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 27/09/2022.
//

import SwiftUI

// MARK: - GitHubRepository

class GitHubRepository {
    
    func fetchGitHub(name: String) async throws -> GitHub {
        guard let url = URL(string: "https://api.github.com/users/\(name)")
        else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("Error while fetching data")
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let informations = try decoder.decode(GitHub.self, from: data)
            return informations
        }
        catch {
            print("Success get item: \(error)")
            throw error
        }
    }
}
