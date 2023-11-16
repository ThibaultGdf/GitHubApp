//
//  GitHubViewModel.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 16/11/2023.
//

import Foundation

@MainActor

// MARK: - GitHubViewModel

class GitHubViewModel: ObservableObject {
    // MARK: Properties
    @Published var gitHubData: GitHub?
    
    @Published var username: String = ""
    
    private let gitHubRepository: GitHubRepository
    // MARK: Initialization
    
    init(gitHubRepository: GitHubRepository) {
        self.gitHubRepository = gitHubRepository
    }
    
    // MARK: Methode
    func getGitHub(username: String) async throws {
        do {
            // Utilisez la fonction fetchGitHub de votre repository pour obtenir les données GitHub
            let gitHub = try await gitHubRepository.fetchGitHub(name: username)
            // Mise à jour de la variable publiée avec les données récupérées
            gitHubData = gitHub
        } catch {
            print("Erreur lors de la récupération des données GitHub: \(error.localizedDescription)")
        }
    }
}
