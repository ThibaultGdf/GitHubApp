//
//  GitHubView.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 27/09/2022.
//

import SwiftUI

struct GitHubModel : Decodable {
    
    var name : String
    var avatarUrl : String
    var followers : Int
    var following : Int
    
}


func getGitHubModel(name: String, completion:@escaping (GitHubModel) -> ()) {
    
    guard let url = URL(string: "https://api.github.com/users/\(name)")
    else {
        fatalError("Le serveur est indisponible ou l'url est invalide")
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data, error == nil else {
            DispatchQueue.main.async {
                fatalError("No data response")
                
            }
            return
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let informations = try decoder.decode(GitHubModel.self, from: data)
            DispatchQueue.main.async {
                completion(informations)
            }
        }
        catch {
            print("Success get item: \(error)")
        }
    }.resume()
}



